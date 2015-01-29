Spree::Product.class_eval do
  delegate :documents, to: :master, prefix: true
  alias_method :documents, :master_documents

  has_many :variant_documents, -> { order(:position) }, source: :documents, through: :variants_including_master
end
