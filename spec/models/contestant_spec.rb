require 'rails_helper'


RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe '#years_experience' do
    it 'can calculate the average years experience of contestants' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 14)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 10)

      contestants = [jay, gretchen]

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)

      expect(news_chic.years_experience).to eq(12)
    end
  end
end
