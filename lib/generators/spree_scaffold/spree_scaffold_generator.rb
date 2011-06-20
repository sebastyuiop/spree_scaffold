require 'rails/generators'
require 'rails/generators/generated_attribute'

class SpreeScaffoldGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  attr_accessor :scaffold_name, :model_attributes, :controller_actions
  
  argument :scaffold_name, :type => :string, :required => true, :banner => 'ModelName'
  argument :model_attribute_args, :type => :array, :default => [], :banner => 'model:attributes'
  
  def initialize(*args, &block)
    super
    print_usage unless scaffold_name.underscore =~ /^[a-z][a-z0-9_\/]+$/
    
    @model_attributes = []
    model_attribute_args.each do |arg|
      if arg.include?(':')
        @model_attributes << Rails::Generators::GeneratedAttribute.new(*arg.split(':'))
      end
    end
  end
  
  def create_model
    template 'model.rb', "app/models/#{model_path}.rb"
  end
  
  def create_controller
    template 'controller.rb', "app/controllers/admin/#{model_path}s_controller.rb"
  end
  
  def create_views
    ['index','new','edit'].each do |view|
      template "views/#{view}.html.erb", "app/views/admin/#{model_path}s/#{view}.html.erb"
    end
    template "views/_form.html.erb", "app/views/admin/#{model_path}s/_form.html.erb"
  end
  
  def create_migration
    stamp =  Time.now.utc.strftime("%Y%m%d%H%M%S")
    template 'migration.rb', "db/migrate/#{stamp}_create_#{model_path}s.rb"
  end
  
  def create_locale
    template 'en.yml', "config/locales/en_#{model_path}s.yml"
  end
  
  def create_hooks
    template 'hooks.rb', "config/initializers/spree_scaffold_#{model_path}s_hooks.rb"
  end
  
  private
  
  def model_path
    scaffold_name.downcase
  end
  
  def class_name
    scaffold_name.camelize
  end
  
  def table_name
    scaffold_name.downcase.pluralize
  end
  
end