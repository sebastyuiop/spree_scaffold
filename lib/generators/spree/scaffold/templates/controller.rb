class Admin::<%= class_name.pluralize %>Controller < Admin::ResourceController
  
  def index
    @<%= model_path.pluralize %> = <%= class_name %>.page(params[:page] || 1).per(50)
  end

  def new
    @<%= model_path %> = <%= class_name %>.new
  end

  def create
    @<%= model_path %> = <%= class_name %>.new(params[:<%= model_path %>])
    if @<%= model_path %>.save
      flash[:notice] = "Successfully created <%= display_name %>."
      redirect_to admin_<%= model_path.pluralize %>_url
    else
      render :action => 'new'
    end
  end

  def edit
    @<%= model_path %> = <%= class_name %>.find(params[:id])
  end

  def update
    @page = <%= class_name %>.find(params[:id])
    if @<%= model_path %>.update_attributes(params[:<%= model_path %>])
      flash[:notice] = "Successfully updated <%= display_name %>."
      redirect_to admin_<%= model_path.pluralize %>_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @<%= model_path %> = <%= class_name %>.find(params[:id])
    @<%= model_path %>.destroy
    flash[:notice] = "Successfully destroyed <%= display_name %>."
    redirect_to admin_<%= model_path.pluralize %>_url
  end

end