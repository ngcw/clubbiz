class RegistrationsController < Devise::RegistrationsController
	
	def new 
		super
	end
	
	def update
		super
	end

	def create
		super
		@user.first_name = params[:user][:first_name]
		@user.last_name = params[:user][:last_name]
		@user.phone_number = params[:user][:phone_number]
		if (params[:user][:superadmin_password].match("clubbiz"))
			@user.csadmin = true
		end
		@user.save
	end

end