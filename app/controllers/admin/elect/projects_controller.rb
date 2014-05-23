class Admin::Elect::ProjectsController < Admin::BaseController
  expose(:project) { ::Elect::Project.find params[:id] }
  def show; end

end