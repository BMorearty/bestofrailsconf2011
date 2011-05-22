class Scrape < ActiveRecord::Base
  default_scope order('id')

  def self.update_last_scrape_time
    if scrape = Scrape.first
      # Force a save.  If we call updated_at_will_change!, updated_at *won't* change (because
      # it overrides the attribute with its own value).  So we call created_at_will_change!
      # to make updated_at change.  Weird, I know.
      scrape.created_at_will_change!
      scrape.save!
    else
      Scrape.create!
    end
  end
end
