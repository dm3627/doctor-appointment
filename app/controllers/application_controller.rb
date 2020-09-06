class ApplicationController < ActionController::Base
	before_action :authenticate_by_access_token!
	skip_before_action :verify_authenticity_token

	def authenticate_by_access_token!
		access_token = /Token token=(.*)/.match(request.headers['Authorization'])&.captures&.first
		user = User.find_by(access_token: access_token)
		if user.nil?
			return render(json: {error: 'Invalid token passed - non-parsable'}, status: :forbidden)
		end
	end
end
