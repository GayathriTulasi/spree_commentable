Deface::Override.new(virtual_path:   "spree/products/show",
                     name:           "product_show",
                     insert_bottom:  "[data-hook='product_show'], #product_show[data-hook]",
                     partial:        "spree/comments/show_comments",
                     disabled:       false)