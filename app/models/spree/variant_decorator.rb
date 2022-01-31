module Spree
  module VariantDecorator
    def self.prepended(base)
      base.has_many :documents, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: "Spree::Document"
    end
  end
end

::Spree::Variant.prepend Spree::VariantDecorator if ::Spree::Variant.included_modules.exclude?(Spree::VariantDecorator)
