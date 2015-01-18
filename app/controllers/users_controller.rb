class UsersController < ApplicationController
before_action :authenticate_user!, only: [:upvote, :downvote]
before_action :set_user

def upvote
    @user.post.liked_by current_user

    respond_to do |format|
      format.js
    end
  end

def downvote
    @user.post.unliked_by current_user

    respond_to do |format|
      format.js
    end
end

def show
	if user_signed_in?
		if current_user == @user || current_user.admin?
			@posts = @user.posts.paginate(page: params[:page])
		else
			@posts = @user.posts.where(private: false).paginate(page: params[:page])
		end
	else
		@posts = @user.posts.where(private: false).paginate(page: params[:page])
	end
end

private

def set_user
	@user = User.find_by_name(params[:id])
end

end