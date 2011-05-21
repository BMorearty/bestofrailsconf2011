require 'open-uri'

class Presentation < ActiveRecord::Base
  OREILLY               = "http://en.oreilly.com/"
  FULL_SCHEDULE_URL     = "#{OREILLY}rails2011/public/schedule/full"
  PRESENTATION_SELECTOR = "div.en_session_title a"
  TITLE_SELECTOR        = "h1"
  SPEAKERS_SELECTOR     = "div.en_session_speakers"
  TYPE_SELECTOR         = "span.en_session_topics.category"
  DESCRIPTION_SELECTOR  = "div.en_session_description"
  RATING_SELECTOR       = "div.en_grade_average_detail"

  default_scope order('rating DESC')
  scope :rated, where('num_ratings > 0')
  scope :unrated, where(:num_ratings => 0)
  
  # This runs as a cron job.  It refreshes the ratings (and other metadata)
  # of all the presentations.
  def self.refresh_all
    presentations = {}
    full_schedule = Nokogiri::HTML(open(FULL_SCHEDULE_URL), nil, 'utf-8')

    full_schedule.search(PRESENTATION_SELECTOR).each do |presentation_link|
      # Slow down, cowboy! It's just a cron job.
      sleep rand * 3
      attrs = get_attributes(OREILLY + presentation_link["href"])
      unless presentations[attrs[:title]]
        logger.info "loaded #{attrs[:title]}"
        presentations[attrs[:title]] = attrs
      end
    end

    transaction do
      # Brute force, baby.  Destroy and recreate.
      Presentation.delete_all
      presentations.each do |presentation|
        Presentation.create! presentation.second
      end
    end
  end

  private

  def self.get_attributes(href)
    presentation_page = Nokogiri::HTML(open(href), nil, 'utf-8')
    rating_text = presentation_page.at_css(RATING_SELECTOR).try(:content)
    if rating_text
      rating, num_ratings = rating_text.match(/([0-9.]+), ([0-9]+)/)[1, 2]
    end
    {
      :title => presentation_page.at_css(TITLE_SELECTOR).content,
      :description_html => presentation_page.at_css(DESCRIPTION_SELECTOR).inner_html,
      :rating => rating,
      :num_ratings => num_ratings || 0,
      :speakers => presentation_page.at_css(SPEAKERS_SELECTOR).content,
      :presentation_type => presentation_page.at_css(TYPE_SELECTOR).try(:content),
      :url => href
    }
  end
end