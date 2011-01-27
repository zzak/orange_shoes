class Shoes
  class App
    def basic_attributes args={}
      default = {left: 0, top: 0, width: 0, height: 0, angle: 0, curve: 0}
      default.merge args
    end
  end

  def self.repaint_all_by_order app
    FUNCTIONS.push(MAIN)
    if app.interval > 0
      CALLS.push(SET_INTERVAL % ['main', app.interval])
    end
    CALLS.push(SET_CALL % 'main')
    app.order.each do |e|
      if e.is_a?(TextBlock) 
        FUNCTIONS.push(e.is_a?(Js) ? e.real : (e.real % [e.str, e.left, e.top, e.size, e.face]))
      elsif e.is_a?(Image)
        FUNCTIONS.push(e.is_a?(Js) ? e.real : (e.real % [e.fill, e.left, e.top, e.width, e.height]))
      else
        INTERVALS.push(e.is_a?(Js) ? e.real : (e.real % [e.fill, e.left, e.top, e.width, e.height]))
      end
    end
    INTERVALS.push "  }"
  end
end
