class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
	    @entry = Entry.find(params[:entry_id])
	    @comment = @entry.comments.create({content: params[:comment][:content], entry_id: params[:entry_id], user_id: params[:user_id]}) 
	    if @comment.save
	      flash[:success] = "Comment created!"
	    else
	      flash[:danger] = "Comment can't be blank"
	    end
	    redirect_to @entry
  	end

  	def destroy
  	end

  	private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
