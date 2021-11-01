Feature: User searches for Registration

Scenario: User sees that Published Registration is searchable

    Given User registers a Published Registration
    When they navigate to the search page
    And they enter the title of the Registration in the search field

    Then they see the Registration in the list of Published Registrations


Scenario: User changes title of Published Registration
    Given User searches for the title of a Published Registration
    And they see the Registration in the list of Published Registrations
    When they edit the Registration
    And they change the title of the Registration
    And they save the Registration
    And they searches for the Registration
    Then they see the Registration with the changed title in list of Published Registrations