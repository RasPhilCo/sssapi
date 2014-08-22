class SubmittedTagsController < ApplicationController
  def match
    dots = params[:dots].split(",").map {|d|d.strip.to_i}
    @sub_tag = SubmittedTag.new(dots: dots.to_json)
    @sub_tag.save
    
    if @sub_tag.match?
      render plain: "A\s"
    else
      render plain: "_\s"
    end
  end

  private
    def sub_tags_params
      params.require(:tag).permit(:dots)
    end
end
