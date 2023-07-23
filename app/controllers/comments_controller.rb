class CommentsController < ApplicationController
  before_action :set_prototype
  before_action :authenticate_user!, only: [:create] 

  def create
    @comment = @prototype.comments.new(comment_params)
    if @comment.save
      redirect_to @prototype
    else
      @comments = @prototype.comments
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
