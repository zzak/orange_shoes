class Shoes
  class Basic
    include Types

    def initialize args
      args.each do |k, v|
        instance_variable_set "@#{k}", v
      end
      
      Basic.class_eval do
        attr_accessor *args.keys
      end
      
      @app.order << self
    end
    
    def move x, y
      @left, @top = x, y
      INTERVALS.push(real % [fill, left, top, width, height])
    end
  end
 
  # lets just do a para for now :)
  class Para < Basic; end 
  
  class Image < Basic; end
  class ShapeBase < Basic; end
  class Oval < ShapeBase; end
  class Rect < ShapeBase; end
end