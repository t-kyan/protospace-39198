class CommentsController < ApplicationController
  before_action :set_prototype

  def create
    @comment = @prototype.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @prototype
    else
      render 'prototypes/show'
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
  end

end
