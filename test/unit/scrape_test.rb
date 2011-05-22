require 'test_helper'

class ScrapeTest < ActiveSupport::TestCase
  test "first call of update_last_scrape_time creates a Scrape instance" do
    Scrape.delete_all
    assert_equal 0, Scrape.count
    Scrape.update_last_scrape_time
    assert_equal 1, Scrape.count
  end

  test "subsequent call of update_last_scrape_time does not create a Scrape instance" do
    assert_equal 1, Scrape.count
    Scrape.update_last_scrape_time
    assert_equal 1, Scrape.count
  end

  test "calling update_last_scrape_time updates the last scrape time" do
    attrs = Scrape.first.attributes
    Scrape.update_last_scrape_time
    assert_equal     attrs["created_at"], Scrape.first.created_at
    assert_not_equal attrs["updated_at"], Scrape.first.updated_at
  end
end
