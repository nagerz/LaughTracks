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
    elsif params[:city]
      @comedians = Comedian.where(city: params[:city])
      @specials = Special.select("specials.*").joins(:comedian).where("comedians.city = ?", params[:city])
    elsif params[:sort]
      if params[:sort] == "age"
        @comedians = (Comedian.all.sort_by { |comedian| comedian.age}).reverse
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
    @average_length = @specials.average(:run_time).round(1)
    #@unique_city_comedians = @comedians.select(:city).distinct
    erb :"comedians/index"
  end

  get '/comedians/new' do
    erb :"comedians/new"
  end

  get '/comedians/:id' do
    @comedian = Comedian.find(params[:id])
    # if @comedian.nil?
    #   Comedian not available.
    # else
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

  # def get_average_length(comedians)
  #   comedians.each do |come
  #

end
