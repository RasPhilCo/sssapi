class Tag < ActiveRecord::Base
  validates :point1, presence: true
  validates :point2, presence: true
  validates :point3, presence: true
  validates :point4, presence: true
  validates :point5, presence: true
end
