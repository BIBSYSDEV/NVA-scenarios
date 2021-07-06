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

    @2697
    Scenario: User sees Clinical Trial Phase for Drug studies
        Given User opens Landing Page for Project
        When the Project is a Drug study
        Then they can see the Project's Clinical Trial Phase

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

    @2633
    Scenario: User opens Results for a Project
        Given User opens Landing Page for Project
        When they expand "Results"
        Then they see a list of Results

    @2904
    Scenario: User Publish a Draft Project
        Given User opens Landing Page for Project
        And the Project status is Draft
        And User has one of these role in the project:
            | Curator         |
            | Project Owner   |
            | Project Manager |
        And the project has all obligated fields
        And the User see the enabled Publish Button
        When the User clicks on the Publish Button
        Then the project status is Published 
        And the Project has a public accessible Landing Page