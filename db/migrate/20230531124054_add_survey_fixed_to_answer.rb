class AddSurveyFixedToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :survey_fixed, null: false, foreign_key: true
  end
end
