class Tag < ActiveRecord::Base
  attr_reader :x1, :x2, :x3, :x4, :x5, :y1, :y2, :y3, :y4, :y5

  before_validation :dots_p
  before_validation :make_coords
  before_validation :create_points

  validates :dots, presence: true
  validates :point1, presence: true
  validates :point2, presence: true
  validates :point3, presence: true
  validates :point4, presence: true
  validates :point5, presence: true


  def dots_p
    @dots_p = JSON.parse(self.dots)
  end

  def make_coords
    self.dots_p
    @x1 = @dots_p[0]
    @y1 = @dots_p[1]
    @x2 = @dots_p[2]
    @y2 = @dots_p[3]
    @x3 = @dots_p[4]
    @y3 = @dots_p[5]
    @x4 = @dots_p[6]
    @y4 = @dots_p[7]
    @x5 = @dots_p[8]
    @y5 = @dots_p[9]
    return @dots_p
  end

  def create_points
    make_coords
    self.point1 = [@x1,@y1].to_json
    self.point2 = [@x2,@y2].to_json
    self.point3 = [@x3,@y3].to_json
    self.point4 = [@x4,@y4].to_json
    self.point5 = [@x5,@y5].to_json
  end
end
