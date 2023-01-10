class FollowsController < ApplicationController
	before_action :authenticate_user!

	def follow_user
		byebug
      user = User.where(id: params[:user_id]).first
      if user.present?
      	byebug
        follow_check = check_following(@current_user, user)
        unless follow_check
          @current_user.follow(user)
          render json: { success: true, message: 'Started Following' }
        else
          render json: { success: true, message: 'Already Following' }
        end
      else
        render json: { success: false, message: "User doesn't exists" }
      end
    end

    def check_following(current_user, user)
      current_user&.following?(user)
    end
end
