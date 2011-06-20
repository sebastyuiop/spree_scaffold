class Admin::<%= class_name %>sController < Admin::ResourceController
  
  def index
    @<%= model_path %>s = <%= class_name %>.paginate(:per_page => 50, :page => params[:page])
  end

  def new
    @<%= model_path %> = <%= class_name %>.new
  end

  def create
    @<%= model_path %> = <%= class_name %>.new(params[:<%= model_path %>])
    if @<%= model_path %>.save
      flash[:notice] = "Successfully created <%= model_path %>."
      redirect_to admin_<%= model_path %>s_url
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
      flash[:notice] = "Successfully updated <%= model_path %>."
      redirect_to admin_<%= model_path %>s_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @<%= model_path %> = <%= class_name %>.find(params[:id])
    @<%= model_path %>.destroy
    flash[:notice] = "Successfully destroyed <%= model_path %>."
    redirect_to admin_<%= model_path %>s_url
  end

end