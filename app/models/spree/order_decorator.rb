Spree::Order.class_eval do
  def create_deposit_adjustment!
    Spree::Deposit.adjust(self, line_items)
  end
end