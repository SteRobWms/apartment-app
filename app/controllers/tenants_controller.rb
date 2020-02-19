class TenantsController < ApplicationController
  set :views, "app/views/tenants"
  
  get "/tenants" do
    @tenants = Tenant.all
    erb :index
  end

  get "/tenants/new" do 
    @apartments = Apartment.all
    erb :new
  end

  get "/tenants/:id" do
    @tenant = current_tenant
    # binding.pry
    erb :show
  end

  get "/tenants/:id/edit" do
    @tenant = current_tenant
    @apartments = Apartment.all
    erb :edit
  end

  post "/tenants" do 
    t = Tenant.create(name: params[:tenant][:name], apartment_id: params[:apartment][:id])
    redirect "/tenants/#{t.id}"
  end 

  patch "/tenants/:id" do 
    @tenant = current_tenant
    @tenant.apartment_id = params[:apartment][:id]
    redirect "/tenants/#{@tenant.id}"
  end

  def current_tenant
    Tenant.find(params[:id])
  end
end
