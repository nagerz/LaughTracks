class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      comedians_with_age = Comedian.all.select{ |comedian| comedian.age == params[:age] }
      comedian_names = comedians_with_age.map do |comedian|
        comedian.name
      end
      @comedians = Comedian.where(name: comedian_names)
      @specials = Special.select("specials.*").joins(:comedian).where(name: comedian_names)
    elsif params[:city]
      @comedians = Comedian.where(city: params[:city])
      @specials = Special.select("specials.*").joins(:comedian).where("comedians.city = ?", params[:city])
    elsif params[:sort]
      if params[:sort] == "age"
        @comedians = Comedian.all.sort_by { |comedian| comedian.age}
      elsif params[:sort] == "city"
        @comedians = Comedian.order(:city)
      elsif params[:sort] == "name"
        @comedians = Comedian.order(:name)
      end
      @specials = Special.all
    else
      @comedians = Comedian.all
      @specials = Special.all
    end

    @average_age = get_average_age(@comedians)
    @average_length = @specials.average(:run_time).to_i
    @unique_city_comics = @comedians.select(:city).distinct
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

  private
  def get_average_age(people)
    people.sum { |person| person.age.to_i } / people.length.to_f
  end

  # def get_average_length(comedians)
  #   comedians.each do |come
  #

end
