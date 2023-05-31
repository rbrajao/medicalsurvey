class CreateSurveyFixeds < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_fixeds do |t|

      t.timestamps
    end
  end
end
