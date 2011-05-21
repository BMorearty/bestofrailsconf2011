desc "Daily re-scrape of the RailsConf 2011 presentations and ratings"
task :cron => :environment do
  Presentation.refresh_all
end