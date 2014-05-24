class Admin::Elect::Projects::PicturesController < Admin::Elect::Projects::ExternalsController
  private
  def _creative_proxy
    _project.pictures
  end
  def _creative_params
    params.require(:pictures).permit(:pic, :name)
  end
end