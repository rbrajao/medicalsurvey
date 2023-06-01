class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :birth_date
      t.string :sex
      t.string :self_perception
      t.string :night_as_patient
      t.string :searched_doctor
      t.string :pain_that_impairs
      t.string :usage_profile
      t.string :many_daily_medications
      t.string :have_diabetes
      t.string :glycated_hemoglobin
      t.string :heart_attack
      t.string :family_history_of_cancer
      t.string :what_family_cancer
      t.string :had_cancer
      t.string :what_your_cancer
      t.string :treatment_of_depression
      t.string :memory_disease
      t.string :jitters_that_impairs
      t.string :treatment_for_blood_pressure
      t.string :cholesterol_control
      t.integer :systolic_blood_pressure
      t.string :total_cholesterol
      t.string :hdl
      t.string :abdominal_circumference
      t.string :smoker
      t.bigint :cigarettes_quantity
      t.bigint :many_years_smoked
      t.string :minutes_of_physical_activity
      t.string :active_sex_life
      t.string :someone_to_look
      t.string :who_needs_assistance

      t.timestamps
    end
  end
end
