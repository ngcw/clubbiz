class RegistrationsController < Devise::RegistrationsController
	
	def new 
		super
	end
	
	def update
		super
	end

	def create
		super
		if (params[:user][:superadmin_password].match("clubbiz"))
			@user.csadmin = true
			@user.save
		end
	end

end