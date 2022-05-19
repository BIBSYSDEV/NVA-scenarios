Feature: User logs in

  Scenario: User without Customer Institution logs in
    Given that the User is not authenticated
    When they start logging in
    And their Institution is not a Customer of NVA
    Then they can log in with Feide
    And they must create a Profile in Cristin with their login data to use NVA

  @TEST_NP-4812
  Scenario: User logs in based on Customer Institution settings
    Given that the User is not authenticated
    When they start logging in
    Then they must select a Customer Institution
    And they can log in with the selected Customer Institution's login method

  @TEST_NP-4813
  Scenario: User without a Profile in Cristin tries to log in
    Given User logs in based on Customer Institution settings
    When they do not have a Profile in Cristin
    Then they must create a Profile in Cristin with their login data to use NVA

  @TEST_NP-4814
  Scenario: User with a Profile in Cristin tries to log in
    Given User logs in based on Customer Institution settings
    When they have a Profile in Cristin
    Then they are logged in

  Scenario: User connects to ORCID after login
    Given User has just logged in
    When they have not been logged in before
    Then they can connect to their ORCID profile

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
