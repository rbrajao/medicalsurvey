class Patient < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_one :survey_fixed
  has_one :answer
end
