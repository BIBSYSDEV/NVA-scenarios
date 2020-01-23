    # encoding: utf-8
    # language: en

    (NP-217) Scenario: User with no Feide ID in the Authority Register for Personas sees matching Author identities
    Given that a user has a valid Feide ID and password
    And they have do not have a Feide ID in the Authority Register for Personas
    When they log in
    Then the user sees a list of matching Author identities based on a free-text search for their Registered name from Feide in the Authority Register for Personas
    And they see the last publication by year for each Author identity based on a SCN (System Control Number) lookup in Alma

    (NP-219) Scenario: User updates an Author identity
    Given that a user with no Feide ID in the Authority Register for Personas sees matching Author identities
    When they select an Author identity
    And the user clicks the button to Connect the author ID
    Then the user's Feide ID is added to the Author identity
    And the user's Feide organisation number is mapped to a Organisational ID (Cristin ID)
    And the user's Organisational ID (Cristin ID) is added to the Author identity
    And the Next button is enabled
    # There should also be a possibility to ask for support if there is a problem in the data, i.e. there are multiple registered Author identities for a single Author

    (NP-384) Scenario: User creates an Author identity
    Given that a user has no matching Author identities
    And they see that their name is selected
    When they click the button to Create an Author identity
    Then the user is created in the Authority Register for Personas
    And the user's Feide ID is added to the Author identity
    And the user's Feide organisation number is mapped to a Organisational ID (Cristin ID)
    And the user's Organisational ID (Cristin ID) is added to the Author identity
    And the Next button is enabled

    (NP-221) Scenario: User has no ORCID associated with their Author identity
    Given that the user has updated an Author identity
    When they click the Next button
    Then they are asked if they want to add or create an ORCID

    (NP-222) Scenario: User attempts to add an ORCID to their Author identity
    Given that the user has no ORCID associated with their Author identity
    When they click Add ORCID
    And the user is redirected to ORCID for login
    And they log into ORCID
    And they accept that NVA uses their data
    Then they are redirected back to NVA
    And their ORCID is added to their Author identity
    And they see their ORCID on their Profile page

    (NP-226) Scenario: User begins registering a Publication
    Given that the user is logged in
    And they are on the Start Page
    When they click Register new publication
    Then they are redirected to the Register new publication page

    (NP-228) Scenario: User begins registering with a Link
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

    (NP-385) Scenario: User begins registration by uploading a file
    Given that the user begins registering a Publication
    When they click Upload file
    And uploads a file
    Then they see a thumbnail of the file
    And the Start button is enabled

    (NP-386) Scenario: User begins registration by using suggestions from ORCID
    Given that the user begins registering a Publication
    When they click Suggestions from ORCID
    Then they see suggestions from ORCID
    And the Start button is enabled

    (NP-388) Scenario: User sees publication for a Publication based on a Link
    Given that the user begins registering with a Link
    And they see that the title metadata for the Link is correct
    When they click Start
    And they click My Publications
    Then they see the Publication is saved and the title is listed and marked as Kladd

    (NP-391) Scenario: User sees publication for a Publication based on uploading a file
    Given User begins registration by uploading a file
    And they see that the thumbnail and filesize is correct
    When they click Start
    And they click My Publications
    Then they see the Publication is saved and the title is listed (filename) and marked as Kladd

    (NP-229) Scenario: User verifies initial metadata for a Publication based on a Link
    Given that the user begins registering with a Link
    And they see that the title metadata for the Link is correct
    When they click Start
    And the Publication metadata registration page loads
    Then they see that the Description tab is populated with metadata values for
      | Title                            |
      | Alternative title(s)             |
      | Abstract                         |
      | Alternative abstract(s)          |
      | Description                      |
      | Publication date                 |
      | NPI-fagfelt                      |
      | Keywords                         |
      | Primary language for publication |
    And they they see that the Reference tab is populated with metadata values for
      | Publication type                              |
      | Link (the link that was provided by the user) |
      | The unmapped text for Journal                 |
      | Volume                                        |
      | Issue                                         |
      | Page from                                     |
      | Page to                                       |
      | Article number                                |
      | Peer-review                                   |
    And they see that the Contributors tab Authors section is populated with metadata values for <Author> and <Institution>
    And they see that the Contributors tab Contributors section is populated with metadata values for <ContributionType>, <Name> and <Institution>
    And they see that the Files and Licenses tab is pre-populated with metadata values for
      | Possible mapped value for License, Archiving policy and Unit agreement |
      | Possible file for upload  (Filename, File size)                        |

    Examples:
      | Author       | Institution |
      | Name Nameson | NTNU        |
      | Jan Jansson  | MTNU        |

    Examples:
      | ContributionType | Name        | Institution |
      | Photographer     | Jim Jimsson | AVH         |

    (NP-230) Scenario: User adds NPI data for a Publication
    Given the user registers initial metadata for a Publication based on a Link
    When they select a value in the drop-down for NPI subject area
    Then this is added to the metadata for the Publication
    And the metadata is listed in the summary

    (NP-231) Scenario: User associates Projects with a Publication
    Given that the user registers initial metadata for a Publication based on a Link
    And the user's project participation is known via their previously registered publications in NVA
    When they click the Projects search box
    And they see a drop-down containing ten active projects in Cristin Projects DB, ranked-by-year, filtered results
      | their previously registered projects in NVA                                                |
      | search results based by free-text search for the projects title in the Cristin Projects DB |
    And they select a Project
    Then the Project ID is added to the Publication metadata
    And the user can add another project

    (NP-233) Scenario: User verifies information for Journal for a Publication based on a Link
    Given that the user registers initial metadata for a Publication based on a Link
    And the Publication is a Publication in Journal
    And the Journal for the Publication is found in Kanalregisteret
    When they verify the information from Kanalregisteret that appears in the Journal Metadata
    Then they see that the information for Journal Title is correct
    And they see that the information for Print ISSN is correct
    And they see that the information for Online ISSN is correct
    And they see that the information for Academic Level is correct

    (NP-234) Scenario: User verifies information for a Publication in Journal Publication data for a publication based on a Link
    Given that the user registers initial metadata for a Publication based on a Link
    And the Publication is a Publication in Journal
    When they verify that the information about the Publication in Journal Publication
    Then they see information for Volume
    And they see information for Issue
    And they see Page Number information
    And they see an Article Number
    # it is implicit that these fields are editable

    (NP-274) Scenario: User sets the value for Publication Type for a Publication in Journal Publication
    Given that the user registers initial metadata for a Publication based on a Link
    And have clicked Next
    And they are on the screen for registering information about the Publication Reference
    When they select a Reference Type from the list
      | Publication in Journal |
    And they select a Publication Subtype from the list
      | Article              |
      | Short communication  |
      | Leader               |
      | Letter to the editor |
      | Review               |
    And they verify a (non-obligatory) DOI from a Publication based on a Link
    And they verify information for Journal for a publication based on a Link
    And they verify (non-obligatory) information for a Publication in Journal Publication data for a publication based on a Link
    And they select a value for Peer-review
    And they view the Summary Page
    Then they see that the information is registered

    (NP-392) Scenario: User sets the value for Publication Type for a Book
    Given that the user registers initial metadata for a Publication based on a Link
    And have clicked Next
    And they are on the screen for registering information about the Publication Reference
    When they select a Reference Type from the list
      | Book |
    And they select a Publication Subtype from the list
      | Monography |
      | Anthology  |
    And they verify information for Publisher for a publication based on a Link
    And they verify (non-obligatory) ISBN
    And they select a value for Peer-review
    And they selet a value for (non-obligatory) Is this a textbook
    And they select a value for (non-obligatory) Total number of pages
    And they select a value for (non-obligatory) the Title of the Series
    And they see the value for NVI
    And they view the Summary Page
    Then they see that the information is registered

    (NP-393) Scenario: User sets the value for Publication Type for a Report
    Given that the user registers initial metadata for a Publication based on a Link
    And have clicked Next
    And they are on the screen for registering information about the Publication Reference
    When they select a Reference Type from the list
      | Report |
    And they select a Publication Subtype from the list
      | Report          |
      | Research report |
      | Policy report   |
      | Working paper   |
    And they verify information for Publisher for a publication based on a Link
    And they verify (non-obligatory) ISBN
    And they select a value for (non-obligatory) Total number of pages
    And they select a value for (non-obligatory) Title of the Series
    And they view the Summary Page
    Then they see that the information is registered

    (NP-394) Scenario: User sets the value for Publication Type for a Degree
    Given that the user registers initial metadata for a Publication based on a Link
    And have clicked Next
    And they are on the screen for registering information about the Publication Reference
    When they select a Reference Type from the list
      | Degree |
    And they select a Publication Subtype from the list
      | Bachelor  |
      | Master    |
      | Doctorate |
    And they verify information for Publisher for a publication based on a Link
    And they select a value for (non-obligatory) Title of the Series
    And they view the Summary Page
    Then they see that the information is registered

    (NP-395) Scenario: User sets the value for Publication Type for a Chapter
    Given that the user registers initial metadata for a Publication based on a Link
    And have clicked Next
    And they are on the screen for registering information about the Publication Reference
    When they select a Reference Type from the list
      | Chapter |
    And they select a value for Book
    And they select a value for Peer-review
    And they select a value for (non-obligatory) pagenumber from and pagenumber to
    And they select a value for (non-obligatory) Title of the Series
    And they view the Summary Page
    Then they see that the information is registered

    # Happy day scenario for a DOI-sourced Academic Publication
    # The DOI dereferences to a data document that contains ORCIDs for every Contributor
    # The DOI dereferences to a data document that contains a Grant ID
    # The Grant ID is available in Cristin Project DB
    # Cristin Project DB data document contains the ORCIDs for project members
    # There is a match between all ORCIDs from the DOI data document and (a subset of) the Cristin Project DB Project data document ORCIDs
    # All of the ORCIDs are in the Authority Register for Personas

    (NP-236) Scenario: User verifies Contributor information
    Given that the user registers initial metadata for a Publication based on a Link
    And they have clicked Next
    When they review the information for Contributors
    Then they see that the Contributors are grouped in sections Authors and Other Contributors
    And they see that the Authors are verified in the Authority Register for Personas
    And they see that the Authors are in the expected order
    And they see that the Authors have the expected institutional affiliations
    And they see that the correct authors have the expected value for Corresponding Author
    And they see that the Other Contributors are listed alphabetically by Surname
    And they see that the Other Contributors have the correct Role, Name and Institution

    (NP-) Scenario: User registers Corresponding Author
    Given that the user registers initial metadata for a Publication based on a Link
    And they have clicked Next
    When they review the information for Contributors
    Then they see that the Contributors are grouped in sections Authors and Other Contributors
    And they set the correctvalues authors have the expected value for Corresponding Author
    And they see that the Other Contributors are listed alphabetically by Surname
    And they see that the Other Contributors have the correct Role, Name and Institution

    # Corresponding Author is not in fact present in the Datacite data, but probably will be soon

    # Important note about the "License": This assumes that the article is published in a journal that has a special Unit
    # agreement, which entails that Unit has negotiated a contract for Norwegian corresponding authors
    # In all other cases, a License-picker is provided

    (NP-275) Scenario: User adds license and files to a Publication
    Given the user processes Contributor information for a Publication in Journal Publication data for a publication based on a Link
    When they click Next
    Then they see the page for Licenses and Files
    And they see information about the Open Access Status for the Journal which they selected on the Reference page based in information from Kanalregisteret
    And they see the Sherpa Romeo data for the Journal which they selected on the Reference page based in information from Kanalregisteret
    And they see that the journal allows publication of the article with the license CCBY 4.0 based in information from Kanalregisteret
    And they upload files for the Publication

    # Kanalregisteret perhaps does not provide all the information we need, this must be viewed as TODO for Kanalregisteret

    (NP-276) Scenario: User uploads files for the Publication
    Given that the user adds license and files to a Publication
    When they drag and drop a file into the File drag-and-drop area
    And they check
      | Accepted version  |
      | Published version |
    And they check Embargo
    And they specify Embargo length
    And they go to the Summary Page
    Then they see that the files are uploaded
    And the data is correct

    (NP-277) Scenario: User views Summary
    Given the user uploads files for the Publication
    When they click Next
    Then they see all of the data they have entered including obligatory fields
      | Title                   |
      | Resource (file or link) |
      | License                 |
    And the Publish button is enabled

    (NP-278) Scenario: User publishes Publication
    Given the user views Summary
    When they click Publish
    Then they see the Public page containing all data and files
    And they see the Publication is Published

    # Access to the different menu items
    (NP-244) Scenario: User sees non-logged-in menu
    Given the user is not logged in (and has no role)
    When they look at any page in NVA
    Then they see an menu containing
      | Logg inn |

    (NP-345) Scenario: User sees a menu when logged in
    Given the user is logged in (and has no NVA-role)
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile |
      | Log Out    |

    (NP-346) Scenario: User sees the menu for Registrator
    Given the user is logged in
    And has the role of Registrator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile       |
      | Log Out          |
      | New Registration |
      | My Publications  |
      | My Messages      |

    (NP-347) User sees the menu for Curator
    Given the user is logged in
    And has the role of Curator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile  |
      | Log Out     |
      | My Worklist |

    (NP-348) Scenario: User sees the menu for Administrator
    Given the user is logged in
    And has the role of Administrator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile         |
      | Log Out            |
      | Useradministration |
      | My Institution     |

    (NP-349) Scenario: User sees the menu for Editor
    Given the user is logged in
    And has the role of Editor
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile    |
      | Log Out       |
      | Editoroppsett |

    (NP-350) Scenario: User sees the menu for Applicationadministrator
    Given the user is logged in
    And has the role of Applicationadministrator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile   |
      | Log Out      |
      | Institutions |

    # Description of each menu item

    # Menu items for anonymous
    (NP-351) Scenario: User opens login page
    Given the user is not logged in
    When they click the menu item Logg inn
    Then the page for login with Feide is opened

    # Menu items for logged in person
    (NP-352) Scenario: User opens the page My Profile
    Given the user is logged in
    When they click the menu item My Profile
    Then the page My Profile is opened
    And see their Profile page which includes information for
      | Real name          |
      | Feide ID           |
      | Email              |
      | ORCID              |
      | Role(s)            |
      | Institution        |
      | Contact info       |
      | Preferred language |

    (NP-383) Scenario: User removes a ORCID connection from My Profile
    Given user opens the page My Profile
    When they click the button to remove a ORCID connection
    Then the user is asked to confirm
    And their ORCID is removed from the Authority Registry

    (NP-353) Scenario: User logs out
    Given the user is logged in
    When they click the menu item Log Out
    Then the user is logged out from Feide
    And the search page is opened
    And the user sees non-logged-in menu

  # Menuitems for Registrator
  Slå sammen: Dette er (NP-226)
  Scenario: User opens New Registration
    Given the user is logged in as Registrator
    When they click the menu item New Registration
    Then the page New Registration is opened
    And the user see tabs
      | Start med å laste opp fil          |
      | Start med en lenke til publikasjon |
      | Start med forslag fra din ORCID    |

    (NP-354) Scenario: User opens My Publications
    Given the user is logged in as Registrator
    When they click the menu item Mine Registreringer
    Then the page Mine Registreringer is opened
    And a list of all unpublished registrations with the fields
      | Title    |
      | <Status> |
      | Created  |
    Examples:
      | Status   |
      | Draft    |
      | Rejected |
    And each list item has a button Delete and Edit that is enabled

    # Actions from Page : My Publications (Edit)
    (NP-355) Scenario: User opens an item in the My Publication list
    Given the user is logged in as Registrator
    And has opened the page My Publications
    When they click Edit on an item
    Then the item is opened in the wizard
    And the user sees the Description tab
    And the fields in the wizard are populated with values from the saved publication

    # Actions from Page : My Publications (Delete)
    (NP-356) Scenario: User opens an item in the My Publications list
    Given the user is logged in as
    And has opened the page My Publications
    When they click Slett on an item
    Then a comfirmation pop-up is opened
    When the user selects Yes the publication is marked as Deleted
    When the user selects No the pop-up is closed

    # Menuitems for Curator
    (NP-357) Scenario: User opens Min Arbeidsliste
    Given the user is logged in as Curator
    When they click the menu item Min Arbeidsliste
    Then the page Min Arbeidsliste is opened
    And the user see the lists
      | For Approval |
      | Support      |
      | DOI-request  |
    And the lists have fields
      | Title     |
      | Submitter |
      | Date      |
    And a button Åpne that is enabled

    # Actions from Page : Min Arbeidsliste
    (NP-358) Scenario: User opens an item in the For Approval or DOI-request list
    Given the user is logged in as Curator
    And has opened the page Min Arbeidsliste
    And they select a <Tab>
    When they click Åpne on an item
    Then the item is opened in the wizard
    And the user sees the Innsending tab
    And <Button> is enabled

    Examples:
      | Tab          | Button     |
      | For Approval | Publish    |
      | DOI request  | Create DOI |

    # Menuitems for Administrator
    (NP-359) Scenario: The user opens Useradministration
    Given the user is logged in as Administrator
    When they click the menu item Useradministration
    Then the page Useradministration is opened
    And the user sees a list of all users connected to their institution
    And the users are grouped by NVA-roles
    And has the fields
      | ID      |
      | Name    |
      | Created |
    And a button Fjern that is enabled for each user
    And a link to add a user with a specific role

    (NP-360) Scenario: The user opens Min Institution
    Given the user is logged in as Administrator
    When they click the menu item Min Institution
    Then are on the page Min Institution

    (NP-361) Scenario: The Admin user creates an Institution
    Given the admin user has opened Min Institution
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

    (NP-362) Scenario: Admin user views the institutional portal
    Given the admin user has created an Organization
    When they click the link to the institutional portal on the Organization page
    Then they see the web address in their web browser is the CName + nva.unit.no
    And the page has the same title as they entered in the Organization page

    # Actions from page : Useradministration
    (NP-363) Scenario: Administrator adds a role to a user
    Given the user is logged in as Administrator
    When they click the link Ny <role> in the page Useradministration
    Then the page adds a line with the fields
      | ID   |
      | Name |
    And a button Legg til that is enabled
    Examples:
      | Role                     |
      | Administrator            |
      | Curator                  |
      | Editor                   |
      | Registrator              |
      | Applicationadministrator |
      | User                     |

    # Menuitems for Editor
    (NP-364) Scenario: The user opens Editoroppsett
    Given the user is logged in as Editor
    When they click the menu item Editoroppsett
    Then the page Editoroppsett is opened
    And has the fields
      | Email |
    And a button Lagre that is enabled

    # Menuitems for Applikasjonsadmin
    (NP-365) Scenario: The user opens Institutions
    Given the user is logged in as Applikasjonsadmin
    When they click the menu item Institutions
    Then the page Institutions is opened
    And the user see a liste of all institution (customers)
    And has the fields
      | Institution |
      | Created     |
      | Editor      |
    And a button Open that is enabled for each institution
    And a button Create Institution that is enabled

    # Actions from page : Institution (Add/Update)
    (NP-366) Scenario: Applikasjonsadmin changes a new institution
    Given the user is logged in as Applikasjonsadmin
    When they click the link Create Institution or Open in the page Institutions
    Then the page Institution is opened with the fields
      | Navn i organisasjonsregisteret  |
      | Visningsnavn på institusjonen   |
      | Forkortet navn på institusjonen |
      | Arkivnavn                       |
      | CNAME                           |
      | Administrator ID                |
      | Feide Organisasjons ID          |
    And a button Add that is enabled
