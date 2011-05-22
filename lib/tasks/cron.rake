desc "Daily re-scrape of the RailsConf 2011 presentations and ratings"
task :cron => :environment do
  Presentation.refresh_all

  if scrape = Scrape.first
    scrape.updated_at_will_change!
    scrape.save!
  else
    Scrape.create!
  end
end