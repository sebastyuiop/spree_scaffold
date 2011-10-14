Deface::Override.new(:virtual_path => 'admin/shared/_tabs',
                     :name => 'add_<%= class_name %>_model_to_tabs',
                     :insert_after => 'code[erb-loud]:contains(\':users\')',
                     :text => '<%%= tab(:<%= model_path.pluralize %>) %>',
                     :disabled => false)
