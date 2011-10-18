Deface::Override.new(:virtual_path => 'layouts/admin',
                     :name => 'add_<%= class_name %>_model_to_tabs',
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => '<%%= tab(:<%= model_path.pluralize %>) %>',
                     :disabled => false)
