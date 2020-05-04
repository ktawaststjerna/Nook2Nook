class IndexController < ApplicationController

  def index
    redirect_to controller: :dashboard, action: :dashboard if current_user.present?
  end
end
