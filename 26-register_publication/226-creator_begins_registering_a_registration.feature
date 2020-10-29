  Feature: Creator begins registering a Registration

  @226
  Scenario: Creator begins registering a Registration
    Given that the user is logged in
    And they have Role Creator
    And they are on the Start page
    When they click the New Registration button
    Then they are redirected to the New Registration page
    And they see an Expansion panel for Upload file
    And they see an Expansion panel for Link to resource
