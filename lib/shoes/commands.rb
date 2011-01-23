require 'thor'

class Shoes
  class Commands < Thor
    
    desc "create APP", "creates a shoes app from a given app file"
    def create(app)
      require app
    end
  end
end
