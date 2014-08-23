class Tag < ActiveRecord::Base
  include Coordinate

  before_validation :dots_arr
  before_validation :create_points

  validates :dots, presence: true
  validates :point1, presence: true
  validates :point2, presence: true
  validates :point3, presence: true
  validates :point4, presence: true
  validates :point5, presence: true
end
