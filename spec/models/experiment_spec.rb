require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many(:hypotheses)}
  it {should have_many(:scientists).through(:hypotheses)}
  it {should have_many(:labs).through(:scientists)}

  describe "class methods" do
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

    it "long_running_exp method" do
      expect(Experiment.long_running_exp).to eq([@experiment1, @experiment2])
    end
  end
end

