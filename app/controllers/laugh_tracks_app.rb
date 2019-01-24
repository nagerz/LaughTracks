class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    elsif params[:sort]
      if params[:sort] == "age"
        @comedians = Comedian.order(:age)
      elsif params[:sort] == "city"
        @comedians = Comedian.order(:city)
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
