# encoding: utf-8
# language: en

Feature: MVP features for NVA

  @351
  Scenario: A user logs in with Feide for the first time
    Given that the user is on the Start page
    When they click Log in
    And they are redirected to Feide
    And they enter their valid Feide credentials
    And they approve sharing of data with the NVA application regarding
      | Username            |
      | Email address       |
      | Real name           |
      | Affiliation         |
      | Organization number |
    Then they are redirected back to the Start page
    And they see their name in the Menu
    And they see the Connect Author dialog

  Scenario: A user logs in with Feide not for the first time
    Given that the user is on the Start page
    When they click Log in
    And they are redirected to Feide
    And they enter their valid Feide credentials
    Then they are redirected back to the Start page
    And they see their name in the Menu
    And they see the Connect ORCID dialog

  Scenario: A user is already authenticated with Feide (single sign on)
    Given that the user is already authenticated with Feide
    When they navigate to the Start page
    And they click Log in
    And they are redirected to Feide
    And they click on the identity they wish to proceed with in the Feide interface
    Then they are redirected back to the Start page
    And they see their name in the Menu

  Scenario: A user logs out
    Given that the user is already logged in
    When they click on the Menu
    And they click Log out
    Then they are logged out of the NVA application

  @217
  Scenario Outline: User with no Feide ID in ARP sees matching Author identities
    Given that Kim Smith has a valid Feide ID and password
    And they do not have a Feide ID in their ARP entry
    And there are entries in ARP
      | Smith, Kim (died 2019) |
      | Smith, Kim F.          |
      | Smith, Kim             |
    When they log in
    Then they see a list containing <Author name> and <Last publication> for each ARP entry matching their <Name>
    Examples:
      | Name      | Author name   | Last publication  |
      | Kim Smith | Smith, Kim    | Some Title        |
      | Kim Smith | Smith, Kim    | Some Other Title  |
      | Kim Smith | Smith, Kim F. | Yet Another Title |


  Scenario: User has no matching Author identity
    Given that Sandy Jones has a valid Feide ID and password
    And they do not have a Feide ID in their ARP entry
    And there are no matching entries in ARP
    When they log in
    Then they see the Create Authority dialog
    And that their name is selected

  @219
  Scenario: User updates an Author identity
    Given that a user with no Feide ID in ARP sees matching Author identities
    When they select an Author identity
    And they click Connect Author identity
    Then their Feide ID is added to their Author identity
    And their Feide organization number is mapped to an Organizational ID (Cristin ID)
    And their Organizational ID (Cristin ID) is added to their Author identity
    And they see a notification that confirms the connection
    And they are redirected to the ORCID dialog
  # This last step hides cases where an ORCID already exists in ARP
  # There should also be a possibility to ask for support if there is a problem in the data, i.e. there are multiple registered Author identities for a single Author

  @384
  Scenario: User creates an Author identity
    Given that a user has no matching Author identity
    When they click Create Author identity
    Then their identity is added to ARP
    And their Feide ID is added to their Author identity
    And their Feide organization number is mapped to an Organizational ID (Cristin ID)
    And their Organizational ID (Cristin ID) is added to their Author identity
    And they are redirected to the ORCID dialog

  @222
  Scenario: User attempts to add an ORCID to their Author identity
    Given that the user:
      | User updates an Author identity |
      | User creates an Author identity |
    When they click Add ORCID
    And they are redirected to ORCID for login
    And they log into ORCID
    And they accept that NVA uses their data
    Then they are redirected back to NVA
    And their ORCID is added to their Author identity
    And they see their ORCID on their Profile page

  @226
  Scenario: User begins registering a Publication
    Given that the user is logged in
    And they are on the Start page
    When they click Register new publication
    Then they are redirected to the Register new publication page
    And they see an Expansion panel for Upload file
    And they see an Expansion panel for Link to publication
    And they see an Expansion panel for Suggestions from ORCID

  @228
  Scenario: User begins registering with a Link with direct data from Datacite/Crossref
    Given that the user begins registering a Publication
    When they expand Link to publication
    And enter a DOI or a fully qualified DOI URL
    And click Search
    Then they see metadata about the Link in the Expansion panel

  @439
  Scenario: User begins registering with a Link with data from Datacite/Crossref from citation_doi meta tag (DOI)
    Given that the user begins registering a Publication
    When they expand Link to publication
    And they enter https://dlr.unit.no/resources/66888570-3504-4d12-81a4-c3ffe0605945
    And click Search
    Then they see metadata about the Link in the Expansion panel

  #DLR does not have a meta tag with a DOI

  @440
  Scenario: User begins registering with a Link with data from Datacite/Crossref from dc:identifier meta tag
    Given that the user begins registering a Publication
    When they expand Link to publication
    And they enter https://loar.kb.dk/handle/1902/1674?show=full
    And click Search
    Then they see metadata about the Link in the Expansion panel

  @441
  Scenario: User begins registering with a Link with data from DC and DCTERMS meta tags
    Given that the user begins registering a Publication
    When they expand Link to publication
    And they enter a https://ntnuopen.ntnu.no/ntnu-xmlui/handle/11250/2638973
    And click Search
    Then they see metadata about the Link in the Expansion panel

  @442
  Scenario: User begins registering with a Link with data from Open Graph tag
    Given that the user begins registering a Publication
    When they expand Link to publication
    And they enter https://www.nrk.no/norge/klimakur-2030_-mer-strom-og-mindre-kjott-kan-fa-norge-i-mal-1.14883788
    And click Search
    Then they see metadata about the Link in the Expansion panel

  @443
  Scenario Outline: User begins registering a Publication
    Given that the user begins registering a Publication
    And they have selected one of the <Methods> for starting the Wizard
    When they click Start
    Then the Wizard is started
    Examples:
      | Methods                |
      | Link to publication    |
      | Upload file            |
      | Suggestions from ORCID |

  @452
  Scenario: User begins Wizard registration and navigates to Description tab
    Given that the user begins registering a Publication
    When they navigate to the Description tab
    Then they see the tab Description is selected
    And they see mandatory fields for
      | Title |
    And optional fields for
      | Alternative title(s)         |
      | Abstract                     |
      | Alternative abstract(s)      |
      | Description                  |
      | Date published               |
      | NPI disciplines              |
      | Keywords                     |
      | Primary language for content |
      | Project association          |
    And they see the tab Reference is clickable
    And they see the tab Contributor is clickable
    And they see the tab Files and Licenses is clickable
    And they see the tab Submission is clickable
    And they see Next is enabled
    And they see Save is enabled

  @453
  Scenario: User navigates to the Reference tab
    Given that the user begins registering a Publication
    When they navigate to the Reference tab
    Then they see the mandatory field for Type
    And they see the tab Description is clickable
    And they see the tab Reference is selected
    And they see the tab Contributor is clickable
    And they see the tab Files and Licenses is clickable
    And they see the tab Submission is clickable
    And they see Next is enabled
    And they see Save is enabled

  @274
  Scenario: User navigates to the Reference tab and selects Publication in Journal
    Given that the user begins registering a Publication
    When they navigate to the Reference tab
    And they select a Reference Type — Publication in Journal
    And they can select a Publication Subtype from the list
      | Article              |
      | Short communication  |
      | Leader               |
      | Letter to the editor |
      | Review               |
    Then they see the Search box for "Journal title" #this needs to be tested for mandatory-ness
    And they see fields for
      | DOI            |
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |
    And they see a preselected value for Peer review "Not peer reviewed" #also mandatory
    And they see the NVI evaluation is Not NVI Applicable

  @392
  Scenario: User navigates to the Reference tab and selects Book
    Given that the user begins registering a Publication
    When they navigate to the Reference tab
    And they select a Reference Type — Book
    And they select a Publication Subtype from the list
      | Monograph |
      | Anthology |
    Then they see Search box for "Publisher name" #this needs to be tested for mandatory-ness
    And they see a checkbox for "Is this a textbook?"
    And they see fields for
      | ISBN                  |
      | Total number of pages |
    And they see Search box for "Title of the Series"
    And they see a preselected value for Peer review "Not peer reviewed" #also mandatory
    And they see the NVI evaluation is Not NVI Applicable

  @393
  Scenario: User navigates to the Reference tab and selects Report
    Given that the user begins registering a Publication
    When they navigate to the Reference tab
    And they select a Reference Type — Report
    And they select a Publication Subtype from the list
      | Report          |
      | Research report |
      | Policy report   |
      | Working paper   |
    Then they see Search box for "Publisher name"
    And they see fields for
      | ISBN                  |
      | Total number of pages |
    And they see Search box for "Title of the Series"

  @394
  Scenario: User navigates to the Reference tab and selects Degree
    Given that the user begins registering a Publication
    When they navigate to the Reference tab
    And they select a Reference Type — Degree
    And they select a Publication Subtype from the list
      | Bachelor  |
      | Master    |
      | Doctorate |
    Then they see Search box for "Publisher name"
    And they see Search box for "Title of the Series"

  @395
  Scenario: User navigates to the Reference tab and selects Chapter
    Given that the user begins registering a Publication
    When they navigate to the Reference tab
    And they select a Reference Type — Chapter
    Then they see an Information box with text "Before you register the chapter, register the book so you can look it up"
    And they see field "Link to publication"
    And they see Search box for "Published in"
    And they see a preselected value for Peer review "Not peer reviewed" #also mandatory
    And they see field for Page number from
    And they see field for Page number to
    And they see Search box "Series title"
    And they see the NVI evaluation is Not NVI Applicable

  @417
  Scenario: User navigates to the Contributor tab
    Given that the user begins registering a Publication
    When they navigate to the Contributor tab
    Then they see Add Author is enabled
    And they see the tab Description is clickable
    And they see the tab Reference is clickable
    And they see the tab Contributor is selected
    And they see the tab Files and Licenses is clickable
    And they see the tab Submission is clickable
    And they see Next is enabled
    And they see Save is enabled

  @275
  Scenario: User navigates to the Files and Licenses tab
    Given that the user begins registering a Publication
    When they navigate to the Files and Licenses tab
    Then they see the Publication Channel Information box
    And they see the File upload widget

  #    Then they see information about the Open Access Status for the Journal which they selected on the Reference page based in information from the Publication Channel Register
  #    And they see the Sherpa Romeo data for the Journal which they selected on the Reference page based in information from the Publication Channel Register
  #    And they see that the journal allows publication of the article with the license CCBY 4.0 based in information from the Publication Channel Register
  #    And they can upload files for the Publication
  #    And they see the tab Description is clickable
  #    And they see the tab Reference is clickable
  #    And they see the tab Contributor is clickable
  #    And they see the tab Files and Licenses is selected
  #    And they see the tab Submission is clickable
  #    And they see Next is enabled
  #    And they see Save is enabled

  @277
  Scenario: User navigates to the Submission tab
    Given that the user begins registering a Publication
    When they navigate to the Submission tab
    Then they see all of the data they have entered including
      | Title                   |
      | Resource (file or link) |
      | License                 |
    And they see the tab Description is clickable
    And they see the tab Reference is clickable
    And they see the tab Contributor is clickable
    And they see the tab Files and Licenses is clickable
    And they see the tab Submission is selected
    And they see Save is enabled
    And they see Publish is enabled

  @385
  Scenario: User begins registration by uploading a file
    Given that the user begins registering a Publication
    When they click Upload file
    And they upload a file
    Then they see the file name
    And they see the file size
    And they see the file checksum
    And they see Delete file is enabled
    And they see Start is enabled

  #Scenario: User start Wizard registration by uploading a file
  #  Given that the user begins registration by uploading a file
  #  When they click Start
  #  Then they see the tab Description

  @386
  Scenario: User begins registration by using suggestions from ORCID
    Given that the user begins registering a Publication
    When they click Suggestions from ORCID
    Then they see a list of last publications from ORCID API associated with the user's ORCID
    And they see the list contains up to ten entries
    And they see the list is ordered by publication date, descending
    And they see each list entry contains metadata for:
      | Title         |
      | Year          |
      | Journal title |
      | DOI           |
    And they see that the radio for the first entry is selected
    And they see Start is enabled

  #Scenario: User start Wizard registration by using suggestions from ORCID
  #  Given that the user begins registration by using suggestions from ORCID
  #  When they click Start
  #  Then they see the tab Description

  @388
  Scenario: User sees a Publication based on a Link is saved
    Given that the user begins registering with a Link
    When they click Start
    And they click My Publications
    Then they see the Publication is saved and the title is listed and marked as Draft

  @391
  Scenario: User sees Publication based on file upload is saved
    Given that the user begins registration by uploading a file
    When they click Start
    And they click My Publications
    Then they see the Publication is saved and the title is listed (filename) and marked as Draft
    And they see that Edit is enabled
    And they see that Delete is enabled


  @432
  Scenario: User verifies file upload for a registration based on uploading a file
    Given that the user opens an item in the My Publication list
    When they select the tab Files and Licenses
    Then the user sees upload information

  @454
  Scenario: User sees upload information
    Given the user is on the Files and Licenses tab
    When they view the page
    Then they see the File Detail box contains information about:
      | File name |
      | File size |
      | Checksum  |
    And they see the File Detail box has a checkbox for Administrative agreement
    And they see the File Detail box has a radio for Version with values:
      | Accepted version  |
      | Published version |
    And they see the File Detail box has a date picker for embargo
    And they see the File Detail box has a drop down for Licenses
    And the Download button in the File Detail box is enabled
    And the Delete button in the File Detail box is enabled

  # Dette er av typen "Publication in Journal"
  Scenario: User verifies initial metadata on the Reference tab for a registration
    Given that the user begins registration with a Link to a Journal Article
    When they click Start
    And they click the Reference Tab
    Then they they see that the Reference tab is populated with metadata values for
      | Publication type                              |
      | Link (the link that was provided by the user) |
      | The unmapped text for Journal                 |
      | Volume                                        |
      | Issue                                         |
      | Page from                                     |
      | Page to                                       |
      | Article number                                |
      | Peer review                                   |

  Scenario: User verifies initial metadata on the Contributors tab for a registration
    Given that the user begins Wizard registration with a Link
    When they click the Contributors tab
    Then they see that the Authors section contains Author Information boxes containing:
      | Author name |
      | Affiliation |
    And they see that each Author information box contains a checkbox for Corresponding Author
    And they see that each Author information box contains a Search box to Add Affiliation
    And they see that each Author information box contains a Delete Author button
    And they see that each Author information box contains a field containing an integer for Sequence in the list
    And they see that each Author information box contains a symbol to show whether it is a verified profile or not
    And they see that each Author information box can be dragged and dropped to change their order in the list

  @NotMVP
  Scenario: User verifies initial metadata on the Files and Licenses tab for a registration
    Given that the user begins Wizard registration with a Link
    When they click the Files and Licenses tab
    Then they see that the Files and Licenses tab is prepopulated with metadata values for
      | Possible mapped value for License, Archiving policy and Unit agreement |
      | Possible file for upload  (Filename, File size)                        |

  @230
  Scenario: User adds NPI data for a Publication
    Given that the user begins registering a Publication
    And they click the Description tab
    When they select a value in the dropdown for NPI subject area
    And they click the Submission tab
    Then they see the NPI subject area is listed

  @231
  Scenario: User views Autosearch dropdown for Project
    Given that the user begins registering a Publication
    And they click the Description tab
    When they click the Projects search box
    Then they see a Autosearch dropdown with an empty search field
    And a pre-filled selectable list of results featuring the ten most recent active projects in NVA associated with their User

  @444
  Scenario: User selects prepopulated Project from Autosearch dropdown for Project
    Given that the user views Autosearch dropdown for Project
    When they click a project in the dropdown
    Then they see the project details in a new Project Information box
    And they see the Project Information box contains information about:
      | Project title |
      | Grant ID      |
      | Financed by   |
    And they see that Project Information box Delete button is enabled
    And they see a Autosearch dropdown for Project above the Project Information box

  @445
  Scenario: User searches for a Project in the Autosearch dropdown for Project
    Given that the user views Autosearch dropdown for Project
    When they enter a project name in the search box
    Then they see a list of clickable results

  @446
  Scenario: User selects Project from Autosearch dropdown for Project
    Given that the user searches for a Project in the Autosearch dropdown for Project
    When they click a project in the Autosearch dropdown for Project
    Then they see the project details in a new Project Information box
    And they see the Project Information box contains information about:
      | Project title |
      | Grant ID      |
      | Financed by   |
    And they see that Project Information box Delete button is enabled
    And they see a Autosearch dropdown for Project above the Project Information box

  @233
  Scenario: User sees journal title suggestion from a Link
    Given that the user registers initial metadata for a Publication based on a Link
    And the Publication is a Publication in Journal
    And the Journal for the Publication is in the Publication Channel Register
    When they click the Reference Tab
    Then they see the Autosearch dropdown for Journal contains a journal title

  Scenario: User sees Publication Channel Register information for a Journal
    Given that the user sees journal title suggestion from a Link
    When they click the Autosearch dropdown for Journal
    And they click a result
    Then they see a Information box for Journal
    And they see that the Information box for Journal contains a Title
    And they see that the Information box for Journal contains an Academic level
    And they see that the Information box for Journal contains a Delete button

  # Happy day scenario for a DOI-sourced Academic Publication
  # The DOI dereferences to a data document that contains ORCIDs for every Contributor
  # The DOI dereferences to a data document that contains a Grant ID
  # The Grant ID is available in Cristin Project DB
  # Cristin Project DB data document contains the ORCIDs for project members
  # There is a match between all ORCIDs from the DOI data document and (a subset of) the Cristin Project DB Project data document ORCIDs
  # All of the ORCIDs are in ARP

  @418
  Scenario: User opens the Add Author dialog
    Given that the user navigates to Contributor tab
    When they click Add Author
    Then the Add Author dialog is opened
    And they see Author search
    And they can cancel the dialog

  Scenario: User views Author search results
    Given that the user opens the Add Author dialog
    And there are matching results for Name Nameson in ARP
    When they enter Name Nameson in the Author search
    Then they see search results for the Author search
    And they see each Author result contains:
      | Author name                   |
      | the Author's last publication |
      | Affiliation(s)                |

  @419
  Scenario: User adds an Author to the Author list
    Given the user views Author search results
    When they click an Author
    And they click Add Author
    Then the dialog is closed
    And the Author is shown in the Authors section in the Contributor tab

  @DeveloperPretendsToBeProductOwner
  Scenario: User finds no matching Author in Author Search
    Given that the user opens the Add Author dialog
    And there are no matching results for Name Nameson in ARP
    When they enter Name Nameson in the Author search
    Then they see no matching results
    And they see the Create New Author button

  @DeveloperPretendsToBeProductOwner
  Scenario: User views New Author in the Author dialog
    Given that the user finds no matching Author in Author Search
    When they click Create New Author
    Then they see a field for Author name
    And they see an Autosearch box for Affiliation

  @DeveloperPretendsToBeProductOwner
  Scenario: User creates a new Author in the Author dialog
    Given that the user views New Author in the Author dialog
    When they fill in field for Author name
    And they search and select an affiliation
    And they click Add
    Then they see that the Add Author dialog is closed
    And they see the new Author in the Author section of the Contributors tab

  #Legg til Scenario for delete, edit, move, korresponding

  @
  Scenario: User views Corresponding Author Email field
    Given that the user registers initial metadata for a Publication based on a Link
    And they are on the Contributors tab
    When they click Corresponding Author checkbox on an Author
    Then they see an input field for Email

  Scenario: User registers Corresponding Author
    Given that the user views Corresponding Author Email field
    When they enter a valid Email address
    And they blur out of the Corresponding Author Email field
    And they click the Summary tab
    Then they see that the Author is registered as the Corresponding Author for the publication

  # Corresponding Author is not in fact present in the Datacite data, but probably will be soon

  # Important note about the "License": This assumes that the article is published in a journal that has a special Unit
  # agreement, which entails that Unit has negotiated a contract for Norwegian corresponding authors
  # In all other cases, a License-picker is provided

  @276
  Scenario: User uploads files for a Publication
    Given that the user navigates to Files and Licenses
    When they drag and drop a file into the File drag-and-drop area
    Then the user sees upload information

  Scenario Outline: User select values for uploaded files
    Given that the user uploads files for a Publication
    When they set values for <Field>
    And they navigate to the Submission tab
    And they look at the Files section
    Then they see the <Value> for the <Field>
    Examples:
      | Field   | Value            |
      | Version | Accepted version |
      | License | CC-BY 4.0        |
      | Embargo | 2032-12-21       |

  @455
  Scenario: User selects Administrative contract for uploaded files
    Given that the user uploads files for the Publication
    When the user selects Administrative contract
    Then they see the original filename
    And they see the filesize
    And they see the checksum for the uploaded file
    And they see a message stating that the file is Adminsitrative and has no License and has restricted viewing rights
    And a Delete button

  @278
  Scenario: User publishes Publication
    Given that the user sees Publication Channel Register information for a Journal
    And they select values for uploaded files
    And they are on the Submission tab
    When they click Publish
    Then they are redirected to the Publication public page
    And they see the Publication confirmation message

  # Access to the different menu items
  @244
  Scenario: User sees non-logged-in menu
    Given that the user is not logged in
    When they look at any page in NVA
    Then they see the Log in button

  @345
  Scenario: User sees a menu when logged in
    Given that the user is logged in
    And has no NVA role
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile |
      | Log Out    |

  @346
  Scenario: User sees the menu for Creator
    Given that the user is logged in
    And has the role of Creator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile       |
      | New Registration |
      | My Publications  |
      | My Messages      |
      | Log Out          |

  @347
  Scenario: User sees the menu for Curator
    Given that the user is logged in
    And has the role of Curator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile  |
      | My Worklist |
      | Log Out     |

  @348
  Scenario: User sees the menu for Administrator
    Given that the user is logged in
    And has the role of Administrator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile          |
      | User administration |
      | My Institution      |
      | Log Out             |

  @349
  Scenario: User sees the menu for Editor
    Given that the user is logged in
    And has the role of Editor
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile            |
      | Editor administration |
      | Log Out               |

  @350
  Scenario: User sees the menu for Application administrator
    Given that the user is logged in
    And has the role of Application administrator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile   |
      | Institutions |
      | Log Out      |

  # Menu items for logged in person
  @352
  Scenario: User opens the page My Profile
    Given that the user is logged in
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

  @410
  Scenario: User opens Add Institution from My Profile
    Given user opens the page My Profile
    When they click Add Institution
    Then the Add Institution dialog is opened
    And they see the Autosearch box for Institutions

  @411
  Scenario: User Adds an Institution from My Profile
    Given the user opens Add Institution from My Profile
    When they enter an Institution name
    And they select an Institution
    And they click Save
    Then the Add Institution dialog is closed
    And the user sees the new Institution in My Profile

  @406
  Scenario: User views a Subunit from My Profile
    Given the user opens Add Institution from My Profile
    When they enter an Institution name
    And they select an Institution
    Then they see Subunit dropdown containing all the subunits at their Institution

  @407
  Scenario: User selects a Subunit from My Profile
    Given user views a subunit from My Profile
    When they select a subunit from the Subunit dropdown
    And they click Save
    Then the Add Institution dialog is closed
    And the user sees the new Institution and subunit in My Profile

  @409
  Scenario: User views a Subsubunit from My Profile
    Given the user views a Subunit from My Profile
    When they click the Subunit dropdown
    Then they see a Subsubunit dropdown containing all the Subsubunits at their Subunit

  Scenario: User selects a Subsubunit from My Profile
    Given user views a Subsubunit from My Profile
    When they select a Subsubunit from the Subsubunit dropdown
    And they click Save
    Then the Add Institution dialog is closed
    And the user sees the new Institution and Subunit and Subsubunit in My Profile

  Scenario: User views a Subsubsubunit from My Profile
    Given the user views a Subsubunit from My Profile
    And they select a Subsubunit from the Subsubunit dropdown
    When they click the Subsubsubunit dropdown
    Then they see a Subsubsubunit dropdown containing all the Subsubsubunits at their Subsubunit

  Scenario: User selects a Subsubsubunit from My Profile
    Given user views a Subsubsubunit from My Profile
    When they select a Subsubsubunit from the Subsubsubunit dropdown
    And they click Save
    Then the Add Institution dialog is closed
    And the user sees the new Institution and Subunit and Subsubunit and Subsubsubunit in My Profile

  @383
  Scenario: User removes an ORCID connection from My Profile
    Given user opens the page My Profile
    When they click Remove ORCID
    Then they are asked to confirm
    And their ORCID is removed from ARP

  @353
  Scenario: User logs out
    Given that the user is logged in
    When they click the menu item Log Out
    Then the user is logged out from Feide
    And the search page is opened
    And the user sees non-logged-in menu

  # Menuitems for Creator
  Scenario: User opens New Registration
    Given that the user is logged in as Creator
    When they click the menu item New Registration
    Then the page New Registration is opened
    And the user sees options
      | Start med å laste opp fil          |
      | Start med en lenke til publikasjon |
      | Start med forslag fra din ORCID    |

  @354
  Scenario Outline: User opens My Publications
    Given that the user is logged in as Creator
    When they click the menu item My Publications
    Then the page My Publications is opened
    And a list of all unpublished registrations with the fields
      | Title    |
      | <Status> |
      | Created  |
    And each list item has a button Delete and Edit that is enabled

    Examples:
      | Status   |
      | Draft    |
      | Rejected |

  # Actions from Page : My Publications (Edit)
  @355
  Scenario: User opens an item in the My Publication list
    Given that the user is logged in as Creator
    And has opened the page My Publications
    When they click Edit on an item
    Then the item is opened in the Wizard
    And the user sees the Description tab
    And they see populated fields:
      | Title                        |
      | Alternative title(s)         |
      | Abstract                     |
      | Alternative abstract(s)      |
      | Description                  |
      | Date published               |
      | Primary language for content |

  # Actions from Page : My Publications (Delete)
  @356
  Scenario: User delete an item in the My Publications list
    Given that the user is logged in as Creator
    And has opened the page My Publications
    When they click Delete on an item
    Then a comfirmation pop-up is opened
    When the user selects Yes the publication is marked as Deleted
    When the user selects No the pop-up is closed

  @421
  Scenario: User opens their Public Profile from My Publications Page
    Given that the user is logged in as Creator
    And has opened the page My Publications
    When they click to go to their public profile
    Then their public profile page is open
    And the page fields for
      | Name                                       |
      | Institutions                               |
      | Public email                               |
      | ORCID                                      |
      | List of publications with status Published |

  # Menuitems for Curator
  @357
  Scenario: User opens My Worklist
    Given that the user is logged in as Curator
    When they click the menu item My Worklist
    Then the page My Worklist is opened
    And the user see the lists
      | For Approval |
      | Support      |
      | DOI request  |
    And the lists have fields
      | Title     |
      | Submitter |
      | Date      |
    And a button Open that is enabled

  # Actions from Page : My Worklist
  @358
  Scenario Outline: User opens an item in the For Approval or DOI request list
    Given that the user is logged in as Curator
    And has opened the page My Worklist
    And they select a <Tab>
    When they click Open on an item
    Then the item is opened in the Wizard
    And the user sees the Submission tab
    And <Button> is enabled

    Examples:
      | Tab          | Button     |
      | For Approval | Publish    |
      | For Approval | Reject     |
      | DOI request  | Create DOI |

  # Menuitems for Administrator
  @359
  Scenario: The user opens User administration
    Given that the user is logged in as Administrator
    When they click the menu item User administration
    Then the page User administration is opened
    And the user sees a list of all users connected to their institution
    And the users are grouped by NVA roles
    And has the fields
      | Autentication ID |
      | Name             |
      | ORCID            |
      | Last login       |
      | Created          |
    And a button Remove that is enabled for each user
    And a Button to add a user with a specific role

  @360
  Scenario: The user opens My Institution
    Given that the user is logged in as Administrator
    When they click the menu item My Institution
    Then are on the page My Institution

  @361
  Scenario: The Administrator edits an Institution
    Given the Administrator has opened My Institution
    When they edit the fields
      | Name in organization registry |
      | Display name                  |
      | Short displayname             |
      | CNAME                         |
      | Intitution DNS                |
    And select Pubications must be approved by Curator
    And upload a new logo
    Then they see a message telling them that the information was saved
    And they can visit the institutional portal

  @362
  Scenario: Administrator views the institutional portal
    Given the Administrator edits an Institution
    When they visit the institutional portal from My Institution
    Then they see the web address in their web browser is the CName + .nva.unit.no
    And the page title is the same as the Display Name that they entered on My Institution

  # Actions from page : Useradministration
  @363
  Scenario Outline: Administrator adds a role to a user
    Given that the user is logged in as Administrator
    And they are on the User Administration Page
    When they click Add User under the <Section>
    Then the page adds a line with the fields
      | ID   |
      | Name |
    And a button Add that is enabled
    Examples:
      | Section       |
      | Administrator |
      | Curator       |
      | Editor        |

  # Menuitems for Editor
  @364
  Scenario: The user opens Editor administration
    Given that the user is logged in as Editor
    When they click the menu item Editor administration
    Then the page Editor administration is opened
    And has the fields
      | Email |
    And a button Save that is enabled

  # Menuitems for Application adminstrator
  @365
  Scenario: The Application adminstrator opens Institutions
    Given that the user is logged in as Application adminstrator
    When they click the menu item Institutions
    Then the page Institutions is opened
    And the user sees a table of all institutions (customers)
    And the table contains the fields
      | Institution |
      | Created     |
      | Editor      |
    And a button Open that is enabled for each institution
    And a button Create Institution that is enabled

  # Actions from page : Institution (Add/Update)
  @366
  Scenario Outline: Application adminstrator changes / adds an institution
    Given that the user is logged in as Application adminstrator
    When they click <Button> in the page Institutions
    Then the page Institution is opened with the fields
      | Name in organization registry |
      | Display name                  |
      | Short displayname             |
      | CNAME                         |
      | Intitution DNS                |
      | Administration ID             |
      | Feide Organization ID         |
    And a button Add that is enabled
    Examples:
      | Button |
      | Add    |
      | Save   |
