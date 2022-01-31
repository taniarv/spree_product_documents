module Spree
  module ProductDecorator
    def self.prepended(base)
      base.delegate :documents, to: :master, prefix: true
      base.alias_method :documents, :master_documents

      base.has_many :variant_documents, -> { order(:position) }, source: :documents, through: :variants_including_master
    end
  end
end

::Spree::Product.prepend Spree::ProductDecorator if ::Spree::Product.included_modules.exclude?(Spree::ProductDecorator)
