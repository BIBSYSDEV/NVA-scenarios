Feature: Editor manages curators area of responsibility

    In order to see who is responsible for which parts of the institution
    As an Editor
    I want to see a list of all curators and there area of responsibility

    In order to decide who is responsible for which parts of the institution
    As an Editor
    I want to manage which curators is responsible for which parts of the institution

    Background:
        Given a logged in Editor

    @needJiraTag
    Scenario: Editor views curators and area of responsibility
        Given the Institusion have Curators registered
        When the Editor opens the institution's responsibility menu item
        Then the Editor sees a list that contains
          | Curator's name                             |
          | Curator's ORCID symbol (if present)        |
          | Curator's affiliation                      |
          | Curator's area of responsibility           |
          | Option to add an area of responsibility    |
        And an option to search to locate Curators

    @needJiraTag
    Scenario: Editor activates a Curator in the list
        Given Editor views curators and area of responsibility
        When the Editor moves mouse over a Curator in the list
        Then the list item is highlighted
        And the ORCID is displayed (if present)
        And the Curator's different "area of responsibility" can be deleted
        And the add "area of responsibility" option is made larger to simplify use

    @needJiraTag
    Scenario: Editor delete an Curator's area of responsibility
        Given Editor activates a Curator in the list
        When the Editor uses the option to delete an Curator's area of responsibility
        Then the deleted area of responsibility is removed

    @needJiraTag
    Scenario: Editor adds an area of responsibility to a Curator
       When the Editor selects the option to add an area of responsibility for a Curator
       Then the Editor may select one or more sub-units of own Institution
       And the selected sub-units is added to the Curators area of responsibility
