module Spree
  class Deposit < Spree::Base
    
    include Spree::AdjustmentSource

    def self.adjust(order, items)
      items.each do |line_item|
        next if line_item.variant.deposit_free?

        line_item.adjustments.deposit.destroy_all
        Deposit.create.adjust(order, line_item)
      end
    end

    def adjust(order, adjustable)
      create_adjustment(order, adjustable)
    end

    def compute_amount(adjustable)
      adjustable.quantity * adjustable.product.deposit
    end

    def display_price
      Spree::Money.new(total)
    end

    def label
      Spree.t('deposit')
    end

    def description
      Spree.t('deposit_description')
    end
  end
end
