require "orange_shoes"

Shoes.app interval: 400 do
  js colorful =<<-EOS, :vars
  colorful = ["#FF0000", "#FF0033", "#FF3300", "#FF3333", "#FF6600", "#FF6633", "#FF9900", "#FF9933", "#FFCC00", "#FFCC33", "#FFFF00", "#FFFF33"];
  EOS
 
  js colorize =<<-EOS
  randcolor = Math.floor(Math.random()*colorful.length);
  background(colorful[randcolor], 'black');
  EOS
end
