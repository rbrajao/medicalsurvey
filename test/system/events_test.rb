require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "should create event" do
    visit events_url
    click_on "New event"

    fill_in "Acessurl", with: @event.acessurl
    fill_in "Date end", with: @event.date_end
    fill_in "Date init", with: @event.date_init
    fill_in "Name", with: @event.name
    fill_in "Organization", with: @event.organization_id
    check "Status" if @event.status
    fill_in "Survey", with: @event.survey_id
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "should update Event" do
    visit event_url(@event)
    click_on "Edit this event", match: :first

    fill_in "Acessurl", with: @event.acessurl
    fill_in "Date end", with: @event.date_end
    fill_in "Date init", with: @event.date_init
    fill_in "Name", with: @event.name
    fill_in "Organization", with: @event.organization_id
    check "Status" if @event.status
    fill_in "Survey", with: @event.survey_id
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "should destroy Event" do
    visit event_url(@event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end
