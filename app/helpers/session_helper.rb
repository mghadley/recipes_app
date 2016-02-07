module SessionHelper

	def admin?
		return true if session[:user] == "admin"
	end
end
