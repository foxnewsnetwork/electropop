class Admin::Elect::Projects::LanguagesController < Admin::Elect::Projects::ExternalsController
  private
  def _creative_proxy
    _project.languages
  end
  def _creative_params
    params.require(:languages).permit(:percentage, :name)
  end
end