# encoding: utf-8
# language: en

Feature: User with no Author identity in the Authority Register for Personas sees possible Author identities
  # This assumes that the Authority Register for Personas is used as an identity keyring
  Scenario:
    Given that a user has a valid Feide ID and password
    And they have do not have an identity in the Authority Register for Personas
    When they log in to NVA
    Then the user sees a list of possible Author identities based on a free-text search for their registered name from Feide in the Authority Register for Personas
    And they see the last registered publication for each Author identity based on a SCN (System Control Number) lookup in Alma

  Scenario: User creates an Author identity
    Given that a user with no Author identity in the Authority Register for Personas sees possible Author identities
    When they select a Author identity
    Then the user's Feide ID is added to the record for the Author identity in the Authority Register for Personas
    And the Next button is enabled
    # There should also be a possibility to ask for support if there is a problem in the data, i.e. there are multiple registered Author identities for a single Author
  # Does the response from BARE contain the FEIDE ID?

  Scenario: User has no ORCID associated with their Author identity in the Authority Register for Personas
    Given that the user has created an Author identity
    When they click the Next button
    Then they are asked if they want to add or create an ORCID
    # Does the response body from BARE contain the ORCID?

  Scenario: User attempts to add an ORCID to their Author identity in the Authority Register for Personas
    Given that the user has no ORCID associated with their Author identity in the Authority Register for Personas
    When they click Add ORCID
    Then the user is redirected to ORCID for login

  Scenario: User successfully associates an existing ORCID to their Author identity
    Given that the user attempts to add an ORCID to their Author identity in the Authority Register for Personas
    When they log into ORCID
    And they accept that NVA uses their data
    Then they are redirected back to NVA
    And their ORCID is added to their Author identity in the Authority Register for Personas
    And see their profile page which includes information for
        | Real name |
        | Feide ID  |
        | ORCID     |

  Scenario: User begins registering a Publication
    Given that the user is logged in
    And they are on the start page for logged-in users
    When they click Register new publication
    Then they are redirected to the Register new publication page

  Scenario: User begins registering a Link
    Given that the user begins registering a Publication
    When they click Link to publication
    And enter a Link
    And click Search
    Then they see metadata about the Link in the field below the link retrieved from one of
        | Direct data from Datacite/Crossref (in case link is a DOI)                 |
        | Data from Datacite/Crossref from citation_doi meta tag (DOI)               |
        | Data from Datacite/Crossref from dc:identifier meta tag (if a valid DOI)   |
        | Data from DC meta tags                                                     |
        | Data from title tag                                                        |
    # There is a logical hierarchy in which these should be requested/used
    # The intention of this step is twofold: 1) NVA knows some useful metadata about the resource, 2) researcher knows that they are linking to the right resource

  Scenario: User registers initial metadata for a Publication based on a Link
    Given that the user begins registering a Link
    And they see that the title metdata for the Link look-up is correct
    When they click next
    Then they see that the Publication metadata registration page is pre-filled with suggested metadata values
    And they fill in/edit the obligatory values
        | Title |
        | Year  |

  Scenario: User adds NPI data for a Publication based on a Link
    Given the the user registers initial metadata for a Publication based on a Link
    When they click and select a value in the drop-down for NPI subject area
    Then this is added to the metdata for the Publication

  Scenario: User associates a Publication with a Project they have previously registered a Publication
    Given that the user registers initial metadata for a Publication based on a Link
    And the user's project participation is known via their previously registered publications in NVA
    When they click the Projects search box
    And they see a drop-down containing ten active projects in Cristin Projects DB, ranked-by-year, filtered results
        | their previously registered projects in NVA                                                           |
        | any projects registered in the Cristin Projects DB with their ORCID                                   |
        | any projects associated with a Grant ID from metadata from the Link lookup in the Cristin Projects DB |
        | search results based by free-text search for the the user's name in the Cristin Projects DB           |
    And they select a Project
    Then the Project ID is added to the Publication metadata
    # Note that ORCIDs are not registered in the Cristin Projects DB at this time

  Scenario:


