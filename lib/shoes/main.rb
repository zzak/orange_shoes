class Shoes
  include Types

  def self.app args={}, &blk
    app = App.new args

    app.instance_eval &blk

    repaint_all_by_order app

    # make output dirs
    Dir.mkdir("#{APP_PATH}/output") unless Dir.exists?("#{APP_PATH}/output")
    Dir.mkdir("#{APP_PATH}/output/js") unless Dir.exists?("#{APP_PATH}/output/js") 
    Dir.mkdir("#{APP_PATH}/output/static") unless Dir.exists?("#{APP_PATH}/output/static") 
     
    `cp #{SRC_DIR}/*.js "#{APP_PATH}/output/js/."` 
    `cp #{STATIC_DIR}/* "#{APP_PATH}/output/static/."` 
    output = APP_FILE.gsub('.rb', '.html')
    open "#{APP_PATH}/output/#{output}", 'w' do |f|
      f.puts HEADER % [app.width, app.height], 
        FUNCTIONS, VARS, INTERVALS, FOOTER
    end
  end
end
