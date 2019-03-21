module Spree
  class DepositPosition < Spree::Base
    belongs_to :deposit

    validates :deposit, presence: true
    validates :name, presence: true
    validates :amount, presence: true
    validates :price, presence: true
  end
end