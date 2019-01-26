class Special < ActiveRecord::Base
  belongs_to :comedian

  validates :name, presence: true
  validates :run_time, presence: true
  validates :image, presence: true



end
