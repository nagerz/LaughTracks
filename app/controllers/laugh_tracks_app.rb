class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.all.select { |comedian| comedian.age == params[:age] }
    elsif params[:sort]
      if params[:sort] == "age"
        @comedians = Comedian.all.sort_by { |comedian| comedian.age}
      elsif params[:sort] == "city"
        @comedians = Comedian.order(:city)
      elsif params[:sort] == "name"
        @comedians = Comedian.order(:name)
      end
    else
      @comedians = Comedian.all
    end
    erb :"comedians/index"
  end

  get '/comedians/:id' do
    @comedian = Comedian.find(params[:id])
    erb :"comedians/show"
  end

  get '/comedians/new' do
    erb :"comedians/new"
  end

  post '/comedians' do
    Comedian.create(params[:comedian])
    redirect '/comedians'
  end


end
