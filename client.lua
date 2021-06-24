-- Performance Stuff
local sin = math.sin
local cos = math.cos
local tan = math.tan
--------------------
local camHandle
function invertThreeXThreeMatrix(v1,v2,v3)
    local A = v2.y*v3.z - v3.y*v2.z
    local B = -(v1.y*v3.z - v3.y*v3.z)
    local C = v1.y*v2.z - v2.y*v1.z
    local D = -(v2.x*v3.z - v3.x*v2.z)
    local E = v1.x*v3.z - v3.x*v1.z
    local F = -(v1.x*v2.z - v2.x*v1.z)
    local G = v2.x*v3.y - v3.x*v2.z
    local H = -(v1.x*v3.y - v3.x*v1.y)
    local I = v1.x*v2.y - v2.x*v1.y

    local det = v1.x*A + v2.x*B + v3.x*C

    local v1Out = 1/det*vector3(A,B,C)
    local v2Out = 1/det*vector3(D,E,F)
    local v3Out = 1/det*vector3(G,H,I)
    
    return {v1Out, v2Out, v3Out}
end
function invertFourXFourMatrix(v1,v2,v3, v4)
    local a11 = v2.y  * v3.z * v4.w - 
             v2.y  * v3.w * v4.z - 
             v3.y  * v2.z  * v4.w + 
             v3.y  * v2.w  * v4.z +
             v4.y * v2.z  * v3.w - 
             v4.y * v2.w  * v3.z;

    local a12 = -v2.x  * v3.z * v4.w + 
              v2.x  * v3.w * v4.z + 
              v3.x  * v2.z  * v4.w - 
              v3.x  * v2.w  * v4.z - 
              v4.x * v2.z  * v3.w + 
              v4.x * v2.w  * v3.z;

    local a13 = v2.x  * v3.y * v4.w - 
             v2.x  * v3.w * v4.y - 
             v3.x  * v2.y * v4.w + 
             v3.x  * v2.w * v4.y + 
             v4.x * v2.y * v3.w - 
             v4.x * v2.w * v3.y;

    local a14 = -v2.x  * v3.y * v4.z + 
               v2.x  * v3.z * v4.y +
               v3.x  * v2.y * v4.z - 
               v3.x  * v2.z * v4.y - 
               v4.x * v2.y * v3.z + 
               v4.x * v2.z * v3.y;

    local a21 = -v1.y  * v3.z * v4.w + 
              v1.y  * v3.w * v4.z + 
              v3.y  * v1.z * v4.w - 
              v3.y  * v1.w * v4.z - 
              v4.y * v1.z * v3.w + 
              v4.y * v1.w * v3.z;

    local a22 = v1.x  * v3.z * v4.w - 
             v1.x  * v3.w * v4.z - 
             v3.x  * v1.z * v4.w + 
             v3.x  * v1.w * v4.z + 
             v4.x * v1.z * v3.w - 
             v4.x * v1.w * v3.z;

    local a23 = -v1.x  * v3.y * v4.w + 
              v1.x  * v3.w * v4.y + 
              v3.x  * v1.y * v4.w - 
              v3.x  * v1.w * v4.y - 
              v4.x * v1.y * v3.w + 
              v4.x * v1.w * v3.y;

    local a24 = v1.x  * v3.y * v4.z - 
              v1.x  * v3.z * v4.y - 
              v3.x  * v1.y * v4.z + 
              v3.x  * v1.z * v4.y + 
              v4.x * v1.y * v3.z - 
              v4.x * v1.z * v3.y;

    local a31  = v1.y  * v2.z * v4.w - 
             v1.y  * v2.w * v4.z - 
             v2.y  * v1.z * v4.w + 
             v2.y  * v1.w * v4.z + 
             v4.y * v1.z * v2.w - 
             v4.y * v1.w * v2.z;

    local a32 = -v1.x  * v2.z * v4.w + 
              v1.x  * v2.w * v4.z + 
              v2.x  * v1.z * v4.w - 
              v2.x  * v1.w * v4.z - 
              v4.x * v1.z * v2.w + 
              v4.x * v1.w * v2.z;

    local a33 = v1.x  * v2.y * v4.w - 
              v1.x  * v2.w * v4.y - 
              v2.x  * v1.y * v4.w + 
              v2.x  * v1.w * v4.y + 
              v4.x * v1.y * v2.w - 
              v4.x * v1.w * v2.y;

    local a34 = -v1.x  * v2.y * v4.z + 
               v1.x  * v2.z * v4.y + 
               v2.x  * v1.y * v4.z - 
               v2.x  * v1.z * v4.y - 
               v4.x * v1.y * v2.z + 
               v4.x * v1.z * v2.y;

    local a41 = -v1.y * v2.z * v3.w + 
              v1.y * v2.w * v3.z + 
              v2.y * v1.z * v3.w - 
              v2.y * v1.w * v3.z - 
              v3.y * v1.z * v2.w + 
              v3.y * v1.w * v2.z;

    local a42 = v1.x * v2.z * v3.w - 
             v1.x * v2.w * v3.z - 
             v2.x * v1.z * v3.w + 
             v2.x * v1.w * v3.z + 
             v3.x * v1.z * v2.w - 
             v3.x * v1.w * v2.z;

    local a43 = -v1.x * v2.y * v3.w + 
               v1.x * v2.w * v3.y + 
               v2.x * v1.y * v3.w - 
               v2.x * v1.w * v3.y - 
               v3.x * v1.y * v2.w + 
               v3.x * v1.w * v2.y;

    local a44 = v1.x * v2.y * v3.z - 
              v1.x * v2.z * v3.y - 
              v2.x * v1.y * v3.z + 
              v2.x * v1.z * v3.y + 
              v3.x * v1.y * v2.z - 
              v3.x * v1.z * v2.y;

    local det = v1.x * a11 + v1.y * a12 + v1.z * a13 + v1.w * a14;
  
    if (det == 0) then
        return false;
    end
        

    det = 1.0 / det;

    local v1Out = det*vector4(a11, a21, a31, a41)
    local v2Out = det*vector4(a12, a22, a32, a42)
    local v3Out = det*vector4(a13, a23, a33, a43)
    local v4Out = det*vector4(a14, a24, a34, a44)
    return v1Out, v2Out, v3Out, v4Out;
end

function matrixMultFourSquareXFourSingle(v1, v2, v3, v4, vSingle)
    local helpArray1 = {v1.x, v1.y, v1.z, v1.w, v2.x, v2.y, v2.z, v2.w, v3.x, v3.y, v3.z, v3.w, v4.x, v4.y, v4.z, v4.w}
    local helpArray2 = {vSingle.x, vSingle.y, vSingle.z, vSingle.w}
    local v4Components = matrixMult(helpArray1, helpArray2, 4, 1, 4)
    return vector4(v4Components[1], v4Components[2], v4Components[3], v4Components[4])
end
function matrixMultFourSquareXFourSquare(v11, v12, v13, v14, v21, v22, v23, v24)
    local helpArray1 = {v11.x, v11.y, v11.z, v11.w, v12.x, v12.y, v12.z, v12.w, v13.x, v13.y, v13.z, v13.w, v14.x, v14.y, v14.z, v14.w}
    local helpArray2 = {v21.x, v21.y, v21.z, v21.w, v22.x, v22.y, v22.z, v22.w, v23.x, v23.y, v23.z, v23.w, v24.x, v24.y, v24.z, v24.w}
    local v4Components = matrixMult(helpArray1, helpArray2, 4, 4, 4)
   
    local v1 = vector4(v4Components[1], v4Components[2], v4Components[3], v4Components[4])
    local v2 = vector4(v4Components[5], v4Components[6], v4Components[7], v4Components[8])
    local v3 = vector4(v4Components[9], v4Components[10], v4Components[11], v4Components[12])
    local v4 = vector4(v4Components[13], v4Components[14], v4Components[15], v4Components[16])
    return v1, v2, v3, v4
end
function matrixMult(a1, a2, m, n, l) 
    local outputA = {}
    for i = 0, m-1, 1 do
        for j = 0, n-1, 1 do
            outputA[(j * 4 + i)+1] = 0;

            for k = 0, l-1, 1 do
                outputA[(j * 4 + i)+1] = outputA[(j * 4 + i)+1] + a1[(k * 4 + i)+1] * a2[(j * 4 + k)+1];
            end
        end
    end
    return outputA
end

function screenToWorld() 
    local pedId = PlayerPedId()
    local coords = GetEntityCoords(pedId)
    local retScreen, screenX, screenY = GetScreenCoordFromWorldCoord(coords.x,coords.y,coords.z)

    local resX, resY = GetScreenResolution()

    local scaledScreenX = 2*screenX - 1 
    local scaledScreenY = 2*screenY - 1 
    local z = GetFinalRenderedCamNearClip()
    local vIn = vector4(scaledScreenX, scaledScreenY, z, 1)

    
    local iV1, iV2, iV3 = invertThreeXThreeMatrix()
end
function degToRad(deg)
    return deg * (math.pi/180)
end
function getProjMatrix()
    local f = GetCamNearClip(camHandle)
    local n = GetCamFarClip(camHandle)
    local fov = GetCamFov(camHandle)
    local width, height = GetActiveScreenResolution()

    local x00 = height / (tan(degToRad(fov)/2) * width)
    local x11 = 1 / tan(degToRad(fov)/2)
    local v1 = vector4(x00, 0.0, 0.0, 0.0)
    local v2 = vector4(0.0, x11, 0.0, 0.0)
    local v3 = vector4(0.0, 0.0, -f / (f-n), -1)
    local v4 = vector4(0.0, 0.0, -f*n / (f - n), 0.0)

    return v1,v2,v3,v4
end

function getRotMatrix()
    local camRot = GetCamRot(camHandle, 2)
    local xRot = degToRad(camRot.x)
    local yRot = degToRad(camRot.y)
    local zRot = degToRad(camRot.z)

    local xRotTransformV1 = vector4(1, 0, 0, 0)
    local xRotTransformV2 = vector4(0, sin(xRot), cos(xRot), 0)
    local xRotTransformV3 = vector4(0, cos(xRot), -sin(xRot), 0)
    local xRotTransformV4 = vector4(0, 0, 0, 1)

    local yRotTransformV1 = vector4(cos(yRot), 0, sin(yRot), 0)
    local yRotTransformV2 = vector4(0, 1, 0, 0)
    local yRotTransformV3 = vector4(-sin(yRot), 0, cos(yRot), 0)
    local yRotTransformV4 = vector4(0, 0, 0, 1)

    local zRotTransformV1 = vector4(cos(zRot), sin(zRot), 0, 0)
    local zRotTransformV2 = vector4(sin(zRot), -cos(zRot), 0, 0)
    local zRotTransformV3 = vector4(0, 0, 1, 0)
    local zRotTransformV4 = vector4(0, 0, 0, 1)

    local xTyV1, xTyV2, xTyV2, xTyV4 = matrixMultFourSquareXFourSquare(xRotTransformV1, xRotTransformV2, xRotTransformV3, xRotTransformV4, yRotTransformV1, yRotTransformV2, yRotTransformV3, yRotTransformV4)
 

    local finalRotV1, finalRotV2, finalRotV3, finalRotV4 = matrixMultFourSquareXFourSquare(xTyV1, xTyV2, xTyV2, xTyV4, zRotTransformV1, zRotTransformV2, zRotTransformV3, zRotTransformV4)
 
    local xCos = cos(xRot)
    local xSin = sin(xRot)
    local yCos = cos(yRot)
    local ySin = sin(yRot)
    local zCos = cos(zRot)
    local zSin = sin(zRot)
 
    local tempV1 = vector4(yCos*zCos, xCos*ySin*zCos+xSin*zSin, xCos*zSin-xSin*ySin*zCos, 0)
    local tempV2 = vector4(yCos*zSin, xCos*ySin*zSin-xSin*zCos, -xSin*ySin*zSin-xCos*zCos, 0)
    local tempV3 = vector4(-ySin, xCos*yCos, -xSin*yCos, 0)

    return tempV1, tempV2, tempV3, vector4(0, 0, 0, 1)
end

function getCamTranslationMatrix()
    local camCoord = GetCamCoord(camHandle)
    local xTranslation = vector4(1, 0, 0, 0)
    local yTranslation = vector4(0, 1, 0, 0)
    local zTranslation = vector4(0, 0, 1, 0)
    local wTranslation = vector4(camCoord.x, camCoord.y, camCoord.z, 1)
 
    return xTranslation, yTranslation, zTranslation, wTranslation
end
-- WIP NEEDS FIX
function getViewMatrix()
    local finalRotV1, finalRotV2, finalRotV3, finalRotV4 = getRotMatrix()
    local xTranslation, yTranslation, zTranslation, wTranslation = getCamTranslationMatrix()

    local viewV1, viewV2, viewV3, viewV4 = matrixMultFourSquareXFourSquare(finalRotV1, finalRotV2, finalRotV3, finalRotV4, xTranslation, yTranslation, zTranslation, wTranslation)
    local camCoords = GetCamCoord(camHandle)

    return viewV1, viewV2, viewV3, viewV4
end

function getNormalVectorAtCursor(camCoords)
 
    local x, y = GetNuiCursorPosition()
    local width, height = GetActiveScreenResolution()
    local scaledX = 2*x/(width-1) -1
    local scaledY = (2*y/(height-1) -1 ) * -1

 

    local proV1, proV2, proV3, proV4 = getProjMatrix()
    local iProV1, iProV2, iProV3, iProV4 = invertFourXFourMatrix(proV1, proV2, proV3, proV4)
    local viewLoc = matrixMultFourSquareXFourSingle(iProV1, iProV2, iProV3, iProV4, vector4(scaledX, scaledY ,1, 1)) 
    
    viewLoc = viewLoc / viewLoc.w
    
    local rightVector, forwardVector, upVector, position =	GetCamMatrix(camHandle)
    local iViewV1 = v3Tov4(rightVector, 0)
    local iViewV3 = v3Tov4(forwardVector, 0)*-1
    local iViewV2 = v3Tov4(upVector, 0)
    local iViewV4 = v3Tov4(position, 1)

    local nearClipLoc = matrixMultFourSquareXFourSingle(iViewV1, iViewV2, iViewV3, iViewV4, viewLoc)

    nearClipLoc = nearClipLoc.xyz / nearClipLoc.w
    local uV1 = norm(nearClipLoc-camCoords)
    return uV1
end

function v3Tov4(v3, extraNumber)
    return vector4(v3.x, v3.y, v3.z, extraNumber)
end

function enableCursor()
    EnterCursorMode()
end
function exitCursor()
    LeaveCursorMode()
end

function getPointAtCursor(toIgnore)
    camHandle = GetRenderingCam()
    local camCoords = GetCamCoord(camHandle)
    
    local dirV = getNormalVectorAtCursor(camCoords)

    local hit = StartShapeTestSweptSphere(camCoords.x, camCoords.y, camCoords.z, camCoords.x+dirV.x*1000, camCoords.y+dirV.y*1000, camCoords.z+dirV.z*1000, 4, -1, toIgnore, 4);
    local retval, hasHit, endCoords, surfaceNormal, entityHit =GetShapeTestResult(hit)
    return endCoords
end
function getEntityAtCursor()
    print(camHandle)
    local camCoords = GetCamCoord(camHandle)
    local dirV = getNormalVectorAtCursor(camCoords)

    local hit = StartShapeTestSweptSphere(camCoords.x, camCoords.y, camCoords.z, camCoords.x+dirV.x*1000, camCoords.y+dirV.y*1000, camCoords.z+dirV.z*1000, 4, -1, toIgnore, 4);
    local retval, hasHit, endCoords, surfaceNormal, entityHit =GetShapeTestResult(hit)
   
    return entityHit
end
function setCamHandle(_camHandle) 
    camHandle=_camHandle
end
-- Debug Functions 
function drawFarPlaneLines() 
    camHandle = GetRenderingCam()
    local camCoords = GetCamCoord(camHandle)
    local x, y = GetNuiCursorPosition()
    local width, height = GetActiveScreenResolution()
    local scaledX = 2*x/(width-1) -1
    local scaledY = (2*y/(height-1) -1 ) * -1
    print(width, height)

    local pedId = PlayerPedId()
    local coords = GetEntityCoords(pedId)
    local camCoords = GetCamCoord(camHandle)
 
    local proV1, proV2, proV3, proV4 = getProjMatrix()
    
    local iProV1, iProV2, iProV3, iProV4 = invertFourXFourMatrix(proV1, proV2, proV3, proV4)
    
    local topLeft = matrixMultFourSquareXFourSingle(iProV1, iProV2, iProV3, iProV4, vector4(-1, -1 ,0, 1)) 
    local topRight = matrixMultFourSquareXFourSingle(iProV1, iProV2, iProV3, iProV4, vector4(1, -1 ,0, 1)) 
    local bottomLeft = matrixMultFourSquareXFourSingle(iProV1, iProV2, iProV3, iProV4, vector4(-1, 1 ,0, 1)) 
    local bottomRight = matrixMultFourSquareXFourSingle(iProV1, iProV2, iProV3, iProV4, vector4(1, 1 ,0, 1)) 
    local middle = matrixMultFourSquareXFourSingle(iProV1, iProV2, iProV3, iProV4, vector4(0, 0 ,0, 1)) 

    topLeft = topLeft / topLeft.w
    topRight = topRight / topRight.w
    bottomLeft = bottomLeft / bottomLeft.w
    bottomRight = bottomRight / bottomRight.w
    middle = middle / middle.w
   
    local rightVector, forwardVector, upVector, position =	GetCamMatrix(camHandle)
    local iViewV1 = v3Tov4(rightVector, 0)
    local iViewV3 = v3Tov4(forwardVector, 0)*-1
    local iViewV2 = v3Tov4(upVector, 0)
    local iViewV4 = v3Tov4(position, 1)
  
    local topLeftR = matrixMultFourSquareXFourSingle(iViewV1, iViewV2, iViewV3, iViewV4, topLeft) 
    local topRightR = matrixMultFourSquareXFourSingle(iViewV1, iViewV2, iViewV3, iViewV4, topRight) 
    local bottomLeftR = matrixMultFourSquareXFourSingle(iViewV1, iViewV2, iViewV3, iViewV4, bottomLeft) 
    local bottomRightR = matrixMultFourSquareXFourSingle(iViewV1, iViewV2, iViewV3, iViewV4, bottomRight) 
    local middleR =  matrixMultFourSquareXFourSingle(iViewV1, iViewV2, iViewV3, iViewV4, middle) 

    topLeftR = topLeftR / topLeftR.w
    topRightR = topRightR / topRightR.w
    bottomLeftR = bottomLeftR / bottomLeftR.w
    bottomRightR = bottomRightR / bottomRightR.w
    middleR = middleR.xyz / middleR.w

   
    Citizen.CreateThread(function()
        while true do
            DrawLine(camCoords.x, camCoords.y, camCoords.z, middleR.x, middleR.y, middleR.z, 255, 255, 255, 0.2)
            DrawLine(camCoords.x, camCoords.y, camCoords.z, topLeftR.x, topLeftR.y, topLeftR.z, 0, 255, 0, 0.2)
            DrawLine(camCoords.x, camCoords.y, camCoords.z, topRightR.x, topRightR.y, topRightR.z, 0, 255, 0, 0.2)
            DrawLine(camCoords.x, camCoords.y, camCoords.z, bottomLeftR.x, bottomLeftR.y, bottomLeftR.z, 0, 0, 255, 0.2)
            DrawLine(camCoords.x, camCoords.y, camCoords.z, bottomRightR.x, bottomRightR.y, bottomRightR.z, 0, 0, 255, 0.2)
            DrawLine(camCoords.x, camCoords.y, camCoords.z, middleR.x, middleR.y, middleR.z, 255, 255, 255, 0.2)
            Wait(1)
        end
    end)
    
  
end
function drawLineToCursor() 
    local camCoords = GetCamCoord(camHandle)
    print(camCoords)
    local x, y = GetNuiCursorPosition()
    
    local width, height = GetActiveScreenResolution()
    local scaledX = 2*x/(width-1) -1
    local scaledY = (2*y/(height-1) -1 ) * -1

    local pedId = PlayerPedId()
    local coords = GetEntityCoords(pedId)

    local proV1, proV2, proV3, proV4 = getProjMatrix()
  
    local iProV1, iProV2, iProV3, iProV4 = invertFourXFourMatrix(proV1, proV2, proV3, proV4)
    local viewLoc = matrixMultFourSquareXFourSingle(iProV1, iProV2, iProV3, iProV4, vector4(scaledX, scaledY ,1, 1)) 
    
    viewLoc = viewLoc / viewLoc.w
   
    local rightVector, forwardVector, upVector, position =	GetCamMatrix(camHandle)
    local iViewV1 = v3Tov4(rightVector, 0)
    local iViewV3 = v3Tov4(forwardVector, 0)*-1
    local iViewV2 = v3Tov4(upVector, 0)
    local iViewV4 = v3Tov4(position, 1)
 
    local topLeftR = matrixMultFourSquareXFourSingle(iViewV1, iViewV2, iViewV3, iViewV4, viewLoc)

    topLeftR = topLeftR.xyz / topLeftR.w
    
    local uV1 = norm(topLeftR-camCoords)
    topLeftR = topLeftR + 100*uV1
    Citizen.CreateThread(function()
        while true do
            DrawLine(camCoords.x, camCoords.y, camCoords.z, topLeftR.x, topLeftR.y, topLeftR.z, 128, 128, 0, 0.2)
            Wait(1)
        end
    end)
end
function camAct() 
    local pedId = PlayerPedId()
    local coords = GetEntityCoords(pedId)
    camHandle = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    local res = vector3(coords.x, (coords.y)*cos(-90) - (coords.z)*sin(-90), (coords.y)*sin(-90)+(coords.z)*cos(-90))
    SetCamCoord(camHandle, coords+vector3(0, 0 ,30))
    SetCamRot(camHandle, vector3(-90, 0, 0.0), 2)

    SetCamFov(camHandle, 50.0)
    SetCamNearClip(camHandle, GetFinalRenderedCamNearClip())
    SetCamFarClip(camHandle, GetFinalRenderedCamFarClip())
    RenderScriptCams(true, false, 0, 0, 0)
end
function camBack() 
    RenderScriptCams(false, false, 0, 1, 0)
end
function destroyCar()
    Citizen.CreateThread(function()
        while true do
            
            if (IsControlPressed(0, 29)) then
                local camCoords = GetCamCoord(camHandle)
              
                local dirV = getNormalVectorAtCursor(camCoords)
         
                local hit = StartShapeTestSweptSphere(camCoords.x, camCoords.y, camCoords.z, camCoords.x+dirV.x*100, camCoords.y+dirV.y*100, camCoords.z+dirV.z*100, 4, -1, -1, 4);
                local retval, hasHit, endCoords, surfaceNormal, entityHit =GetShapeTestResult(hit)
         
                DeleteEntity(entityHit)
                --AddExplosion(endCoords.x, endCoords.y, endCoords.z, 26, 1000, false, false, 1)
                             
    
            end
            Wait(1)
        end
    end)
end
-----------------------------------------
RegisterCommand("drawFarPlaneLines", drawFarPlaneLines, false)
RegisterCommand("camAct", camAct, false)
RegisterCommand("camBack", camBack, false)
RegisterCommand("enableCursor", enableCursor, false)
RegisterCommand("exitCursor", exitCursor, false)
RegisterCommand("drawLineToCursor", drawLineToCursor, false)
RegisterCommand("destroyCar", destroyCar, false)

exports('normAtCursor', getNormalVectorAtCursor)
exports('getPointAtCursor', getPointAtCursor)
exports('setCamHandle', setCamHandle)
exports('getEntityAtCursor', getEntityAtCursor)
