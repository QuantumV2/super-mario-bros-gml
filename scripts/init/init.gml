global.paused = false
global.forcepaused = false
global.music = -1
global.font = font_add_sprite_ext(spr_font, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-x!.©", false, 0)
global.luigi = false
display_set_gui_size(SCREENWIDTH, SCREENHEIGHT);
#macro SCREENWIDTH 256
#macro SCREENHEIGHT 240
global.world = 1
global.level = 4
global.lives = [3, 3]
global.coins = 0
global.cutscene = 0
global.undergroundlevels = [transition, mario_1_1_subarea, mario_1_2, mario_1_2_subarea]
global.powerup = [0,0]
global.twoplayer = false
global.scores = [0, 0]