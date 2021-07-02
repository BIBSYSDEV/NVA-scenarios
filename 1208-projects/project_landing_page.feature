Feature: Project Landing Page

    @2630
    Scenario: User opens Landing Page for Project
        Given A Anonymous User uses a browser
        When they open a Project Landing Page
        Then they see:
            | Project Title                |
            | Project Owner Institution    |
            | Project Manager              |
            | Project Period               |
            | Financing                    |
            | Approvals                    |
        And they see collapsed panels:
            | Scientific summary |
            | Participants       |
            | Results            |
        And they see number of elements of Participants and Results

    @2886
    Scenario Outline: Privileged user sees Edit button for Project
        Given User opens Landing Page for Project
        When the User has the "<Role>" role for the project
        Then they can see an Edit button
        Examples:
            | Role                  |
            | Curator               |
            | Project Manager       |
            | Local Project Manager |

    @2885a
    Scenario Outline: Privileged user sees Delete button for Project
        Given User opens Landing Page for Project
        When the User has the "<Role>" role for the project
        Then they can see a Delete button
        Examples:
            | Role            |
            | Project Manager |
            | Curator         |

    @2885b
    Scenario: Privileged user clicks the Delete Button for a Project
        Given Privileged user sees Delete button for Project
        When they click the Delete Button 
        Then they see a Confirm Dialog

    @2885c
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

    @2632a
    Scenario: User opens Participants for a Project
        Given User opens Landing Page for Project
        When they expand "Participants"
        Then they see a list of Participants and their:
            | Name        |
            | Role        |
            | Affiliation |

    @2632b
    Scenario: User sees Project Manager for a Project
        Given User opens Participants for a Project
        When they see a Project Manager
        Then they see fields:
            | Start Date  |

    @2633
    Scenario: User opens Results for a Project
        Given User opens Landing Page for Project
        When they expand "Results"
        Then they see a list of Results
