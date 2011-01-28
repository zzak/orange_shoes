class Shoes
  class Basic

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

  class Background < Basic
    attr_accessor :fill, :stroke
    def initialize args
      args[:real] =<<-EOS
      background("#{args[:fill]}", "#{args[:stroke]}");
      EOS
      super 
    end
  end

  class TextBlock < Basic
    attr_accessor :text, :size, :face 
    def initialize args
      args[:real] = %Q[    text("%s", %s, %s, "%s", "%s");] 
      super 
    end
  end
  class Banner < TextBlock; end
  class Title < TextBlock; end
  class Subtitle < TextBlock; end
  class Tagline < TextBlock; end
  class Caption < TextBlock; end
  class Para < TextBlock; end
  class Inscription < TextBlock; end

  class Image < Basic; end
  
  class ShapeBase < Basic; end
  class Oval < ShapeBase; end
  class Rect < ShapeBase; end
end
