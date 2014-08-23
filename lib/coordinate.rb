module Coordinate

  def dots_arr
    flat = JSON.parse(self.dots)
    @dots_arr = [[flat[0],flat[1]], [flat[2],flat[3]], [flat[4],flat[5]], [flat[6],flat[7]], [flat[8],flat[9]]]
  end

  def create_points
    self.point1 = @dots_arr[0].to_json
    self.point2 = @dots_arr[1].to_json
    self.point3 = @dots_arr[2].to_json
    self.point4 = @dots_arr[3].to_json
    self.point5 = @dots_arr[4].to_json
    return @dots_arr
  end
end