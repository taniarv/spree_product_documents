Deface::Override.new(
  virtual_path: 'spree/admin/shared/_product_tabs',
  name: 'admin_product_document_tab',
  # original: '10edf2223cf4fe1ebcd351beb56472f5b623ea6b',
  insert_after: 'ul[data-hook="admin_product_tabs"] > li:first',
  text: <<-HTML
    <%= content_tag :li do %>
      <%= link_to_with_icon 'file',
      I18n.t('spree.admin.tab.documents'),
      admin_product_documents_path(@product),
      class: "nav-link #{'active' if current == :documents} #{current}" %>

  <% end if can?(:admin, Spree::Document) && !@product.deleted? %>
  HTML
)
