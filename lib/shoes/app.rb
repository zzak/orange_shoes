class Shoes
  class App

    def initialize args={}
      args[:width] ||= 600
      args[:height] ||= 500
      args[:interval] ||= 0
      @width, @height, @interval = args[:width], args[:height], args[:interval]
      @order = []
    end
    
    attr_reader :width, :height, :interval
    attr_accessor :order

    def background *attrs
      args = attrs.last.class == Hash ? attrs.pop : {}
      case attrs.length
        when 1; args[:fill] = attrs
        when 2; args[:fill], args[:stroke] = attrs
        else; args[:fill], args[:stroke] = attrs
      end
      args[:fill] ||= 'white'
      args[:stroke] ||= 'black'
      args[:app] = self
      Background.new args
    end

    def textblock klass, font_size, *msg
      args = msg.last.class == Hash ? msg.pop : {}
      case msg.length
        when 0, 1; args[:str] = msg
        when 2; args[:str], args[:left] = msg 
        when 3; args[:str], args[:left], args[:top] = msg 
        else args[:str], args[:left], args[:top], args[:face] = msg 
      end
      args = basic_attributes args 
      args[:size] = font_size
      args[:face] = "serif" unless args[:face] 
      args[:app] = self
      klass.new args 
    end

    def banner *msg; textblock Banner, "48px", *msg; end
    def title *msg; textblock Title, "34px", *msg; end
    def subtitle *msg; textblock Subtitle, "26px", *msg; end
    def tagline *msg; textblock Tagline, "18px", *msg; end
    def caption *msg; textblock Caption, "14px", *msg; end
    def para *msg; textblock Para, "12px", *msg; end
    def inscription *msg; textblock Inscription, "10px", *msg; end

    def image name, *attrs 
      args = attrs.last.class == Hash ? attrs.pop : {}
      case attrs.length
        when 0, 1
        when 2; args[:left], args[:top] = attrs
        when 3; args[:left], args[:top], args[:width] = attrs
        else args[:left], args[:top], args[:width], args[:height] = attrs
      end
      args = basic_attributes args 
      args[:height] = args[:width] if args[:height].zero?
      args[:fill] = name
      args[:real] = %Q[    image("%s", %s, %s, %s, %s)] 
      args[:app] = self
      Image.new args
    end

    def oval *attrs
      args = attrs.last.class == Hash ? attrs.pop : {}
      case attrs.length
        when 0, 1
        when 2; args[:left], args[:top] = attrs
        when 3; args[:left], args[:top], args[:radius] = attrs
        else args[:left], args[:top], args[:width], args[:height] = attrs
      end
      args = basic_attributes args
      args[:width].zero? ? (args[:width] = args[:radius] * 2) : (args[:radius] = args[:width]/2.0)
      args[:height] = args[:width] if args[:height].zero?
      args[:strokewidth] = ( args[:strokewidth] or strokewidth or 1 )
      args[:fill] ||= fill
      args[:real] = %Q[    oval('%s', %s, %s, %s)]
      args[:app] = self
      Oval.new args
    end

    def rect *attrs
      args = attrs.last.class == Hash ? attrs.pop : {}
      case attrs.length
        when 0, 1
        when 2; args[:left], args[:top] = attrs
        when 3; args[:left], args[:top], args[:width] = attrs
        else args[:left], args[:top], args[:width], args[:height] = attrs
      end
      args = basic_attributes args
      args[:height] = args[:width] unless args[:height]
      args[:strokewidth] = ( args[:strokewidth] or strokewidth or 1 )
      args[:fill] ||= fill
      args[:real] = %Q[    rect('%s', %s, %s, %s, %s)]
      args[:app] = self
      Rect.new args
    end
    
    def animate n=10, &blk
      n = 1000 / n
      CALLS.push(SET_INTERVAL % ['animate', n])
      CALLS.push(SET_INTERVAL % ['main', self.interval])
      FUNCTIONS.push(ANIMATE % n) 
      instance_eval &blk
      FUNCTIONS.push "  }\n\n"
    end
    
    def js text, opt = :main
      Js.new self, opt, text
    end
  end
end
