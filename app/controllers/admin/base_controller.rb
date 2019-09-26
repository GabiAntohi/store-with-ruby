# Inherit directly from ActionController::Base rather than ApplicationController to ensure clean separation
class Admin::BaseController < ActionController::Base
    # use an admin-specific layout instead of the main application layout
    layout "admin"
    
    # all child controllers will automatically enforce access to admins only
   # before_action :require_admin
    
  #  def require_admin
        # ...
  #  end

	before_action :ensure_admin_user!
	def ensure_admin_user!
	unless current_user and current_user.admin?
	redirect_to root_path
	end
	end



end
