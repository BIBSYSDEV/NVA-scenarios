@feature_tag
Feature: A short sentence that describes the content

    Free text area, down to the keyword "Background"

    Documentes how this feature is a part of some Outcomes and show how this helps to deliver the stakeholders Vision in the form of:
        <Whay> --> In order to
        <Who>  --> As a 
        <What> --> I want to
        (<How> --> One or more Scenarios, below Background)
    
    In order to do health research a project needs an REK approval
    As a logged in User
    I want to see the current REK approval of my project

    @rule_tag
    Rule:
    - A project with a REK Approval is a Health Project

    Questions:
    * Do REK send us changed/updated approvals today?

    Given bør kun brukes når det er ein bestemt sekvens av scenario - generelt kan Given utrykkes som ein del av Then -> DRY-code
    Så langt som mulig bør ikkje Scenario inneholde ord som click og button etc - det skaper vedlikeholdsutfordringer
    Test pyramiden oppfordrer til at omfanget av tester skal ligge mot "bunnen" av stacken - ikkje på UI. Brudd på dette utfordrer CI, da build'n'deploy raskt vil overstige 10-15 min

    The following section is a list of Givens that is the starting point for all following Scenarios. Use it to keep the scenarios DRY (Don't Repeat Yourselve)
    Background: 
        Given The Project has a Approval of type "REK"

    @scenario_tag
    @xxx - referense to Jira task
    Scenario: User opens a Health Project in the Project Wizard
        When the User tries to edit a project 
        Then they are notified that an updated REK approval is needed to change:
            | Title                    |
            | Coordinating Institution |
            | Start Date               |
            | End Date                 |
            | Project Manager          |

    Scenario Outline: User Edits a Project in the Project Wizard
        Given User opens My Projects
        And User has "<Role>" on the Project
        When they click the Edit Button 
        Then they see the Project in the Project Wizard
        Examples:
            | Role                  |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
