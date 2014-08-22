class TagsController < ApplicationController
  def index
    render plain: "#{params[:dots]}"
  end

  private
    def tags_params
      params.require(:tag).permit(:dots)
    end
end
