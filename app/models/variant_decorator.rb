Spree::Variant.class_eval do
  has_one :deposit, dependent: :restrict_with_error
end