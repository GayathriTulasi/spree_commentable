Deface::Override.new(:virtual_path => "spree/products/show",
                     :replace => "[data-hook='product_show']",
                     :template => "spree/commentable/products/show",
                     :name => "product_show")
