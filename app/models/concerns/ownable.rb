module Ownable
  extend ActiveSupport::Concern

  included do
  end

  # true if this object is owned by current user
  # 
  # @param [User] user
  # @return [Boolean]
  def owned?(user)
    user_id == user.try(:id)
  end

end