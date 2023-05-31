class Answer < ApplicationRecord
  belongs_to :patient
  belongs_to :survey_fixed
end
