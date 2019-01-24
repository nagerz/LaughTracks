class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    #@comedians = Comedian.find_by(params[:filter])
    @comedians = Comedian.all
    erb :"comedians/index"
  end

  # get '/comedians/new' do
  #   erb :"comedians/new"
  # end


end
