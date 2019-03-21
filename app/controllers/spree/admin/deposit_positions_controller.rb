module Spree
  module Admin
    class DepositPositionsController < Spree::Admin::ResourceController
      before_action :load_variant, only: [:new, :create]
      before_action :load_deposit_position, only: [:update]
      before_action :load_deposit, only: [:edit, :new, :create]

      def collection_url
        variant = @variant || @deposit_position.deposit.variant
        admin_product_variant_deposit_path(variant.product, variant)
      end

      protected
      
      def load_deposit
        @deposit = @deposit_position.deposit || @variant.deposit
      end

      def load_variant
        @variant = Spree::Variant.find(params[:variant_id])
      end

      def load_deposit_position
        @deposit_position = Spree::DepositPosition.find(params[:id])
      end

      # def create
      #   @service_fee_adjustment= Spree::ServiceFeeAdjustment.new()
      #   @service_fee_adjustment.service_fee = @service_fee
      #   if @service_fee_adjustment.save
      #     flash[:success] = Spree.t(:successfully_created, :resource => Spree.t(:service_fee_adjustment))
      #   end
      #   respond_to do |format|
      #     format.html { redirect_to spree.edit_admin_service_fees_path(@service_fee) }
      #     format.js { render :layout => false }
      #   end
      # end

      # def destroy
      #   @service_fee_adjustment = @service_fee.service_fee_adjustments.find(params[:id])
      #   if @service_fee_adjustment.destroy
      #     flash[:success] = Spree.t(:successfully_removed, :resource => Spree.t(:service_fee_adjustment))
      #   end
      #   respond_to do |format|
      #     format.html { redirect_to spree.edit_admin_service_fees_path(@service_fee)}
      #     format.js   { render :layout => false }
      #   end
      # end

      # protected

      # def load_service_fee
      #   @service_fee = Spree::ServiceFee.find(params[:service_fee_id])
      # end

      # def load_resources
      #   @deposit_position = Spree::DepositPosition.find(params[:id])
      #   @deposit = @deposit_position.deposit
      # end
    end
  end
end
