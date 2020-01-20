# encoding: utf-8
# language: en

Feature: MVP
  # This assumes that the Authority Register for Personas is used as an identity keyring
  Scenario: 1. User with no Author identity in the Authority Register for Personas sees possible Author identities
    Given that a user has a valid Feide ID and password
    And they have do not have an identity in the Authority Register for Personas
    When they log in to NVA
    Then the user sees a list of possible Author identities based on a free-text search for their registered name from Feide in the Authority Register for Personas
    And they see the last registered publication for each Author identity based on a SCN (System Control Number) lookup in Alma

  Scenario: 2. User creates an Author identity
    Given that a user with no Author identity in the Authority Register for Personas sees possible Author identities
    When they select a Author identity
    Then the user's Feide ID is added to the record for the Author identity in the Authority Register for Personas
    And the user's Feide organistation id is mapped to a Organisational ID (Cristin ID)
    And the user's Organisational ID (Cristin ID) is added to the record for the Author identity in the Authority Register for Personas
    And the Next button is enabled
  # There should also be a possibility to ask for support if there is a problem in the data, i.e. there are multiple registered Author identities for a single Author
  # Does the response from BARE contain the FEIDE ID?

  Scenario: 3. User has no ORCID associated with their Author identity in the Authority Register for Personas
    Given that the user has created an Author identity
    When they click the Next button
    Then they are asked if they want to add or create an ORCID
  # Does the response body from BARE contain the ORCID?

  Scenario: 4. User attempts to add an ORCID to their Author identity in the Authority Register for Personas
    Given that the user has no ORCID associated with their Author identity in the Authority Register for Personas
    When they click Add ORCID
    Then the user is redirected to ORCID for login

  Scenario: 5. User successfully associates an existing ORCID to their Author identity
    Given that the user attempts to add an ORCID to their Author identity in the Authority Register for Personas
    When they log into ORCID
    And they accept that NVA uses their data
    Then they are redirected back to NVA
    And their ORCID is added to their Author identity in the Authority Register for Personas
    And see their profile page which includes information for
      | Real name          |
      | Feide ID           |
      | Email              |
      | ORCID              |
      | Role(s)            |
      | Institution        |
      | Profile picture    |
      | Contact info       |
      | Preferred language |

  Scenario: 6. User begins registering a Publication
    Given that the user is logged in
    And they are on the start page for logged-in users
    When they click Register new publication
    Then they are redirected to the Register new publication page

  Scenario: 7. User begins registering a Link
    Given that the user begins registering a Publication
    When they click Link to publication
    And enter a Link
    And click Search
    Then they see metadata about the Link in the field below the link retrieved from one of
      | Direct data from Datacite/Crossref (in case link is a DOI)               |
      | Data from Datacite/Crossref from citation_doi meta tag (DOI)             |
      | Data from Datacite/Crossref from dc:identifier meta tag (if a valid DOI) |
      | Data from DC meta tags                                                   |
      | Data from title tag                                                      |
  # There is a logical hierarchy in which these should be requested/used
  # The intention of this step is twofold: 1) NVA knows some useful metadata about the resource, 2) researcher knows that they are linking to the right resource

  Scenario: 8. User registers initial metadata for a Publication based on a Link
    Given that the user begins registering a Link
    And they see that the title metadata for the Link look-up is correct
    When they click Start
    And the Publication metadata registration page is loaded
    Then they see that the Beskrivelse tab is pre-populated with suggested metadata values (if available in the input data from the link) for
      | Title                            |
      | Alternative title(s)             |
      | Abstract                         |
      | Alternative abstract(s)          |
      | Description                      |
      | Publication date                 |
      | NPI-fagfelt                      |
      | Keywords                         |
      | Primary language for publication |
    And they they see that the Reference tab is pre-populated with suggested metadata values (if available in the input data from the link) for
      | Publication type                              |
      | Link (the link that was provided by the user) |
      | The unmapped text for Journal                 |
      | Volume                                        |
      | Issue                                         |
      | Page from                                     |
      | Page to                                       |
      | Article number                                |
      | Peer-review                                   |
    And they they see that the Contributors tab Authors section is pre-populated with suggested metadata values (if available in the input data from the link) for <Author>, <Institution> and <CorrespondingAuthor>
    And they they see that the Contributors tab Contributors section is pre-populated with suggested metadata values (if available in the input data from the link) for <ContributionType>, <Name> and <Institution>
    And they they see that the Files and Licenses tab is pre-populated with suggested metadata values (if available in the input data from the link) for
      | Possible mapped value for License, Archiving policy and Unit agreement |
      | Possible file for upload  (Filename, File size)                        |
    And the Publication is saved and the title is listed in My Publications and marked as Kladd

    Examples:
      | Author                   | Institution      | CorrespondingAuthor |
      | Name Nameson (Not found) | NTNU (Found)     | True                |
      | Jan Jansson (Found)      | MTNU (Not Found) | False               |

    Examples:
      | ContributionType | Name        | Institution     |
      | Photographer     | Jim Jimsson | AVH (Not found) |

  Scenario: 9. User adds NPI data for a Publication based on a Link
    Given the the user registers initial metadata for a Publication based on a Link
    When they click and select a value in the drop-down for NPI subject area
    Then this is added to the metdata for the Publication

  Scenario: 10. User associates a Publication with a Project they have previously registered a Publication
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

  Scenario: 11. User verifies a DOI from a Publication based on a Link
    Given that a user associates a Publication with a Project they have previously registered a Publication
    And the Publication has a DOI
    When they click Open DOI
    Then they see the correct article in the resulting webpage

  Scenario: 12. User verifies information for Journal for a Publication based on a Link
    Given that a user associates a Publication with a Project they have previously registered a Publication
    And the publication is a Journal Article
    When they verify the information from Kanalregisteret that appears in the Journal Metadata
    Then they see that the information for Journal Title is correct
    And they see that the information for ISSN is correct
    And they see that the information for eISSN is correct
    And they see that the information for Publisher is correct
    And they see that the information for Academic Level is correct

  Scenario: 13. User verifies information for a Journal Article Publication data for a publication based on a Link
    Given that a user associates a Publication with a Project they have previously registered a Publication
    And the publication is a Journal Article
    When they verify that the information about the Journal Article Publication
    Then they see information for Volume
    And they see information for Issue
    And they see Page Number information or an Article Number
  # it is implicit that these fields are editable

  Scenario: 14. User sets the value for Publication Type for a Journal Article Publication data for a publication based on a Link
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

  Scenario: 15. User processes Contributor information for a Journal Article Publication data for a publication based on a Link
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

  Scenario: 16. User adds license and files to a Publication
    Given the user processes Contributor information for a Journal Article Publication data for a publication based on a Link
    When they click Next
    Then they see the page for Licenses and Files
    And they see information about the Open Access Status for the Journal which they selected on the Reference page based in information from Kanalregisteret
    And they see the Sherpa Romeo data for the Journal which they selected on the Reference page based in information from Kanalregisteret
    And they see that the journal allows publication of the article with the license CCBY 4.0 based in information from Kanalregisteret
    And they upload files for the Publication

  # Kanalregisteret perhaps does not provide all the information we need, this must be viewed as TODO for Kanalregisteret

  Scenario: 17. User uploads files for the Publication
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

  Scenario: 18. User views Summary
    Given the user uploads files for the Publication
    When they click Next
    Then they see all of the data they have entered
    And validation information for the entered data
    And the Publish in NVA button is enabled

  Scenario: 19. User published Publication
    Given the user views Summary
    When they click Publish in NVA
    Then they see the Publication page containing all data and files
    And the page contains a notification that the Publication is Published

  # Access to the different menu items
  Scenario: 20. User sees non-logged-in menu
    Given the user is not logged in (and has no role)
    When they look at any page in NVA
    Then they see an menu containing
      | Logg inn |

  Scenario: 21. User sees a menu when logged in
    Given the user is logged in (and has no NVA-role)
    When they look at any page in NVA
    Then they see a menu containing
      | Min Profil |
      | Logg ut    |

  Scenario: 22. User sees the menu for Registrator
    Given the user is logged in
    And has the role of Registrator
    When they look at any page in NVA
    Then they see a menu containing
      | Min Profil         |
      | Logg ut            |
      | Ny Registrering    |
      | Mine publiseringer |
      | Meldinger          |

  Scenario: 23. User sees the menu for Institusjonskurator
    Given the user is logged in
    And has the role of Institusjonskurator
    When they look at any page in NVA
    Then they see a menu containing
      | Min Profil       |
      | Logg ut          |
      | Min Arbeidsliste |

  Scenario: 24. User sees the menu for Institusjonsadmin
    Given the user is logged in
    And has the role of Institusjonsadmin
    When they look at any page in NVA
    Then they see a menu containing
      | Min Profil           |
      | Logg ut              |
      | Brukeradministrasjon |
      | Min Institusjon      |

  Scenario: 25. User sees the menu for Institusjonsredaktør
    Given the user is logged in
    And has the role of Institusjonsredaktør
    When they look at any page in NVA
    Then they see a menu containing
      | Min Profil      |
      | Logg ut         |
      | Redaktøroppsett |

  Scenario: 26. User sees the menu for Applikasjonsadministrator
    Given the user is logged in
    And has the role of Applikasjonsadministrator
    When they look at any page in NVA
    Then they see a menu containing
      | Min Profil    |
      | Logg ut       |
      | Institusjoner |

  # Description of each menu item

  # Menu items for anonymous
  Scenario: 27. User opens login page
    Given the user is not logged in
    When they click the menu item Logg inn
    Then the page for login with Feide is opened

  # Menu items for logged in person
  Scenario: 28. User opens the page Min Profil
    Given the user is logged in
    When they click the menu item Min Profil
    Then the page Min Profil is opened
  # Write a new Scenario for this

  Scenario: 29. User logs out
    Given the user is logged in
    When they click the menu item Logg ut
    Then the user is logged out from Feide
    And the search page is opened
    And the user sees non-logged-in menu

  # Menuitems for Registrator
  Scenario: 30. User opens Ny Registrering
    Given the user is logged in as Registrator
    When they click the menu item Ny Registrering
    Then the page Ny Registrering is opened
    And the user see tabs
      | Start med å laste opp fil          |
      | Start med en lenke til publikasjon |
      | Start med forslag fra din ORCID    |

  Scenario: 31. User opens Mine Publiseringer
    Given the user is logged in as Registrator
    When they click the menu item Mine Registreringer
    Then the page Mine Registreringer is opened
    And a list of all unpublished registrations with the fields
      | Navn på publisering |
      | <Status>            |
      | Opprettet           |
    Examples:
      | Status |
      | Kladd  |
      | Avvist |
    And each list item has a button Slett and Rediger that is enabled

  # Actions from Page : Mine Publiseringer (Rediger)
  Scenario: 32. User opens an item in the Mine Publiseringer list
    Given the user is logged in as Registrator
    And has opened the page Mine Publiseringer
    When they click Rediger on an item
    Then the item is opened in the wizard
    And the user sees the Beskrivelse tab
    And the fields in the wizard are populated with values from the saved publication

  # Actions from Page : Mine Publiseringer (Slett)
  Scenario: 33. User opens an item in the Mine Publiseringer list
    Given the user is logged in as Registrator
    And has opened the page Mine Publiseringer
    When they click Slett on an item
    Then a comfirmation pop-up is opened
    When the user selects Yes the publication is marked as Deleted
    When the user selects No the pop-up is closed

  # Menuitems for Institusjonskurator
  Scenario: 34. User opens Min Arbeidsliste
    Given the user is logged in as Institusjonskurator
    When they click the menu item Min Arbeidsliste
    Then the page Min Arbeidsliste is opened
    And the user see the lists
      | Til Godkjenning  |
      | Brukerstøtte     |
      | DOI-forespørsler |
    And the lists have fields
      | Saken gjelder |
      | Innsender     |
      | Dato          |
    And a button Åpne that is enabled

  # Actions from Page : Min Arbeidsliste
  Scenario: 35. User opens an item in the Til Godkjenning or DOI request list
    Given the user is logged in as Institusjonskurator
    And has opened the page Min Arbeidsliste
    And they select a <Tab>
    When they click Åpne on an item
    Then the item is opened in the wizard
    And the user sees the Innsending tab
    And <Button> is enabled

    Examples:
      | Tab             | Button     |
      | Til Godkjenning | Publish    |
      | DOI request     | Create DOI |

  # Menuitems for Institusjonsadmin
  Scenario: 36. The user opens Brukeradministrasjon
    Given the user is logged in as Institusjonsadmin
    When they click the menu item Brukeradministrasjon
    Then the page Brukeradministrasjon is opened
    And the user sees a list of all users connected to their institution
    And the users are grouped by NVA-roles
    And has the fields
      | ID             |
      | Navn           |
      | Dato opprettet |
    And a button Fjern that is enabled for each user
    And a link to add a user with a specific role

  Scenario: 37. The user opens Min Institusjon
    Given the user is logged in as Institusjonsadmin
    When they click the menu item Min Institusjon
    Then are on the page Min Institusjon

  Scenario: 38. The Admin user creates an Organization
    Given the admin user has opened Min Institusjon
    When they fill in the fields
      | Navn i organisasjonsregisteret |
      | Visningsnavn                   |
      | Forkortet visningsnavn         |
      | CNAME                          |
      | Institusjons DNS               |
    And check a checkbox
      | Publisering må godkjennes av kurator |
    And upload a new logo  #might need describing
    Then they see a message telling them that the information was saved
    And they can click the link to the institutional portal

  Scenario: 39. Admin user views the institutional portal
    Given the admin user has created an Organization
    When they click the link to the institutional portal on the Organization page
    Then they see the web address in their web browser is the CName + nva.unit.no
    And the page has the same title as they entered in the Organization page

  # Actions from page : Brukeradministrasjon
  Scenario: 40. Institusjonsadmin adds a role to a user
    Given the user is logged in as Institusjonsadmin
    When they click the link Ny <role> in the page Brukeradministrasjon
    Then the page adds a line with the fields
      | ID   |
      | Navn |
    And a button Legg til that is enabled
    Examples:
      | Role                      |
      | Institusjonsadmin         |
      | Institusjonskurator       |
      | Redaktør                  |
      | Registrator               |
      | Applikasjonsadministrator |
      | Bruker                    |

  # Menuitems for Redaktør
  Scenario: 41. The user opens Redaktøroppsett
    Given the user is logged in as Redaktør
    When they click the menu item Redaktøroppsett
    Then the page Redaktøroppsett is opened
    And has the fields
      | Epost |
    And a button Lagre that is enabled

  # Menuitems for Applikasjonsadmin
  Scenario: 42. The user opens Institusjoner
    Given the user is logged in as Applikasjonsadmin
    When they click the menu item Institusjoner
    Then the page Institusjoner is opened
    And the user see a liste of all institution (customers)
    And has the fields
      | Institusjon |
      | Oprettet    |
      | Redaktør    |
    And a button Åpne that is enabled for each institution
    And a button Opprett institusjon that is enabled

  # Actions from page : Institusjon (Add/Update)
  Scenario: 43. Applikasjonsadmin changes a new institution
    Given the user is logged in as Applikasjonsadmin
    When they click the link Opprett institusjon or Åpne in the page Institusjoner
    Then the page Institusjon is opened with the fields
      | Navn i organisasjonsregisteret  |
      | Visningsnavn på institusjonen   |
      | Forkortet navn på institusjonen |
      | Arkivnavn                       |
      | CNAME                           |
      | Institusjonsadmin ID            |
      | Feide Organisasjons ID          |
    And a button Legg til that is enabled
