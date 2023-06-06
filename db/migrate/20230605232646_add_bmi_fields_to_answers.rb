class AddBmiFieldsToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :bmi_height, :float
    add_column :answers, :bmi_weight, :float
  end
end
