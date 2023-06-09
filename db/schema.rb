# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_10_160836) do
  create_table "answers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "birth_date"
    t.string "sex"
    t.string "self_perception"
    t.string "night_as_patient"
    t.string "searched_doctor"
    t.string "pain_that_impairs"
    t.string "usage_profile"
    t.string "many_daily_medications"
    t.string "have_diabetes"
    t.string "glycated_hemoglobin"
    t.string "heart_attack"
    t.string "family_history_of_cancer"
    t.string "what_family_cancer"
    t.string "had_cancer"
    t.string "what_your_cancer"
    t.string "treatment_of_depression"
    t.string "memory_disease"
    t.string "jitters_that_impairs"
    t.string "treatment_for_blood_pressure"
    t.string "cholesterol_control"
    t.integer "systolic_blood_pressure"
    t.string "total_cholesterol"
    t.string "hdl"
    t.string "abdominal_circumference"
    t.string "smoker"
    t.bigint "cigarettes_quantity"
    t.bigint "many_years_smoked"
    t.string "minutes_of_physical_activity"
    t.string "active_sex_life"
    t.string "someone_to_look"
    t.string "who_needs_assistance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "bmi_height"
    t.float "bmi_weight"
    t.integer "age"
    t.string "bmi_classification"
    t.float "bmi_value"
    t.float "initial_score"
    t.float "hospitalization_score"
    t.float "abvita_score"
    t.float "cardio_score"
    t.float "final_score"
    t.string "hospitalization_classification"
    t.string "abvita_classification"
    t.string "cardio_classification"
    t.string "final_classification"
    t.string "high_cholesterol"
    t.index ["patient_id"], name: "index_answers_on_patient_id"
  end

  create_table "events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "organization_id", null: false
    t.string "name"
    t.datetime "date_init"
    t.datetime "date_end"
    t.string "acessurl"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["survey_id"], name: "index_events_on_survey_id"
  end

  create_table "organizations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "fantasyname"
    t.string "cnpj"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pathologies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.boolean "pathology_diabetes"
    t.boolean "pathology_heart_disease"
    t.boolean "pathology_smoker"
    t.boolean "pathology_ex_smoker"
    t.boolean "pathology_hypertension"
    t.boolean "pathology_more_daily_medications"
    t.boolean "pathology_treatment_of_depression"
    t.boolean "pathology_family_history_of_cancer"
    t.boolean "pathology_had_cancer"
    t.boolean "pathology_little_physical_activity"
    t.boolean "pathology_zero_physical_activity"
    t.boolean "pathology_obesity"
    t.boolean "pathology_dyslipidemia"
    t.boolean "pathology_high_utilization_of_health_services"
    t.boolean "pathology_man"
    t.boolean "pathology_evaluate_causes_of_hospital_visits"
    t.boolean "pathology_evaluate_risk_of_hospitalization"
    t.boolean "pathology_evaluate_references_searches_of_doctor"
    t.boolean "pathology_evaluate_the_specialties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_pathologies_on_patient_id"
  end

  create_table "patients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.string "name"
    t.date "birthday"
    t.string "cpf"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_patients_on_event_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "surveys", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.boolean "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "patients"
  add_foreign_key "events", "organizations"
  add_foreign_key "events", "surveys"
  add_foreign_key "pathologies", "patients"
  add_foreign_key "patients", "events"
  add_foreign_key "patients", "users"
end
