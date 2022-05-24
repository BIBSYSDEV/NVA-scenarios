Feature: Creator selects Resource type Research Data

    #Deprecated - to be removed

    @TEST_NP-4077
    @2850
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Research Data"
        Given Creator navigates to Resource Type tab
        When they select the Resource type "Research Data"
        Then they see a list of subtypes:
            | Data Management Plan |
