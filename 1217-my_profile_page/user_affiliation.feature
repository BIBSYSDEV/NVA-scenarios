Feature: User adds and removes organization

  @test
  @405
  Scenario: User sees a Subunit from My Profile
    Given User opens Add Institution from My Profile
    When they enter an Institution name
    And they select an Institution
    Then they see Subunit dropdown containing all the subunits at their Institution

  @test
  @407
  Scenario: User selects a Subunit from My Profile
    Given user sees a Subunit from My Profile
    When they select a Subunit from the Subunit dropdown
    And they click on a subunit
    Then they see the new Institution and subunit in My Profile

  @test
  @410
  Scenario: User opens Add Institution from My Profile
    Given user opens the page My Profile
    When they click Add Institution
    Then they see the Autosearch box for Institutions

  @test
  @411
  Scenario: User adds an Institution from My Profile
    Given User opens Add Institution from My Profile
    When they enter an Institution name
    And they select an Institution
    And they see a button Add that is enabled for the new Institution
    And they see a button Cancel that is enabled for the new Institution
    And they click Add
    Then they see the new Institution in My Profile
    And they see a button Remove that is enabled for the new Institution

  @test
  @551
  Scenario: User removes an Institution from My Profile
    Given User sees an Institution from My Profile
    When they click Remove
    And they see a Remove affiliation dialog
    And the click on the Yes button
    Then they no longer see the institution from My Profile
