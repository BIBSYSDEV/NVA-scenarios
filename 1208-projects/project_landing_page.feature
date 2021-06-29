Feature: Project Landing Page

    @2630
    Scenario: User opens Landing Page for Project
        Given Anonymous User views Landing Page for Registration
        And the Registration has a Project
        When they click the Link to a Project
        Then they see:
            | Title     |
            | Owner     |
            | Manager   |
            | Period    |
            | Financing |
            | Approvals |
        And they see collapsed panels:
            | Scientific summary |
            | Participants       |
            | Results            |
        And they see number of elements of Participants and Results

    @xxx
    Scenario Outline: Privileged user sees Edit button for Project
        Given User opens Landing Page for Project
        When the User has the "<Role>" role for the Project
        Then they can see an Edit button
        Examples:
            | Role                  |
            | Curator               |
            | Project Manager       |
            | Local Project Manager |

    @xxx
    Scenario Outline: Privileged user sees Delete button for Project
        Given User opens Landing Page for Project
        When the User has the "<Role>" role for the Project
        And they can see a Delete button
        Examples:
            | Role            |
            | Project Manager |
            | Curator         |

    @xxx
    Scenario: Privileged user clicks the Delete Button for a Project
        Given Privileged user sees Delete button for Project
        When they click the Delete Button 
        Then they see a Confirm Dialog

    @xxx
    Scenario: Privileged user deletes a Project
        Given Privileged user clicks the Delete Button for a Project
        When they Confirm the action
        Then the Confirm Dialog is closed
        And the Project is marked deleted
        And The Project is removed from the Projects list

    @2631
    Scenario: User opens Scientific summary for a Project
        Given User opens Landing Page for Project
        When they expand "Scientific summary"
        Then they see the Scientific summary

    @2632
    Scenario: User opens Participants for a Project
        Given User opens Landing Page for Project
        When they expand "Participants"
        Then they see a list of Participants and their:
            | Name        |
            | Role        |
            | Affiliation |
            | Start Date |

    @2633
    Scenario: User opens Results for a Project
        Given User opens Landing Page for Project
        When they expand "Results"
        Then they see a list of Results
