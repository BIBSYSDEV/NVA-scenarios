  @354
  Scenario Outline: Creator opens My Publications
    Given the user is logged in as Creator
    When they click the menu item My Publications
    Then they see My Publications
    And they see a list of all unpublished registrations with the fields
      | Title    |
      | <Status> |
      | Created  |
    And they see each list item has a button Delete and Edit that is enabled
    And they see the navigation bar for unpublished registrations is selected
    And they see the navigation bar for published registrations is enabled

    Examples:
      | Status   |
      | Draft    |
      | Rejected |
