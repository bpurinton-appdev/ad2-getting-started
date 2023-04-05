require "rails_helper"

describe "The /movies page" do
  it "can be visited", points: 1 do
    visit "/movies"

    expect(page.status_code).to be(200),
      "Expected to visit /movies successfully, but couldn't."
  end

  it "has a link to add a movie", points: 1 do
    visit "/movies"

    expect(page).to have_link('Add a new movie', href: "/movies/new"),
      "Expected /movies to have an 'Add a new movie' link to '/movies/new', but link wasn't there or had a typo."
  end
end

describe "The /movies/new page" do
  it "can be visited", points: 1 do
    visit "/movies/new"

    expect(page.status_code).to be(200),
      "Expected to visit /movies/new successfully, but couldn't."
  end

  it "has a form", points: 1 do
    visit "/movies/new"

    expect(page).to have_selector("form"),
      "Expected /movies/new to have a form, but didn't find the form element."

    # expect(page).to have_link('Create movie', href: "/movies"),
    #   "Expected /movies/new to have a 'Create movie' form button to '/movies/new'"
  end

  it "has an authenticity token input", points: 1 do
    visit "/movies/new"

    expect(page).to have_selector("input[name='authenticity_token']")
    # expect(page).to have_selector('input[type="hidden"]')
    # expect(page).to have_field('Descripton')
    # expect(page).to have_selector("input[name='query_titl']")
  end
end

# describe 'routing' do
#   it 'routes GET /movies to MoviesController#index' do
#     expect(get: '/movies').to route_to(controller: 'movies', action: 'index')
#   end
# end

# describe "The new movies page" do
#   it "has a form to enter a new movie", points: 1 do
#     visit "/movies/new"

#   end
# end
