    @421
    Scenario: Creator opens their Public Profile from My Publications Page
        Given that the user is logged in as Creator
        And they open My Publications page
        When they click Public Profile
        Then they see their Public Profile
        And they see fields:
            | Name                                                                              |
            | Institutions                                                                      |
            | Public email                                                                      |
            | ORCID                                                                             |
            | List of publications where the user is a contributor and with status is Published |
