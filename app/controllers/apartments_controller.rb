class ApartmentsController < ApplicationController
  set :views, "app/views/apartments"
  
  get "/" do
    erb :home
  end

  get "/apartments" do
    @apartments = Apartment.all
    erb :index
  end

  get "/apartments/new" do
    erb :new
  end

  post "/apartments" do
    a = Apartment.create(params[:apartment])
    redirect "/apartments/#{a.id}"
  end

  get "/apartments/:id" do
    @apartment = current_apartment
    erb :show
  end

  get "/apartments/:id/edit" do
    @apartment = current_apartment
    erb :edit
  end

  patch "/apartments/:id" do
    @apartment = current_apartment
    @apartment.update(address: params[:apartment][:address])
    redirect "/apartments/#{@apartment.id}"
  end

  delete "/apartments/:id" do
    if Tenant.find{|tenant|tenant.apartment_id == params[:id].to_i}.apartment
      redirect "/apartments"
    else
      Apartment.destroy(params[:id])
      redirect "/apartments"
    end
  end

  def current_apartment
    Apartment.find(params[:id])
  end
end
