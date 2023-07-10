class CreatePathologies < ActiveRecord::Migration[7.0]
  def change
    create_table :pathologies do |t|
      t.references :patient, null: false, foreign_key: true
      t.boolean :pathology_diabetes
      t.boolean :pathology_heart_disease
      t.boolean :pathology_smoker
      t.boolean :pathology_ex_smoker
      t.boolean :pathology_hypertension
      t.boolean :pathology_more_daily_medications
      t.boolean :pathology_treatment_of_depression
      t.boolean :pathology_family_history_of_cancer
      t.boolean :pathology_had_cancer
      t.boolean :pathology_little_physical_activity
      t.boolean :pathology_zero_physical_activity
      t.boolean :pathology_obesity
      t.boolean :pathology_dyslipidemia
      t.boolean :pathology_high_utilization_of_health_services
      t.boolean :pathology_man
      t.boolean :pathology_evaluate_causes_of_hospital_visits
      t.boolean :pathology_evaluate_risk_of_hospitalization
      t.boolean :pathology_evaluate_references_searches_of_doctor
      t.boolean :pathology_evaluate_the_specialties

      t.timestamps
    end
  end
end
