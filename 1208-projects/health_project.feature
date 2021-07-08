Feature: Health related Project
    In order to do health research a project needs an REK approval
    As a logged in User
    I want to see the current REK approval of my project

    Rule: A project with a REK Approval is a Health Project

    Rule: A REK approval originate from REK, through a API call

    Rule: A REK approval containing a ProjectID, update that project 

    Rule: A REK approval lacking a ProjectID, originate a new Project

    Rule: Health Project can't change title, coordinating institution, start date, end data or participants of type PRO_MANAGER.

    # Below is <How> the <Whay>, <Who> and <What> is solved according to the rules
    @xxx
    Scenario: User opens a Health Project in the Project Wizard
        And the project has an Approval of type "REK"
        When they click the Edit button
        Then User sees the Project Wizard
        And it contains data about the Project
        And they see following disabled fields:
            | Title                    |
            | Coordinating Institution |
            | Start Date               |
            | End Date                 |
        And they see following enabled fields:
            | Summary                  |
        And a notification that an changed REK approval is needed to change any of the disabled fields

    @xxx
    Scenario: User opens Participants tab for a Health Project
        Given User sees the Project Wizard
        And the project has an Approval of type "REK"
        When they click the Participants tab
        Then they see an disabled Add Project Manager button
        And a notification that an changed REK approval is needed to add a new Project Manager
 
   @2697
    Scenario: User sees Clinical Trial Phase for Drug studies
        Given User opens Landing Page for Project
        When the Project is a Drug study
        Then they can see the Project's Clinical Trial Phase
