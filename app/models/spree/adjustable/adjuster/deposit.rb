
module Spree
  module Adjustable
    module Adjuster
      class Deposit < Spree::Adjustable::Adjuster::Base

        def update
          # return
          # binding.pry
          # binding.pry unless adjustable.is_a? LineItem
          # binding.pry
          # return unless adjustable.is_a? LineItem
          
          # return unless adjustable.variant

          deposits = adjustments.deposit
          total_deposit_sum = deposits.reload.map(&:update!).compact.sum

          # binding.pry

          update_totals(total_deposit_sum)

          # line_items = adjustments.line_items.joins(:variant).where('variant.deposit > 0')
          
          # return unless deposits.any?

          # deposit_total = deposits.reload.map(&:update!).compact.sum
          # update_totals(deposit_total)
        end

        private

        # def adjustments
        #   adjustable.try(:all_adjustments) || adjustable.adjustments
        # end
 
        def update_totals(total_deposit_sum)
          # binding.pry

          # @totals[:deposit_total] = deposit_total
          # @totals[:non_taxable_adjustment_total] = deposit_total
          # binding.pry
          # @totals[:non_taxable_adjustment_total] += deposit_total
          # @totals[:additional_tax_total] += deposit_total

          # binding.pry

          @totals[:taxable_adjustment_total] += total_deposit_sum
          adjustable.order.update(deposit_total: total_deposit_sum)
        end

        # def update_totals(service_fee_total)
        #   @totals[:service_fee_total] = service_fee_total
        #   @totals[:non_taxable_adjustment_total] += service_fee_total
        # end
      end
    end
  end
end
