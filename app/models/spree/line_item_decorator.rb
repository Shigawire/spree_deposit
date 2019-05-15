Spree::LineItem.class_eval do
  after_save :update_deposit_adjustment!

  def update_deposit_adjustment!
    order.create_deposit_adjustment!
  end
end
