class Admin::Elect::Projects::FrameworksController < Admin::Elect::Projects::ExternalsController
  private
  def _creative_proxy
    _project.frameworks
  end
  def _creative_params
    params.require(:frameworks).permit(:framework_type, :name)
  end
end