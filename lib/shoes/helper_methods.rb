class Shoes
  class App
    def basic_attributes args={}
      default = {left: 0, top: 0, width: 0, height: 0, angle: 0, curve: 0}
      default.merge args
    end
  end

  def self.repaint_all_by_order app
    INTERVALS.push(MAIN % app.interval)
    app.order.each do |e|
      unless e.is_a?(Para) 
        INTERVALS.push(e.is_a?(Js) ? e.real : (e.real % [e.fill, e.left, e.top, e.width, e.height]))
      else
        # is a Para
        INTERVALS.push(e.is_a?(Js) ? e.real : (e.real % [e.str, e.left, e.top]))
      end
    end
    INTERVALS.push "  }"
  end
end
