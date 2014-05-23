class Admin::Elect::ExposController < Admin::BaseController

  def new; end

  def create
    _create_project!
    _get_out_of_here!
  end

  private
  def _create_project! 
    @result = _creative_project.save!
  end
  def _creative_project
    @project = Elect::Project.new _project_params
  end
  def _project_params
    params.require(:project).permit(:title, :tagline, :description, :purpose, :project_type)
  end
  def _get_out_of_here! 
    return redirect_to admin_project_path(@project) if @result
    render :new
  end
end