class PresentationsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :presentations, :last_scrape

  def index
    respond_with presentations
  end

  private

  def presentations
    @presentations ||= Presentation.scoped
  end

  def last_scrape
    Scrape.last
  end
end