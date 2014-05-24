class Admin::Elect::PicturesController < Admin::Elect::ExternalsController
  private
  def _project_derivative
    @external ||= Elect::Picture.find params[:id]
  end
end