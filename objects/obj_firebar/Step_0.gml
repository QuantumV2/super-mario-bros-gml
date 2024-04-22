for (var i = 0; i < firebar_length; i++) {
    var angle = image_angle;
    var total_distance = fireball_distance + spacing * i;  // calculate total distance for each fireball
    var fireball_x = origin_x + lengthdir_x(total_distance, angle) + 8;
    var fireball_y = origin_y + lengthdir_y(total_distance, angle) + 8;

    // Check for existing fireball instances and update positions
    if (instance_exists(fireballs[i])) {
        fireballs[i].x = fireball_x;
        fireballs[i].y = fireball_y;
    }
}
