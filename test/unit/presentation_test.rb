require 'test_helper'

class PresentationTest < ActiveSupport::TestCase
  test "rated method should return all rated presentations in descending order and no unrated ones" do
    rated = Presentation.rated
    assert_equal [ "The Gettysburg Address", "How to Tie a Tie" ], rated.map(&:title)
  end

  test "unrated method should return all unrated presentations and no unrated ones" do
    rated = Presentation.unrated
    assert_equal [ "Please Don't Come to This Talk" ], rated.map(&:title)
  end
end