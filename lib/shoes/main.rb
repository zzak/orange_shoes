class Shoes
  def self.app args={}, &blk
    app = App.new args
    app.instance_eval &blk
    repaint_all_by_order app
    make_output_dirs app
  end 
    
  def self.make_output_dirs app
    require 'fileutils' 
    FileUtils.mkdir_p "#{APP_PATH}/output/js"
    FileUtils.mkdir_p "#{APP_PATH}/output/static"
    FileUtils.cp_r "#{SRC_DIR}/.", "#{APP_PATH}/output/js/." 
    FileUtils.cp_r "#{STATIC_DIR}/.", "#{APP_PATH}/output/static/." 
    # write to file  
    output = APP_FILE.gsub('.rb', '.html')
    open "#{APP_PATH}/output/#{output}", 'w' do |f|
      f.puts HEADER % [app.width, app.height], 
        VARS, FUNCTIONS, INTERVALS, CALLS, FOOTER
    end
  end
end
