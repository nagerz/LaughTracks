require 'date'
require 'time'

class Comedian < ActiveRecord::Base
  has_many :specials

  validates :name, presence: true
  validates :dob, presence: true
  validates :city, presence: true


  def age
    birth_date = Time.parse(dob)
    birth_date.strftime("'%Y-%m-%d'");
    now = Time.now.utc.to_date
    (now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)).to_s
  end

end
