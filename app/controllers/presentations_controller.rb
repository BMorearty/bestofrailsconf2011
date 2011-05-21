class PresentationsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :presentations

  def index
    respond_with presentations
  end

  private

  def presentations
    @presentations ||= Presentation.scoped
  end
end