Feature: User logs in

  @217
  Scenario: User without their Feide ID in ARP logs in
    Given that the user logs in with their Feide ID
    And they do not have their Feide ID in any ARP entry
    Then they see a list containing "Name", "Last registration" and "Institutions" for each ARP entry matching their name
    And they see a Create New Author Button
    And they see a Support button

  @1206
  Scenario: User with their Feide ID in ARP logs in
    Given that the user logs in with their Feide ID
    And their Feide ID is in an ARP entry
    Then they can see their name in the menu

  @384
  Scenario: User creates a new Author identity
    Given that the user logs in with their Feide ID
    And they do not have their Feide ID in any ARP entry
    Then they see proposed name for a new Author identity based on data from their Feide account
    When they click Create Author identity button
    Then this new Author identity is added to ARP
    And their Feide ID is added to their Author identity
    And their Organization ID (Cristin ID) is added to their Author identity
    And they can see confirmation message that they have connected an Author identity

  @219
  Scenario: User updates an Author identity
    Given that the user logs in with their Feide ID
    And they do not have their Feide ID in any ARP entry
    And they see a list containing "Name", "Last registration" and "Institutions" for each ARP entry matching their name
    When they select an Author identity
    And they click Connect Author identity
    Then their Feide ID is added to their Author identity
    And their Organization ID (Cristin ID) is added to their Author identity
    And they can see confirmation message that they have connected an Author identity

  @222
  Scenario: User adds an ORCID to their Author identity
    Given that the user has just connected to an Author identity
    And they can see confirmation message that they have connected an Author identity
    And their Author identity do not have any connection to ORCID
    When they click the Next button
    Then they see a dialog for connecting ORCID
    When they click Create or add ORCID
    And they are redirected to ORCID for login
    And they log into ORCID
    And they accept that NVA uses their data
    Then they are redirected back to NVA
    And their ORCID is added to their Author identity
    And they see their ORCID on My Profile