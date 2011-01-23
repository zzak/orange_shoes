require "./#{File.dirname(__FILE__)}/../lib/orange_shoes"

Shoes.app interval: 400 do
  para "Hello, Orange Shoes!", 30, 50, "20px", "serif"
  para "From Ash and Zak", 470, 470, "12px", "serif"
  image "https://github.com/ashbb/orange_shoes/raw/master/static/oshoes-icon.png", 450, 320, 128, 128
end
