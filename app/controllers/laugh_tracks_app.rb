class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      comedians_with_age = Comedian.all.select{ |comedian| comedian.age == params[:age] }
      comedian_names = []
      comedian_ids = []
      comedians_with_age.each do |comedian|
        comedian_names << comedian.name
        comedian_ids << comedian.id
      end
      @comedians = Comedian.where(name: comedian_names)
      @specials = Special.where(comedian_id: comedian_ids)
      @unique_cities = @comedians.unique_cities
    elsif params[:city]
      @comedians = Comedian.where(city: params[:city])
      @specials = Special.select("specials.*").joins(:comedian).where("comedians.city = ?", params[:city])
      @unique_cities = @comedians.unique_cities
    elsif params[:sort]
      if params[:sort] == "age"
        @comedians = Comedian.all.sort_by { |comedian| comedian.age}
        @unique_cities = Comedian.unique_cities
      elsif params[:sort] == "city"
        @comedians = Comedian.order(:city)
        @unique_cities = Comedian.unique_cities
      elsif params[:sort] == "name"
        @comedians = Comedian.order(:name)
        @unique_cities = Comedian.unique_cities
      end
      @specials = Special.all
    else
      @comedians = Comedian.all
      @specials = Special.all
      @unique_cities = @comedians.unique_cities
    end

    @average_age = get_average_age(@comedians)
    @average_length = @specials.average(:run_time).round(1)
    erb :"comedians/index"
  end

  get '/comedians/new' do
    erb :"comedians/new"
  end

  get '/comedians/:id' do
    @comedian = Comedian.find(params[:id])
    @specials = Special.where(comedian_id: params[:id])
    erb :"comedians/show"
  end

  post '/comedians' do
    Comedian.create(params[:comedian])
    redirect '/comedians'
  end

  private
  def get_average_age(people)
    (people.sum { |person| person.age.to_i } / people.length.to_f).round(1)
  end

end
