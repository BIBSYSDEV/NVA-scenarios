Feature: Health related Project
        
    In order to do health research a project needs an REK approval
    As a logged in User
    I want to see the current REK approval of my project

    In order to report correctly to HOD about health research project
    As a Anonymus User
    I want to see the Clinical Trial Phase for Drug studies on Landing Page

    Rule:
    * A project with a REK Approval is a Health Project
    * A REK approval originate from REK, through a API call
    * A REK approval containing a ProjectID, update that project 
    * A REK approval lacking a ProjectID, originate a new Project
    * Health Project need an updated REK Approval to change title, coordinating institution, start date, end data or participants of type PRO_MANAGER.

    Questions:
    * Do REK send us changed/updated approvals today?
    * Do a REK approval have a field for our Project ID?
    * How do we cleen up that REK is Project Owner on a lot of projects today?

    Background: 
        Given The Project has a Approval of type "REK"

    Scenario: User opens a Health Project in the Project Wizard
        When the User tries to edit a project 
        Then they are notified that an updated REK approval is needed to change:
            | Title                    |
            | Coordinating Institution |
            | Start Date               |
            | End Date                 |
            | Project Manager          | 
 
   @2697
    Scenario: User sees Clinical Trial Phase for Drug studies
        When the Project is a Drug study
        Then the Landing Page contains the Project's Clinical Trial Phase
