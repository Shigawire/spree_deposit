Spree::Adjustment.class_eval do
  scope :deposit, -> { where(source_type: 'Spree::Deposit') }
end