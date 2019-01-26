class Special < ActiveRecord::Base
  belongs_to :comedian

  validates :name, presence: true
  validates :run_time, presence: true
  validates :image, presence: true

  # def self.averge_run_time
  #   @specials.average(:run_time).to_i
  # end

end
