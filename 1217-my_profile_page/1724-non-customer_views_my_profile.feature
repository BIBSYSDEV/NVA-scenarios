Feature: Non-customer views My Profile

    @TEST_NP-4109
    @test
    @1724
    Scenario: Non-customer views My Profile
        Given that a User is logged in
        And their Institution is not a Customer of NVA
        When they navigate to My Profile
        Then they see that they have no roles
        And they see an information text explaining why they have no roles
        And they see their Institutions names under Affiliations
