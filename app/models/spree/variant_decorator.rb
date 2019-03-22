Spree::Variant.class_eval do
  has_one :deposit, dependent: :destroy

  after_create :create_deposit!
end