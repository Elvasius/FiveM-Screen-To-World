# FiveM-Screen-To-World

Resource allowing to find the position of the cursor in the game world. Currently only works with scripted camera's by setting the camHandle variable.

## Debug Usage
Following commands are available to test the resource:
```
camAct
camBack
enableCursor
exitCursor
destroyCar (use 'b' for explosion at cursor)
drawFarPlaneLines
drawLineToCursor
```

## Usage
Following functions are exported and can be used in other resources:
```
normAtCursor (returns a normal vector pointing in the direction of the cursor, add this to the camera location to perform raycasting)
getPointAtCursor (get the location of the cursor in the world)
```

## Videos
https://www.youtube.com/watch?v=f-o5Ykcn2oA

https://www.youtube.com/watch?v=FpJn7YcmAXs

https://www.youtube.com/watch?v=UxLBuXz0hVM
