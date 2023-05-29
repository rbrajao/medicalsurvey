class Event < ApplicationRecord
  belongs_to :survey
  belongs_to :organization

  has_many :patients
end
