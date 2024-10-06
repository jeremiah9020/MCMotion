# Motion

A library for giving a player motion by putting them into a cart and editing the cart's motion. Uses the experimental minecart changes.

## Ideas

### Contexts

When you want to apply motion to a player, you first need to create a context. A context stores the following information: velocity, drag, damping, friction, and cancellation options. Only a single context can be applied to a player, but you can update the context. If you want to know if a player is already in a context, use the predicate `motion:in_context`.

### Velocity

Velocity is the change in position over time (1m/s)

### Drag

Drag, in this system, is specifically a factor that should be between 0 and 1, which will multiply the players velocity every tick. A drag of 1 will not slow the player at all, where as a drag of 0 will stop the player immediately.

### Damping

Damping, in this system, controls bounciness and should be between 0 and 1. When you collide with a block on any axis, your velocity on that axis will be reversed and multiplied by your damping. If your damping is 1, the velocity going into the collision will be the same coming out. If your damping is 0, you will not bounce at all.

### Friction

Friction, like drag, is a factor that should be between 0 and 1, which will multiply the players velocity on a given axis for every tick in which there is a collision on another axis. For instance, if you are colliding with the ground, your X and Z velocities will be multiplied by your Y friction.

### Cancellation

There are certain times you might want a player to exit their context without specifically running the stop command. Specifically, I have enabled the ability to exit the context on death, on ground, on stop, and when their speed meets a given threshold.

### Forces

Forces are acceleration, which will update the players velocity every tick.

### Continuity

When you first create a context for a player, if you want their velocity to be maintained, enable continuity.

## Commands

### motion:create_context

Sets up the player's context

```
function motion:create_context {
    opts: {
        continuity: boolean?
        vel: [double, double, double]?,
        drag: double?,
        damping: double?,
        fall_damage: boolean?,
        friction: [double, double, double]?,
        cancel: {
            stop: boolean?
            ground: boolean?
            death: boolean?
            speed: double?
        }
    }
}
```

### motion:update_context

Updates an existing context 

```
function motion:update_context {
    opts: {
        continuity: boolean?
        vel: {
            x: double?
            y: double?
            z: double?
        },
        drag: double?,
        damping: double?,
        fall_damage: boolean?,
        friction: {
            x: double?
            y: double?
            z: double?
        },
        cancel: {
            stop: boolean?
            ground: boolean?
            death: boolean?
            speed: double?
        }
    }
}
```

### motion:add_force

Adds a force to the player. Can optionally include a duration (in ticks).

```
function motion:add_force {
    id: string
    opts: {
        acc: [double, double, double],
        duration: int?
    }
}
```

### motion:remove_force

Removes a force from the player by id.

```
function motion:remove_force {
    id: string
}
```

### motion:stop

Cancels a context

```
function motion:stop
```

## Attributions

[Math Library](https://github.com/gibbsly/gm)