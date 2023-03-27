Feature: Creator opens their Research Profile from My Page

    @TEST_NP-4125
    @test
    Scenario: Creator opens their Research Profile from My Page
        Given that the user is logged in as Creator
        And they open My Page
        When they select Research Profile
        Then they see their Research Profile
        And they see fields:
            | Name                                                                              |
            | Employments                                                                      |
            | Public email                                                                      |
            | ORCID                                                                             |
            | List of publications where the user is a contributor and with status is Published |
