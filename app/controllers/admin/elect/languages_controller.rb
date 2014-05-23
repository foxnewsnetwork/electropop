class Admin::Elect::LanguagesController < Admin::Elect::ExternalsController
  private
  def _project_derivative
    @external ||= Elect::Language.find params[:id]
  end
end