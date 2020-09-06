class Api::SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:user][:email])
		if user&.valid_password?(params[:user][:password])
			user.access_token = user.access_token
			user.save(validate: false)
			render json: { user: UserSerializer.new(user).to_hash }
		else
			user = User.new(user_params)
			if user.save
				user.access_token = user.access_token
				user.save
				render json: { user: UserSerializer.new(user).to_hash }
			else
				render json: { error: user.errors }, status: :unauthorized
			end
		end
	end

	private

    def user_params
      	params.require(:user).permit(:type, :email, :password, :password_confirmation, :first_name, :last_name)
    end

end
