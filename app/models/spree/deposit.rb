module Spree
  class Deposit < Spree::Base
    belongs_to :variant
    has_many :deposit_positions

    include Spree::AdjustmentSource

    def self.adjust(order, items)
      items.each do |line_item|
        line_item.adjustments.where(source_type: 'Spree::Deposit').destroy_all
        line_item.variant.deposit.adjust(order, line_item)
      end
    end

    def adjust(order, adjustable)
      # create_adjustment(order, line_item.variant.deposit)
      create_adjustment(order, adjustable)
    end

    def compute_amount(adjustable)
      adjustable.quantity * total
      # raise 'Given adjustable does not contain a currency' unless adjustable.respond_to?(:currency)

      # adjustment = adjustment_amounts.where(currency:adjustable.currency).first
      # adjustment.present? ? adjustment.amount : 0.0
    end

    def label
      Spree.t('payments.deposit')
    end

    def description
      Spree.t('payments.deposit_description')
    end

    def total
      deposit_positions.sum('price * amount')
    end
  end
end