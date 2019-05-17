module Spree
  class Deposit < Spree::Base
    # belongs_to :variant
    # has_many :deposit_positions

    include Spree::AdjustmentSource

    def self.adjust(order, items)
      items.each do |line_item|
        line_item.adjustments.deposit.destroy_all
        Deposit.create.adjust(order, line_item)
        # line_item.variant.deposit.adjust(order, line_item)
      end
    end

    def adjust(order, adjustable)
      # create_adjustment(order, line_item.variant.deposit)
      create_adjustment(order, adjustable)
    end

    def compute_amount(adjustable)
      adjustable.quantity * adjustable.product.deposit
      # raise 'Given adjustable does not contain a currency' unless adjustable.respond_to?(:currency)

      # adjustment = adjustment_amounts.where(currency:adjustable.currency).first
      # adjustment.present? ? adjustment.amount : 0.0
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
