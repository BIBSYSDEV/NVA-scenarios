Feature: Editor manages curators area of responsibility

    In order to see who is responsible for which parts of the institution
    As an Editor
    I want to see a list of all curators and there area of responsibility

    In order to decide who is responsible for which parts of the institution
    As an Editor
    I want to manage which curators is responsible for which parts of the institution

    Background:
        Given a logged in Editor

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

    Scenario: Editor activates a Curator in the list
        Given Editor views curators and area of responsibility
        When the Editor hovers over a Curator in the list
        Then the list item is highlighted
        And the add-"area of responsibility" option is made larger to simplify use

    Scenario: Editor hovers over an ORCID icon
        Given Editor views curators and area of responsibility
        When the Editor hovers over an ORCID icon
        Then the 16 digit ORCID ID is viewed (formatted as "0000-0000-0000-0000")
        And the viewed ID must be possible to copy

    Scenario: Editor hovers over a "See more"-option in the list
        Given Editor views curators and area of responsibility
        When the Editor hovers over a "See more"-option in the list
        Then the Curator's entire list of area of responsibility is displayed

    Scenario: Editor edit an Curators area of responsibility
        Given Editor activates a Curator in the list
        When the Editor uses the option to edit an Curators area of responsibility
        Then the Institution's sub-units is displayed
        And any current area of responsibility is selected

    Scenario: Editor aborts the edit of an Curators area of responsibility
        Given Editor edit an Curators area of responsibility
        When the Editor aborts or closes the displayed sub-units
        Then no changes is done to Curators area of responsibility

    Scenario: Editor persist changes to a Curators area of responsibility
        Given Editor edit an Curators area of responsibility
        When the Editor persist any changes to an Curators area of responsibility
        Then the changed sub-units is persisted to the Curators area of responsibility

    Scenario: Editor have persisted a change to a Curators area of responsibility
        Given Editor persist changes to a Curators area of responsibility
        When the Editor have persisted any change to an Curators area of responsibility
        Then the changed Curator is highlighted in the list
