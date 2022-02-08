module Spree
  module Admin
    class DocumentsController < ResourceController
      belongs_to 'spree/product', find_by: :slug

      before_action :load_data

      create.before :set_viewable
      update.before :set_viewable

      def index
      end

      private

        def location_after_destroy
          admin_product_documents_url(@product)
        end

        def location_after_save
          admin_product_documents_url(@product)
        end

        def load_data
          @product = Product.friendly.find(params[:product_id])
          @variants = @product.variants.collect do |variant|
            [variant.sku_and_options_text, variant.id]
          end
          @variants.insert(0, [Spree.t(:all), @product.master.id])
        end

        def set_viewable
          @document.viewable_type = 'Spree::Variant'
          @document.viewable_id = params[:document][:viewable_id]
        end

    end
  end
end
