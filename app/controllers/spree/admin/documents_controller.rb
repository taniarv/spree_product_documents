module Spree
  module Admin
    class DocumentsController < ResourceController
      before_action :load_product
      before_action :load_edit_data, except: :index

      create.before :set_viewable
      update.before :set_viewable

      private

      def location_after_destroy
        admin_product_documents_url(@product)
      end

      def location_after_save
        admin_product_documents_url(@product)
      end

      def load_edit_data
        @variants = @product.variants.map do |variant|
          [variant.sku_and_options_text, variant.id]
        end
        @variants.insert(0, [Spree.t(:all), @product.master_id])
      end

      def set_viewable
        @document.viewable_type = 'Spree::Variant'
        @document.viewable_id = params[:document][:viewable_id]
      end

      def load_product
        @product = scope.friendly.find(params[:product_id])
      end

      def scope
        current_store.products
      end

      def collection_url
        spree.admin_product_documents_url
      end

      def model_class
        Spree::Document
      end

      def collection
        @collection ||= load_product.variant_documents
      end

    end
  end
end
