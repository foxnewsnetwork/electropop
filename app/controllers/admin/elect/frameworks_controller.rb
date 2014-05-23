class Admin::Elect::FrameworksController < Admin::Elect::ExternalsController
  private
  def _project_derivative
    @external ||= Elect::Framework.find params[:id]
  end
end