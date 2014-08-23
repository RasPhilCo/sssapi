class SubmittedTag < ActiveRecord::Base
  include Coordinate

  before_validation :dots_arr
  before_validation :create_points

  validates :dots, presence: true
  validates :point1, presence: true
  validates :point2, presence: true
  validates :point3, presence: true
  validates :point4, presence: true
  validates :point5, presence: true

  def match?
    return true if check_submitted_tag
  end

  def check_submitted_tag    
    #Affine Transformation
    from = Tag.find(1).dots_arr
    to = @dots_arr

    transformation = AffineTransformation.new(from, to)
    err = 0.0
    from.each_with_index do |i, idx|
      fp = i
      tp = to[idx]

      t = transformation.transform(fp)
      err += ((tp[0] - t[0])**2 + (tp[1] - t[1])**2)**0.5
    end
    puts "ERR: "+ err.to_s
    if err.between?(-1, 260) #Tolerance range
      return true
    else
      return false
    end
  end
end