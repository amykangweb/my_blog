class UsersController < ApplicationController
before_action :set_user

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
	@user = User.find(params[:id])
end

end