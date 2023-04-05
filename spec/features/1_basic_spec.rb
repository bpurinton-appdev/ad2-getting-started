require "rails_helper"

describe "The /movies page" do
  it "can be visited", points: 1 do
    visit "/movies"

    expect(page.status_code).to be(200),
      "Expected to visit /movies successfully, but didn't find it."
  end

  it "has a link to add a movie", points: 1 do
    visit "/movies"

    expect(page).to have_link('Add a new movie', href: "/movies/new"),
      "Expected /movies to have an 'Add a new movie' link to '/movies/new'"
  end
end

describe "The /movies/new" do
  it "can be visited", points: 1 do
    visit "/movies/new"

    expect(page.status_code).to be(200),
      "Expected to visit /movies/new successfully, but didn't find it."
  end

  it "has a 'Create movie' form", points: 1 do
    visit "/movies/new"

    expect(page).to have_selector("forms")

    # expect(page).to have_link('Create movie', href: "/movies"),
    #   "Expected /movies/new to have a 'Create movie' form button to '/movies/new'"
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
