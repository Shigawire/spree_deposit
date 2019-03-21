module Spree
  module Admin
    class DepositsController < Spree::Admin::ResourceController
      # belongs_to 'spree/variant'

      def show
        @variant = parent
        @deposit = @variant.deposit
      end
      
      protected

      def parent
        Spree::Variant.find(params[:variant_id])
      end

      def find_resource
        parent.deposit
      end
    end
  end
end
