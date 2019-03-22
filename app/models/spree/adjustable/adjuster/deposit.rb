
module Spree
  module Adjustable
    module Adjuster
      class Deposit < Spree::Adjustable::Adjuster::Base

        def update
          deposits = adjustments.deposit
          
          return unless deposits.any?

          deposit_total = deposits.reload.map(&:update!).compact.sum
          update_totals(deposit_total)
        end

        private

        def adjustments
          adjustable.try(:all_adjustments) || adjustable.adjustments
        end
 
        def update_totals(deposit_total)
          @totals[:deposit_total] = deposit_total
          @totals[:non_taxable_adjustment_total] += deposit_total

          # binding.pry
          adjustable.order.update(deposit_total: deposit_total)
        end

        # def update_totals(service_fee_total)
        #   @totals[:service_fee_total] = service_fee_total
        #   @totals[:non_taxable_adjustment_total] += service_fee_total
        # end
      end
    end
  end
end