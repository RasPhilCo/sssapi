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

  def old_depricated_method_for reference    
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



  # Needs to be cleaned up (not very DRY) but it's working with a 0.05% tolerance!
  def check_submitted_tag
    tolerance = 0.05
    dists = {}
    dots = Tag.find(1).dots_arr
    handshakes = [[0,1],[0,2],[0,3],[0,4],[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
      handshakes.each do |hand|
        dists[hand] = Math.hypot(dots[hand[1]][0]-dots[hand[0]][0],dots[hand[1]][1]-dots[hand[0]][1])
      end

    dists_subs = {}
    subs = @dots_arr
      handshakes.each do |hand|
        dists_subs[hand] = Math.hypot(subs[hand[1]][0]-subs[hand[0]][0],subs[hand[1]][1]-subs[hand[0]][1])
      end

    match_truth = {}
    dists_subs.values.each do |dist_sub|

      dists.values.each do |dist|
        case dist_sub
        when ((dist*(1 - tolerance))..(dist*(1 + tolerance)))
          match_truth[dist_sub]= true
          # puts true
        else
          puts false
        end
      end

    end

    if match_truth.count == 10
      return true
    else 
      return false
    end
  end
end
