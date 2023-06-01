require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer = answers(:one)
  end

  test "should get index" do
    get answers_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_url
    assert_response :success
  end

  test "should create answer" do
    assert_difference("Answer.count") do
      post answers_url, params: { answer: { abdominal_circumference: @answer.abdominal_circumference, active_sex_life: @answer.active_sex_life, birth_date: @answer.birth_date, cholesterol_control: @answer.cholesterol_control, cigarettes_quantity: @answer.cigarettes_quantity, family_history_of_cancer: @answer.family_history_of_cancer, glycated_hemoglobin: @answer.glycated_hemoglobin, had_cancer: @answer.had_cancer, have_diabetes: @answer.have_diabetes, hdl: @answer.hdl, heart_attack: @answer.heart_attack, jitters_that_impairs: @answer.jitters_that_impairs, many_daily_medications: @answer.many_daily_medications, many_years_smoked: @answer.many_years_smoked, memory_disease: @answer.memory_disease, minutes_of_physical_activity: @answer.minutes_of_physical_activity, night_as_patient: @answer.night_as_patient, pain_that_impairs: @answer.pain_that_impairs, patient_id: @answer.patient_id, searched_doctor: @answer.searched_doctor, self_perception: @answer.self_perception, sex: @answer.sex, smoker: @answer.smoker, someone_to_look: @answer.someone_to_look, systolic_blood_pressure: @answer.systolic_blood_pressure, total_cholesterol: @answer.total_cholesterol, treatment_for_blood_pressure: @answer.treatment_for_blood_pressure, treatment_of_depression: @answer.treatment_of_depression, usage_profile: @answer.usage_profile, what_family_cancer: @answer.what_family_cancer, what_your_cancer: @answer.what_your_cancer, who_needs_assistance: @answer.who_needs_assistance } }
    end

    assert_redirected_to answer_url(Answer.last)
  end

  test "should show answer" do
    get answer_url(@answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_url(@answer)
    assert_response :success
  end

  test "should update answer" do
    patch answer_url(@answer), params: { answer: { abdominal_circumference: @answer.abdominal_circumference, active_sex_life: @answer.active_sex_life, birth_date: @answer.birth_date, cholesterol_control: @answer.cholesterol_control, cigarettes_quantity: @answer.cigarettes_quantity, family_history_of_cancer: @answer.family_history_of_cancer, glycated_hemoglobin: @answer.glycated_hemoglobin, had_cancer: @answer.had_cancer, have_diabetes: @answer.have_diabetes, hdl: @answer.hdl, heart_attack: @answer.heart_attack, jitters_that_impairs: @answer.jitters_that_impairs, many_daily_medications: @answer.many_daily_medications, many_years_smoked: @answer.many_years_smoked, memory_disease: @answer.memory_disease, minutes_of_physical_activity: @answer.minutes_of_physical_activity, night_as_patient: @answer.night_as_patient, pain_that_impairs: @answer.pain_that_impairs, patient_id: @answer.patient_id, searched_doctor: @answer.searched_doctor, self_perception: @answer.self_perception, sex: @answer.sex, smoker: @answer.smoker, someone_to_look: @answer.someone_to_look, systolic_blood_pressure: @answer.systolic_blood_pressure, total_cholesterol: @answer.total_cholesterol, treatment_for_blood_pressure: @answer.treatment_for_blood_pressure, treatment_of_depression: @answer.treatment_of_depression, usage_profile: @answer.usage_profile, what_family_cancer: @answer.what_family_cancer, what_your_cancer: @answer.what_your_cancer, who_needs_assistance: @answer.who_needs_assistance } }
    assert_redirected_to answer_url(@answer)
  end

  test "should destroy answer" do
    assert_difference("Answer.count", -1) do
      delete answer_url(@answer)
    end

    assert_redirected_to answers_url
  end
end
