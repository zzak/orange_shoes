(function() {
  window.ORANGE_SHOES = function() { 
    canvas = document.getElementById('orange_shoes');
    ctx = canvas.getContext("2d");
    var mouseX;
    var mouseY;
    canvas.onmousemove = getMousePoint;
    function getMousePoint(evt){
      mouseX = evt.clientX - canvas.offsetLeft;
      mouseY = evt.clientY - canvas.offsetTop;
    }
     
    para = function (str, x, y, size, face) {
      ctx.font = size + " " + face; 
      ctx.fillText(str, x, y);
    }

    image = function (source, x, y, w, h) {
      var img = new Image();
      img.onload = function() {
        ctx.drawImage(img,x,y,w,h); 
      } 
      img.src = source;
    }

    oval = function (c, x, y, r){
      ctx.beginPath();
      ctx.fillStyle = c;
      ctx.arc(x+r, y+r, r, 0, Math.PI*2, true);
      ctx.closePath();
      ctx.fill();
    }

    rect = function (c, x, y, w, h){
      ctx.beginPath();
      ctx.fillStyle = c;
      ctx.fillRect(x, y, w, h);
      ctx.closePath();
      ctx.fill();
    }
  };
  window.OrangeShoes = new window.ORANGE_SHOES();
}());
