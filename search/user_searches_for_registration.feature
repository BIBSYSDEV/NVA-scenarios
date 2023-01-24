Feature: User searches for Registration

Scenario: User sees that Published Registration is searchable
    Given User publishes a Registration
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
    
Scenario Outline: User searches for published Registration
    Given that Registration is owned by Organization with Publishing Workflow <Workflow>
    And Publication has status <Status>
    And a User who is not logged in
    When the User searches for the Publication
    Then the Publication is visible in the search results

    Examples:
        | Workflow                       | Status             |
        | User can publish               | Published          |
        | User can publish metadata only | Published          |
        | User requires approval         | Published          |
        | User can publish metadata only | Published Metadata |
