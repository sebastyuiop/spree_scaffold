class Create<%= class_name.pluralize %> < ActiveRecord::Migration
  def self.up
    create_table :<%= model_path %>s do |t|
    <%- for attribute in model_attributes -%>
      t.<%= attribute.type %> :<%= attribute.name %>
    <%- end -%>
    <%- unless options[:skip_timestamps] -%>
      t.timestamps
    <%- end -%>
    end
  end

  def self.down
    drop_table :<%= model_path %>s
  end
end
