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
			params[:user][:csadmin] = true
		else
			params[:user][:csadmin] = false
		end
	end

end