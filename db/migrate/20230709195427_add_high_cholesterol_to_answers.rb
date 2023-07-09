class AddHighCholesterolToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :high_cholesterol, :string
  end
end
