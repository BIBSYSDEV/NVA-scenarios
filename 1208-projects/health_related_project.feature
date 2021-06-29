Feature: Health related Project
    # A "REK" Approved project is a Health Project. 
    # De facto, REK will be the creator of the project, not the User.
    # Future case, if the project is User created, REK will become Project Owner.
    # This feature is first iteration, more work is needed to compleat it.

    @xxx
    Scenario: User opens a Health Project in the Project Wizard
        And the project has an Approval of type "REK"
        When they click the Edit button
        Then User sees the Project Wizard
        And it contains data about the Project
        And they see following locked fields:
            | Title                    |
            | Summary                  |
            | Coordinating Institution |
            | Start Date               |
            | End Date                 |

    @xxx
    Scenario: User opens Participants tab for a Health Project
        Given User sees the Project Wizard
        And the project has an Approval of type "REK"
        When they click the Participants tab
        Then they see an disabled Add Project Manager button
 
   @2697
    Scenario: User sees Clinical Trial Phase for Drug studies
        Given User opens Landing Page for Project
        When the Project is a Drug study
        Then they can see the Project's Clinical Trial Phase
