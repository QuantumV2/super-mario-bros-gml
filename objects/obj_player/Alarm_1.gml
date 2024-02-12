movefrozen = false
global.cutscene++;
obj_camera.timerfrozen = false
obj_camera.timer = 400
room_goto(asset_get_index(string_delete(room_get_name(room), 10, 9)))