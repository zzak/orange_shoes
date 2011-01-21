require '../lib/orange_shoes'

Shoes.app interval: 400 do
  para "Hello, Orange Shoes!", "20px", "serif", 30, 50 
  para "From Ash and Zak", "12px", "serif", 470, 470 
  image "https://github.com/ashbb/orange_shoes/raw/master/static/oshoes-icon.png", 450, 320, 128, 128
end
