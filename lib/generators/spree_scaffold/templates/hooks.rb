class SpreeScaffold<%= class_name %>sHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_tabs do
    %(<%%= tab(:<%= model_path %>s) %>)
  end
end