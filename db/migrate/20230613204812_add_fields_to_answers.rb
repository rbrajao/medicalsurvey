class AddFieldsToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :age, :integer
    add_column :answers, :bmi_classification, :string
    add_column :answers, :bmi_value, :float
    add_column :answers, :initial_score, :float
    add_column :answers, :hospitalization_score, :float
    add_column :answers, :abvita_score, :float
    add_column :answers, :cardio_score, :float
    add_column :answers, :final_score, :float
    add_column :answers, :hospitalization_classification, :string
    add_column :answers, :abvita_classification, :string
    add_column :answers, :cardio_classification, :string
    add_column :answers, :final_classification, :string
  end
end
