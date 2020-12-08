Feature: Creator opens My Registrations

  @354
  Scenario: Creator opens My Registrations
    Given the user is logged in as Creator
    When they click the button My registrations
    Then they see My registrations
    And they see a list of all unpublished registrations with the fields
      | Title   |
      | Status  |
      | Created |
    And they see each list item has a button Delete and Edit that is enabled
    And they see the navigation bar for unpublished registrations is selected
    And they see the navigation bar for published registrations is enabled
    And they see items with Status
      | Draft    |
      | Rejected |


