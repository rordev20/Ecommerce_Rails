module CouponsHelper

  # This method return message for coupon and its type
  def get_coupon_message_and_type(coupon)
    if coupon && coupon.errors.any?
      {message: coupon.errors.full_messages.first, type: t('message_type.danger')}
    elsif coupon
      {message: t('coupon.applied'), type: t('message_type.success')}
    else
      {message: t('coupon.not_found'), type: t('message_type.danger')}
    end
  end
end
