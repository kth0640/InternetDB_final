<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메타버스</title>
  <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>
  <script src="https://cdn.rawgit.com/donmccurdy/aframe-extras/v6.1.1/dist/aframe-extras.min.js"></script>
  <style>
    body {
      margin: 0;
      overflow: hidden;
    }
  </style>
</head>
<body>
  <a-scene>
    <a-sky color="#ECECEC"></a-sky>

    <!-- 3D 무료 모델 (크기,위치설정) -->
    <a-entity 
      id="palace" 
      gltf-model="#palaceModel" 
      position="0 0 -5" 
      scale="5 5 5"
      geometry="primitive: box"
      material="opacity: 0; transparent: true">
    </a-entity>

    <!-- 카메라 -->
    <a-entity 
      id="camera" 
      camera 
      wasd-controls 
      look-controls
      position="0 0 15" 
      boundary-constraint="minX: -5; maxX: 5; minZ: -50; maxZ: 25"
      jump="height: 2; duration: 500">
    </a-entity>

    <!-- Assets -->
    <a-assets>
      <a-asset-item id="palaceModel" src="<%= request.getContextPath() %>/assets/palace.glb"></a-asset-item>
      <img id="1" src="<%= request.getContextPath() %>/images/item1.jpg">
      <img id="2" src="<%= request.getContextPath() %>/images/item2.jpg">
      <img id="3" src="<%= request.getContextPath() %>/images/item3.jpg">
      <img id="4" src="<%= request.getContextPath() %>/images/item4.jpg">
      <img id="5" src="<%= request.getContextPath() %>/assets/5.jpg">
      <img id="6" src="<%= request.getContextPath() %>/assets/6.jpg">
      <img id="7" src="<%= request.getContextPath() %>/assets/7.jpg">
      <img id="8" src="<%= request.getContextPath() %>/assets/8.jpg">
    </a-assets>

    <!-- Image entity -->
    <a-image src="#1" position="14 2 1" width="6" height="8" rotation="0 90 0"></a-image>
    <a-image src="#2" position="-14 2 1" width="6" height="8" rotation="0 90 0"></a-image>

    <a-image src="#3" position="14 2 -15" width="6" height="8" rotation="0 90 0"></a-image>
    <a-image src="#4" position="-14 2 -15" width="6" height="8" rotation="0 90 0"></a-image>

    <a-image src="#5" position="14 2 -45" width="6" height="8" rotation="0 90 0"></a-image>
    <a-image src="#6" position="-14 2 -45" width="6" height="8" rotation="0 90 0"></a-image>

    <a-image src="#7" position="14 2 -59" width="6" height="8" rotation="0 90 0"></a-image>
    <a-image src="#8" position="-14 2 -59" width="6" height="8" rotation="0 90 0"></a-image>
  </a-scene>
  <script src="<%= request.getContextPath() %>/js/vr.js"></script>
</body>
</html>
