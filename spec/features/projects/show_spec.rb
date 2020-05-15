require 'rails_helper'

RSpec.describe 'Project show page' do
  it 'shows the projects name and material and the theme this project belongs to' do

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content(news_chic.name)
    expect(page).to have_content("Material: #{news_chic.material}")
    expect(page).to have_content(news_chic.challenge.theme)

    expect(page).to_not have_content(boardfit.name)
    expect(page).to_not have_content("Material: #{boardfit.material}")
    
  end
end
# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
