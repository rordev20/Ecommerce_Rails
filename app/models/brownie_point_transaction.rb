class BrowniePointTransaction < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :order, optional: true
  belongs_to :event
  belongs_to :transaction_type
  after_save :set_user_brownie_points

  # This method set user brownie point after transaction
  def set_user_brownie_points
    if self.transaction_type.slug == I18n.t('transaction_type.credit')
      user.brownie_point += self.points
      user.save!
    else
      remaining_user_points = user.brownie_point - self.points
      user.brownie_point = remaining_user_points > 0 ? remaining_user_points : 0
      user.save!
    end
  end

end
