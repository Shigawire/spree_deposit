module Spree
  class Deposit < Spree::Base
    belongs_to :variant
    has_many :deposit_positions

    def total
      Spree::Money.new(deposit_positions.sum('price * amount'))
    end
  end
end