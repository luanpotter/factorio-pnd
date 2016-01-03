require "util"
require "defines"

local dir_to_direction = { 8, 1, 2, 7, -1, 3, 6, 5, 4 }
local direction_to_dir = { 2, 6, 8, 4 }

entity_click = remote.call("wrench.events", "entity_click")

local function pos_eq(p1, p2)
  return p1.x == p2.x and p1.y == p2.y
end

local function placer_at(pos)
  for i = 1, #global['placers'] do
    local placer = global['placers'][i]
    if pos_eq(placer.entity.position, pos) then
      return placer
    end
  end
end

local function destroy_children(el)
  local names = el.children_names
  for i = 1, #names do
    el[names[i]].destroy()
  end
end

local function create_checkboxes(main, placer)
  local arrows = { '\\', '/\\', '/', '<', '.', '>', '/', '\\/', '\\' }
  for i = 1,9 do
    if i == 5 then
      main.add{type="label", caption=arrows[i], name=tostring(i)}
    else
      main.add{type="checkbox", caption=arrows[i], state=(placer.outDir == i), name=tostring(i)}
    end
  end
end

script.on_event(entity_click, function (e)
  local player = e.player
  local entity = e.entity

  if entity.name:match("pnd%-placer%-.+") then
    local placer = placer_at(entity.position)
    global['open_gui'] = placer
    local frame = player.gui.center.add{type="frame", name="wrench", direction="vertical"}
    frame.add{type="label", caption="Placer", style="caption_label_style"}
    frame.add{type="label", caption="Orientation"}
    local main = frame.add{type="table", colspan=3, name="pnd-placer-table"}
    create_checkboxes(main, placer)
  end
end)

script.on_event(defines.events.on_gui_click, function (event)
  local el = event.element
  local parent = el.parent
  if parent.name == 'pnd-placer-table' then
    local placer = global['open_gui']
    placer.outDir = tonumber(el.name)
    destroy_children(parent)
    create_checkboxes(parent, placer)
  end
end)

script.on_init(function()
  global['placers'] = {}
  global['destroyers'] = {}
end)

script.on_event(defines.events.on_tick, function()
  local print = game.players[1].print

  for i = 1, #global['placers'] do
    local placer = global['placers'][i].entity
    local inv = placer.get_inventory(1)
    if inv.get_item_count() > 0 then
      local item = inv[1]
      local place_result = game.item_prototypes[item.name].place_result

      if place_result then
        local w = place_result.collision_box.right_bottom.x - place_result.collision_box.left_top.x
        local h = place_result.collision_box.right_bottom.y - place_result.collision_box.left_top.y
        local dirs = { {0, -h}, {1, 0}, {0, 1}, {-w, 0} }
        local dir = global['placers'][i].dir

        placer.surface.create_entity({
          name = place_result.name,
          position = {placer.position.x + dirs[dir][1], placer.position.y + dirs[dir][2]},
          force = placer.force,
          direction = dir_to_direction[global['placers'][i].outDir]
        })
        inv.remove(item)
      end
    end
  end
end)

script.on_event(defines.events.on_built_entity, function(event)
  local player = game.get_player(event.player_index)
  local print = player.print
  local created_entity = event.created_entity
  local surface = created_entity.surface

  if created_entity.name == "pnd-placer-placeholder" then
    local dir = created_entity.direction / 2 + 1
    local dirs = { "up", "right", "down", "left" }
    local proper_chest = {
      name = "pnd-placer-" .. dirs[dir],
      position = created_entity.position,
      force = created_entity.force
    }
    created_entity.destroy()
    proper_chest = surface.create_entity(proper_chest)
    global['placers'][#global['placers'] + 1] = {
      dir = dir,
      outDir = direction_to_dir[dir],
      entity = proper_chest
    }
  elseif created_entity.name == "pnd-destroyer-placeholder" then
    global['destroyers'][#global['destroyers'] + 1] = proper_chest
  end
end)

local function delete(event)
  local entity = event.entity
  local placers = global['placers']

  local displace = false
  for i = 1, #placers do
    if displace then
      placers[i] = placers[i + 1]
    else
      local placer = placers[i]
      if pos_eq(placer.entity.position, entity.position) then
        placers[i] = placers[i + 1]
        displace = true
      end
    end
  end
end

script.on_event(defines.events.on_entity_died, delete)
script.on_event(defines.events.on_preplayer_mined_item, delete)
