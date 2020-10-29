Feature: User without any roles views My Profile

    @1725
    Scenario: User without any roles views My Profile
        Given that a User is logged in with Feide
        And their Institution is a Customer of NVA
        And their Administrator has not assigned any roles to them
        When they navigate to My Profile
        Then they see that they have no roles
        And they see an Information text explaining why they have no roles