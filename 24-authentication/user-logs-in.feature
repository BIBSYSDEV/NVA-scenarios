Feature: User logs in

  @TEST_NP-4225
  @test
  Scenario: User with their National Identification Number in Cristin logs in
    Given that the user logs in
    And their National Identification Number is in an Cristin Person entry
    Then they can see their name in the menu

  @TEST_NP-4232
  @test
  Scenario: User creates a new Cristin Person
    Given that the user logs in
    And they do not have their National Identification Number in any Cristin Person entry
    Then they see a form to input name
    When they click Create Cristin Person button
    Then this new Cristin Person is added to Cristin
    And they can see confirmation message that they have created a Cristin Person

  @TEST_NP-4231
  @test
  Scenario: User adds an ORCID to their Cristin Person
    Given that the user has just connected to an Cristin Person
    And they can see confirmation message that they have connected an Cristin Person
    And their Cristin Person do not have any connection to ORCID
    When they click the Next button
    Then they see a dialog for connecting ORCID
    When they click Create or add ORCID
    And they are redirected to ORCID for login
    And they log into ORCID
    And they accept that NVA uses their data
    Then they are redirected back to NVA
    And their ORCID is added to their Cristin Person
    And they see their ORCID on My Profile

  @TEST_NP-4226
  @351
  Scenario: A user logs in with Feide for the first time
    Given that the user has valid Feide credentials
    And they have NOT logged in with Feide before
    And they are on the Start page
    When they click Log in
    And they are redirected to Feide
    And they enter their Feide credentials
    And they approve sharing of data with the NVA application regarding
      | Username            |
      | Email address       |
      | Real name           |
      | Affiliation         |
      | Organization number |
    Then they are redirected back to the Start page
    And they see their name in the Menu
    And they see the Connect Author dialog

  @TEST_NP-4230
  @test
  Scenario: User connects Author
    Given that the user logs in with Feide for the first time
    When they click OK in the Connect Author dialog
    Then the Connect Author dialog closes
    And they see a confirmation dialog

  @TEST_NP-4229
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
  Scenario: A user logs out
    Given that the user is already logged in
    When they click on the Menu
    And they click Log out
    Then they are logged out of the NVA application

