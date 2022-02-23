Feature: User logs in

  @TEST_NP-4812
  Scenario: User logs in based on Customer Institution settings
    Given that the User is not authenticated
    When they start logging in
    Then they must select a Customer Institution
    And they can log in with the selected Customer Institution's login flow

  @TEST_NP-4813
  Scenario: User without profile in Cristin tries to log in
    Given User logs in based on Customer Institution settings
    When they do not have a profile in Cristin
    Then they are not logged in

  @TEST_NP-4814
  Scenario: User with profile in Cristin tries to log in
    Given User logs in based on Customer Institution settings
    When they have a profile in Cristin
    Then they are logged in

  @TEST_NP-4229
  @28
  Scenario: A user is already authenticated with Feide (single sign on)
    Given that the user is already authenticated with Feide
    When they navigate to the Start page
    And they click Log in
    And they are redirected to Feide
    And they click on the identity they wish to proceed with in the Feide interface
    Then they are redirected back to the Start page
    And they see their name in the Menu

  @TEST_NP-4233
  @test
  @353
  Scenario: A user logs out
    Given that the user is logged in
    When they click on the Menu
    And they click Log out
    Then they are logged out of the NVA application
