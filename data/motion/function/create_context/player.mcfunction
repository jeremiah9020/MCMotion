function motion:stop
function motion:create_context {opts:{vel:[0d,0d,0d], fall_damage: true, damp:0, drag:0.98d, friction: [1d, 0.25d, 1d]}}
function motion:add_force/gravity
tag @s add motion.mode.player