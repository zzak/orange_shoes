class Shoes
  class Js

    def initialize app, opt, text
      case opt
        when :main
          app.order << self
          @real = '    ' + text
        when :vars
          VARS.push text
        else
      end
    end
    attr_accessor :real
  end
end
