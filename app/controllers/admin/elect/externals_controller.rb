class Admin::Elect::ExternalsController < Admin::BaseController

  def destroy
    _destroy!
    _get_out!
  end
  private
  def _destroy!
    _project_derivative.destroy
  end
  def _get_out!
    redirect_to admin_project_path(_project)
  end
  def _project
    _project_derivative.project
  end
  def _project_derivative
    @external ||= Elect::External.find params[:id]
  end
end