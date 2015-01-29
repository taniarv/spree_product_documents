Spree::Variant.class_eval do
  has_many :documents, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: "Spree::Document"
end