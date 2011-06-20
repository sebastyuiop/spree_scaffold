SpreeScaffold
=============

A basic admin scaffold generator for Spree.

Creates a CRUD interface for whatever you want using the Spree admin styling.

It also creates an admin menu item but there's a bug at the moment which means you get two.

Example
=======

To install

    gem "spree_scaffold", :git => 'git://github.com/sebastyuiop/spree_scaffold.git'

To generate a scaffold:

    rails g spree_scaffold Cat name:string colour:string

Which produces:

    create  app/models/cat.rb
    create  app/controllers/admin/cats_controller.rb
    create  app/views/admin/cats/index.html.erb
    create  app/views/admin/cats/new.html.erb
    create  app/views/admin/cats/edit.html.erb
    create  app/views/admin/cats/_form.html.erb
    create  db/migrate/20110620133021_create_cats.rb
    create  config/locales/en_cats.yml
    create  config/initializers/spree_scaffold_cats_hooks.rb
    
    rake db:migrate
    
You'll need to add a route under the admin namespace for the above (e.g resources :cats).

Copyright (c) 2011 sebastyuiop, released under the New BSD License