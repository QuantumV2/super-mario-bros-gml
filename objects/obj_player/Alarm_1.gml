movefrozen = false
global.cutscene++;
room_goto(asset_get_index(string_delete(room_get_name(room), 10, 9)))