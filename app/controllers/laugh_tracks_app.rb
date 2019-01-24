class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    #@comedians = Comedian.find_by(params[:filter])
    @comedians = Comedian.all
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
    comedian = Comedian.new(params[:comedian])
    comedian.save
    redirect '/comedians'
  end


end
