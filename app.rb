require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do
      
      # Extract the data from the extraneous top-level key
      pirate_data = params[:pirate]

      # Make the Pirate object from the form data
      @pirate = Pirate.new(
        name: pirate_data[:name], 
        weight: pirate_data[:weight],
        height: pirate_data[:height],
      )
      
      @ship_1 = Ship.new(
        name: pirate_data[:ships][0][:name],
        type: pirate_data[:ships][0][:type],
        booty: pirate_data[:ships][0][:booty]
      )

      @ship_2 = Ship.new(
        name: pirate_data[:ships][1][:name],
        type: pirate_data[:ships][1][:type],
        booty: pirate_data[:ships][1][:booty]
      )
      
      erb :"pirates/show"
    end

  end
end
