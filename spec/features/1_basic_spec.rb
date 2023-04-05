require "rails_helper"

describe "The /movies page" do
  before do
    visit "/movies"
  end

  it "can be visited", points: 1 do
    expect(page.status_code).to be(200),
      "Expected to visit /movies successfully."
  end

  it "has a link to add a movie", points: 1 do
    expect(page).to have_link('Add a new movie', href: "/movies/new"),
      "Expected /movies to have an 'Add a new movie' link to '/movies/new'."
  end
end

describe "The /movies/new page" do
  before do
    visit "/movies/new"
  end

  it "can be visited", points: 1 do
    expect(page.status_code).to be(200),
      "Expected to visit /movies/new successfully."
  end

  it "has a form", points: 1 do
    expect(page).to have_selector("form[action='/movies']"),
      "Expected /movies/new to have a form with action='/movies'."
  end

  it "has a hidden authenticity token input", points: 1 do
    expect(page).to have_selector("input[name='authenticity_token']", visible: false),
      "Expected the new movie form to have an input field of type='hidden' and name='authenticity_token'."
  end

  it "creates a movie successfully", point: 1 do
    fill_in "Title", with: "My test movie"
    fill_in "Description", with: "description"
    click_button "Create movie"
    expect(page).to have_content("Movie created successfully."),
      "Expected to fill in the new movie form, click 'Create movie', and be redirected to the movie index with a success notice"
  end
end
