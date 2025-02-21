require "rails_helper"

RSpec.describe "Experiment Index Page" do
  before :each do
    @lab1 = Lab.create!(name: "Not Pfizer")
    @lab2 = Lab.create!(name: "Dexter's Lab")

    @scientist1 = @lab1.scientists.create!(name: "Bilbo", specialty: "biology", university: "Hobbiton University")
    @scientist2 = @lab1.scientists.create!(name: "Frodo", specialty: "geology", university: "Hobbiton University")
    @scientist3 = @lab2.scientists.create!(name: "Steve Ballmer", specialty: "liquid sciences", university: "Microsoft University")
    @scientist4 = @lab2.scientists.create!(name: "Jeff Bezos", specialty: "money", university: "University of Amazon")

    @experiment1 = Experiment.create!(name: "Halfling Leaf", objective: "grow the best leaf in the shire", num_months: 75)
    @experiment2 = Experiment.create!(name: "bottle service", objective: "make the best gin to sell on amazon", num_months: 12)
    @experiment3 = Experiment.create!(name: "Infused Shire Brew", objective: "combine shire plants and steve ballmer alcohol", num_months: 3)

    @hypothesis1 = Hypothesis.create!(scientist_id: @scientist1.id, experiment_id: @experiment1.id)
    @hypothesis2 = Hypothesis.create!(scientist_id: @scientist2.id, experiment_id: @experiment1.id)
    @hypothesis3 = Hypothesis.create!(scientist_id: @scientist3.id, experiment_id: @experiment2.id)
    @hypothesis4 = Hypothesis.create!(scientist_id: @scientist4.id, experiment_id: @experiment2.id)
    @hypothesis5 = Hypothesis.create!(scientist_id: @scientist1.id, experiment_id: @experiment3.id)
    @hypothesis6 = Hypothesis.create!(scientist_id: @scientist2.id, experiment_id: @experiment3.id)
    @hypothesis7 = Hypothesis.create!(scientist_id: @scientist3.id, experiment_id: @experiment3.id)
    @hypothesis8 = Hypothesis.create!(scientist_id: @scientist4.id, experiment_id: @experiment3.id)
  end
  
  describe "Experiment Index Page Information" do
    it "shows all experiments older than 6 months" do
      # User Story 3, Experiment Index Page
      visit "/experiments"

      expect(page).to have_content(@experiment1.name)
      expect(page).to have_content(@experiment2.name)
      expect(page).to_not have_content(@experiment3.name)
      expect(@experiment1.name).to appear_before(@experiment2.name)
    end
  end
end