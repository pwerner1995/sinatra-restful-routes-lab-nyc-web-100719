class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/recipes" do
    @recipes = Recipe.all
    erb :"recipes/index"
  end
  
  get "/recipes/new" do

    erb :"recipes/new"
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do 
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/edit"
  end

  patch "/recipes/:id" do 
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    erb :"recipes/show"
  end

  delete "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    erb :"recipes/index"
  end


end
