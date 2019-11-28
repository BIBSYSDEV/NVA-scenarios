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
    And they see that the title metadata for the Link look-up is correct
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
    And the available data about people associated with the project is available to the NVA application
    # Note that ORCIDs are not registered in the Cristin Projects DB at this time

  Scenario: User verifies a DOI from a Publication based on a Link
    Given that a user associates a Publication with a Project they have previously registered a Publication
    And the Publication has a DOI
    When they click Open DOI
    Then they see the correct article in the resulting webpage

  Scenario: User verifies information for Journal for a Publication based on a Link
    Given that a user associates a Publication with a Project they have previously registered a Publication
    And the publication is a Journal Article
    When they verify the information from Kanalregisteret that appears in the Journal Metadata
    Then they see that the information for Journal Title is correct
    And they see that the information for ISSN is correct
    And they see that the information for eISSN is correct
    And they see that the information for Publisher is correct
    And they see that the information for Academic Level is correct

  Scenario: User verifies information for a Journal Article Publication data for a publication based on a Link
    Given that a user associates a Publication with a Project they have previously registered a Publication
    And the publication is a Journal Article
    When they verify that the information about the Journal Article Publication
    Then they see information for Volume
    And they see information for Issue
    And they see Page Number information or an Article Number
    # it is implicit that these fields are editable

  Scenario: User sets the value for Publication Type for a Journal Article Publication data for a publication based on a Link
    Given that the user associates a Publication with a Project they have previously registered a Publication
    And have clicked Next
    And they are on the screen for registering information about the Publication Reference
    When they select a Reference Type from the list
        | Journal Article |
    And they select a Publication Subtype from the list
        | Article              |
        | Short communication  |
        | Leader               |
        | Letter to the editor |
        | Review               |
    And they verify a (non-obligatory) DOI from a Publication based on a Link
    And they verify information for Journal for a publication based on a Link
    And they verify (non-obligatory) information for a Journal Article Publication data for a publication based on a Link
    And they select a value for Peer-review
    And they upload a (non-obligatory) Author Agreement
    Then they see that the Next button is enabled

  # Happy day scenario for a DOI-sourced Academic Publication
  # The DOI dereferences to a data document that contains ORCIDs for every Contributor
  # The DOI dereferences to a data document that contains a Grant ID
  # The Grant ID is available in Cristin Project DB
  # Cristin Project DB data document contains the ORCIDs for project members
  # There is a match between all ORCIDs from the DOI data document and (a subset of) the Cristin Project DB Project data document ORCIDs
  # All of the ORCIDs are in the Authority Register for Personas

  Scenario: User processes Contributor information for a Journal Article Publication data for a publication based on a Link
    Given the user sets the value for Publication Type for a Journal Article Publication data for a publication based on a Link
    And they have clicked Next
    When they review the information for Contributors
    Then they see that the Contributors are grouped in sections Authors and Other Contributors
    And they see that the Authors are verified in the Authority Register for Personas
    And they see that the Authors are in the expected order
    And they see that the Authors have the expected institutional affiliations
    And they see that the correct authors have the expected value for Corresponding Author
    And they see that the Other Contributors are listed alphabetically by Surname
    And they see that the Other Contributors have the correct Role, Name and Institution
    And the Next button is enabled

    # Corresponding Author is not in fact present in the Datacite data, but probably will be soon

  # Important note about the "License": This assumes that the article is published in a journal that has a special Unit
  # agreement, which entails that Unit has negotiated a contract for Norwegian corresponding authors
  # In all other cases, a License-picker is provided

  Scenario: User adds license and files to a Publication
    Given the user processes Contributor information for a Journal Article Publication data for a publication based on a Link
    When they click Next
    Then they see the page for Licenses and Files
    And they see information about the Open Access Status for the Journal which they selected on the Reference page based in information from Kanalregisteret
    And they see the Sherpa Romeo data for the Journal which they selected on the Reference page based in information from Kanalregisteret
    And they see that the journal allows publication of the article with the license CCBY 4.0 based in information from Kanalregisteret
    And they upload files for the Publication

    # Kanalregisteret perhaps does not provide all the information we need, this must be viewed as TODO for Kanalregisteret

  Scenario: User uploads files for the Publication
    Given that the user adds license and files to a Publication
    When they drag and drop a file into the File drag-and-drop area
    And they check
        | Accepted version  |
        | Published version |
    And they check Embargo
    And they specify Embargo length
    Then the file is uploaded
    And they can view the File Preview
    And the Next button is enabled

  Scenario: User views Summary
    Given the user uploads files for the Publication
    When they click Next
    Then they see all of the data they have entered
    And validation information for the entered data
    And the Publish in NVA button is enabled

  Scenario: User published Publication
    Given the user views Summary
    When they click Publish in NVA
    Then they see the Publication page containing all data and files
    And the page contains a notification that the Publication is Published
