class Admin::Elect::Projects::ExternalsController < Admin::BaseController
  def create
    _create!
    _get_out!
  end
  private
  def _create! 
    _creative_proxy.create! _creative_params
  end
  def _get_out! 
    redirect_to admin_project_path(_project)
  end
  def _project
    @project ||= ::Elect::Project.find params[:project_id]
  end
  def _creative_proxy
    _project.external_links
  end
  def _creative_params
    params.require(:externals).permit(:href, :name)
  end
end