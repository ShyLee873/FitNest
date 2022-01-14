module Authorization
  extend ActiveSupport::Concern
  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:alert] = "You shall not pass!"
      redirect_to( root_path)
    end
  end
  
end