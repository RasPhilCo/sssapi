class SubmittedTagsController < ApplicationController
  def match
    dots = params[:dots].split(",").map {|d|d.strip.to_i}
    @sub_tag = SubmittedTag.new(dots: dots.to_json)

    if @sub_tag.save
      if @sub_tag.match?
        render plain: "A\n"
      else
        render plain: "_\n"
      end
    else
      render plain: "Error: Submission not valid, try again."
    end
  end

  private
    def sub_tags_params
      params.require(:tag).permit(:dots)
    end
end
