Feature: Editor opens Editor Administration

    In order to inform about the institutions configurations
    As an Editor
    I want to see institution names, codes, and institutional author 

    Background:
        Given an logged in Editor

    @updated
    @TEST_NP-4153
    @364
    Scenario: Editor opens institutions configuration
        When the Editor opens the institutions configuration menu item
        Then the Editor sees following information about own institution
            | Institution's norwegian name   |
            | Institution's sami name        |
            | Institution's english name     |
            | Institution's short name       |
            | Institution's ROR              |
            | Institution's author intentity |
            | Institution's Feide domain     |
        And the Editor sees a menu with following options
            | Institutions configuration |
            | Vocabulary settings        |
            | Publishing strategi        |
    #        | DOI configurasjon          |
    #        | Sletting av publikasjoner  |
    #        | NVI-rapportering           |
        And "Institutions configuration" is the active choice

Kall inn til møte med ref.gr. i neste veke

    @TEST_NP-4156
    @2445
    Scenario Outline: Editor sees fields for Vocabulary settings
        Given Editor opens Editor Administration
        And they see Vocabulary settings
        Then they can set "<Vocabulary>" to be one of:
            | Disabled |
            | Allowed  |
            | Default  |
        And they see a Save Button
        Examples:
            | Vocabulary    |
            | HRCS Activity |
            | HRCS Category |