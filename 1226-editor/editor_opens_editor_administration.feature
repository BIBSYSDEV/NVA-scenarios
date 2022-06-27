Feature: Editor opens Editor Administration

    In order to inform about the institution's configurations
    As an Editor
    I want to see institution names, codes, and institutional author

    Background:
        Given a logged in Editor

    @updated
    @TEST_NP-4153
    @364
    Scenario: Editor opens institutions configuration
        When the Editor opens the institution's configuration menu item
        Then the Editor sees one or many registered official names in Bokmål, English, Nynorsk or Northern Sámi
        And they see all of
            | Institution's short name       |
            | Institution's ROR              |
            | Institution's author intentity |
        And they may also see
            | Institution's Feide domain     |
        And the Editor sees a menu with following options
            | Institutions configuration |
            | Vocabulary settings        |
            | Publishing strategi        |
    #        | DOI configurasjon            |
    #        | curator's responsibility     |
    #        | change owner of registration |
    #        | Sletting av publikasjoner    |
    #        | NVI-rapportering             |
    #        | Lisenser og filer            |
        And "Institution's configuration" is the active choice
