class Shoes
  SRC_DIR = "#{File.dirname(__FILE__)}/../src" 
  STATIC_DIR = "#{File.dirname(__FILE__)}/../static" 
  APP_FILE = "#{File.basename($0)}"  
  APP_PATH = "#{File.dirname($0)}"  
  
  HEADER =<<-EOS
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="shortcut icon" href="static/favicon.ico" />
</head>
<body>

<div id="canvasWrapper">
  <canvas id="orange_shoes" width="%d" height="%d"></canvas>
</div>

<script type="text/javascript" language="JavaScript" src="js/orange_shoes.js"></script>
<script type="text/javascript" language="JavaScript">
  window.onload = function() {
  EOS
##   ##
# ._. #
##   ##
  FOOTER =<<-EOS
  }
</script>
</body>
</html>
  EOS

  FUNCTIONS = []
  VARS = []
  INTERVALS = []
  CALLS = [] 

  SET_INTERVAL = "  setInterval(%s, %s);"
  SET_CALL = "  %s();"

  MAIN =<<-EOS
  function main(){
  EOS
  
  ANIMATE =<<-EOS
  i = 0;
  function animate(){
    i += 1;
  EOS
end

require_relative 'shoes/helper_methods'
require_relative 'shoes/basic'
require_relative 'shoes/js'
require_relative 'shoes/main'
require_relative 'shoes/app'
require_relative 'shoes/colors'
require_relative 'shoes/version'
