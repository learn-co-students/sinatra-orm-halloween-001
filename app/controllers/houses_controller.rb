class HousesController < HalloweenController

  get '/houses' do
    erb :'/houses/index'
  end

  post '/houses' do
    address = params[:house][:address]
    house = House.create(address: address)
    redirect "/houses/#{house.id}"
  end

  get '/houses/new' do
    erb :'/houses/new'
  end

  get '/houses/:id' do
    @house = House.find(params[:id])
    erb :'/houses/show'
  end

  patch '/houses/:id/trick-or-treat' do
    kid = Kid.find(params[:kid_id])
    house = House.find(params[:id])
    house.give_candy(kid)
    redirect "/houses/#{house.id}"
  end

  patch '/houses/:id' do
    address = params[:house][:address]
    house = House.find(params[:id])

    house.update(address: address)
    redirect "/houses/#{house.id}"
  end





end