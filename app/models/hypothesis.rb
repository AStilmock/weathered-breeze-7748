class Hypothesis < ApplicationRecord
  belongs_to :scientist
  belongs_to :experiment
end