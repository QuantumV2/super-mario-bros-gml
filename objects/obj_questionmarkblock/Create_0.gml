object = -1
palarray = []

spr_pal = spr_coinpal

palselect = 1
shinedir = 1

event_inherited()
sprite_index = array_contains(global.undergroundlevels, room) ? spr_questionblockunderground : spr_questionblock
changetosprite = array_contains(global.undergroundlevels, room) ? spr_usedblockunderground : spr_usedblock