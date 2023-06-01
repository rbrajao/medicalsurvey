require "application_system_test_case"

class AnswersTest < ApplicationSystemTestCase
  setup do
    @answer = answers(:one)
  end

  test "visiting the index" do
    visit answers_url
    assert_selector "h1", text: "Answers"
  end

  test "should create answer" do
    visit answers_url
    click_on "New answer"

    fill_in "Abdominal circumference", with: @answer.abdominal_circumference
    fill_in "Active sex life", with: @answer.active_sex_life
    fill_in "Birth date", with: @answer.birth_date
    fill_in "Cholesterol control", with: @answer.cholesterol_control
    fill_in "Cigarettes quantity", with: @answer.cigarettes_quantity
    fill_in "Family history of cancer", with: @answer.family_history_of_cancer
    fill_in "Glycated hemoglobin", with: @answer.glycated_hemoglobin
    fill_in "Had cancer", with: @answer.had_cancer
    fill_in "Have diabetes", with: @answer.have_diabetes
    fill_in "Hdl", with: @answer.hdl
    fill_in "Heart attack", with: @answer.heart_attack
    fill_in "Jitters that impairs", with: @answer.jitters_that_impairs
    fill_in "Many daily medications", with: @answer.many_daily_medications
    fill_in "Many years smoked", with: @answer.many_years_smoked
    fill_in "Memory disease", with: @answer.memory_disease
    fill_in "Minutes of physical activity", with: @answer.minutes_of_physical_activity
    fill_in "Night as patient", with: @answer.night_as_patient
    fill_in "Pain that impairs", with: @answer.pain_that_impairs
    fill_in "Patient", with: @answer.patient_id
    fill_in "Searched doctor", with: @answer.searched_doctor
    fill_in "Self perception", with: @answer.self_perception
    fill_in "Sex", with: @answer.sex
    fill_in "Smoker", with: @answer.smoker
    fill_in "Someone to look", with: @answer.someone_to_look
    fill_in "Systolic blood pressure", with: @answer.systolic_blood_pressure
    fill_in "Total cholesterol", with: @answer.total_cholesterol
    fill_in "Treatment for blood pressure", with: @answer.treatment_for_blood_pressure
    fill_in "Treatment of depression", with: @answer.treatment_of_depression
    fill_in "Usage profile", with: @answer.usage_profile
    fill_in "What family cancer", with: @answer.what_family_cancer
    fill_in "What your cancer", with: @answer.what_your_cancer
    fill_in "Who needs assistance", with: @answer.who_needs_assistance
    click_on "Create Answer"

    assert_text "Answer was successfully created"
    click_on "Back"
  end

  test "should update Answer" do
    visit answer_url(@answer)
    click_on "Edit this answer", match: :first

    fill_in "Abdominal circumference", with: @answer.abdominal_circumference
    fill_in "Active sex life", with: @answer.active_sex_life
    fill_in "Birth date", with: @answer.birth_date
    fill_in "Cholesterol control", with: @answer.cholesterol_control
    fill_in "Cigarettes quantity", with: @answer.cigarettes_quantity
    fill_in "Family history of cancer", with: @answer.family_history_of_cancer
    fill_in "Glycated hemoglobin", with: @answer.glycated_hemoglobin
    fill_in "Had cancer", with: @answer.had_cancer
    fill_in "Have diabetes", with: @answer.have_diabetes
    fill_in "Hdl", with: @answer.hdl
    fill_in "Heart attack", with: @answer.heart_attack
    fill_in "Jitters that impairs", with: @answer.jitters_that_impairs
    fill_in "Many daily medications", with: @answer.many_daily_medications
    fill_in "Many years smoked", with: @answer.many_years_smoked
    fill_in "Memory disease", with: @answer.memory_disease
    fill_in "Minutes of physical activity", with: @answer.minutes_of_physical_activity
    fill_in "Night as patient", with: @answer.night_as_patient
    fill_in "Pain that impairs", with: @answer.pain_that_impairs
    fill_in "Patient", with: @answer.patient_id
    fill_in "Searched doctor", with: @answer.searched_doctor
    fill_in "Self perception", with: @answer.self_perception
    fill_in "Sex", with: @answer.sex
    fill_in "Smoker", with: @answer.smoker
    fill_in "Someone to look", with: @answer.someone_to_look
    fill_in "Systolic blood pressure", with: @answer.systolic_blood_pressure
    fill_in "Total cholesterol", with: @answer.total_cholesterol
    fill_in "Treatment for blood pressure", with: @answer.treatment_for_blood_pressure
    fill_in "Treatment of depression", with: @answer.treatment_of_depression
    fill_in "Usage profile", with: @answer.usage_profile
    fill_in "What family cancer", with: @answer.what_family_cancer
    fill_in "What your cancer", with: @answer.what_your_cancer
    fill_in "Who needs assistance", with: @answer.who_needs_assistance
    click_on "Update Answer"

    assert_text "Answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Answer" do
    visit answer_url(@answer)
    click_on "Destroy this answer", match: :first

    assert_text "Answer was successfully destroyed"
  end
end
