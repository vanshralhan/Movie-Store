class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


def layout_change
    render :layout => "new_layout"
end


end
