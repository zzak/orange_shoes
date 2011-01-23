Types = module Shoes; self end

module Shoes
  SRC_DIR = "#{File.dirname(__FILE__)}/../src" 
  APP_FILE = "#{File.basename($0)}"  
  APP_PATH = "#{File.dirname($0)}"  
  
  HEADER =<<-EOS
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
</head>
<body>

<script type="text/javascript">
  if(!(!!document.createElement("canvas").getContext)) {
    var wrapper = document.getElementById("canvasWrapper");
    wrapper.innerHTML = "Your browser does not appear to support Canvas";
    return;
  }
</script>

<div id="canvasWrapper">
  <canvas id="orange_shoes" width="%d" height="%d" style="border:1px solid black;"></canvas>
</div>

<script type="text/javascript" language="JavaScript" src="js/orange_shoes.js"></script>

<script type="text/javascript" language="JavaScript">

window.onload = function() {
 
  EOS

  FOOTER =<<-EOS
}
</script>
</body>
</html>
  EOS

  FUNCTIONS = []
 
  VARS = []
  INTERVALS = []
  
  MAIN =<<-EOS

  setInterval(main, %d);
  function main(){
    ctx.clearRect(0, 0, canvas.width,canvas.height);
  EOS
  
  ANIMATE =<<-EOS
  setInterval(animate, %d)
  i = 0;
  function animate(){
    i += 1;
  EOS
end

class Object
  remove_const :Shoes
end

require_relative 'shoes/helper_methods'
require_relative 'shoes/basic'
require_relative 'shoes/js'
require_relative 'shoes/main'
require_relative 'shoes/app'
require_relative 'shoes/colors'
