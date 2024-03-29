require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
 test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "span", count: 10
  end

  test "Fill the form with a random word, click the play button, and get a message that the word is not in the grid" do
    visit new_url
    fill_in "word", with: "ezjfozej"
    click_on "submit"
    assert_text "Sorry but ezjfozej is not an english word"
  end
end
