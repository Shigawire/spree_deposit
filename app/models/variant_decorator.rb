Spree::Variant.class_eval do
  has_one :deposit, dependent: :destroy

  after_create :create_deposit!, unless: -> { deposit.present? }

  private

  # def create_deposit!
  #   create_deposit! unless deposit.present?
  # end
end