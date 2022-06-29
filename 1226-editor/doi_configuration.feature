Feature: Editor sees DOI configuration

    In order to inform about the institution's DOI configurations
    As an Editor
    I want to see information about my institutions DOI configuration

    Background:
        Given a logged in Editor

    @needJiraTag
    Scenario: Editor opens institutions DOI configuration
        Given the Institution don't have an DOI configuration
        When the Editor opens the institution's DOI configuration menu item
        Then the Editor sees a link to Sikt to order DOI service
        And some other text informing about the DOI service

    @needJiraTag
    Scenario: Editor opens institutions DOI configuration
        Given the Institusion got an DOI configuration
        When the Editor opens the institution's DOI configuration menu item
        Then the Editor sees following information
            | DataCite Member ID |
            | Institutions DOI prefix |
          And some other text informing about the DOI service
