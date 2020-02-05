  # encoding: utf-8
  # language: en

  @217
  Scenario: User with no Feide ID in ARP sees matching Author identities
    Given that a user has a valid Feide ID and password
    And they do not have a Feide ID in their ARP entry
    When they log in
    Then they see a list containing <Author name> and <Last publication> for each ARP entry matching their <Name>
      Examples:
        | Name | Author name | Last publication |
        | Kim Smith | Smith, Kim | Some Title |

  @219
  Scenario: User updates an Author identity
    Given that a user with no Feide ID in ARP sees matching Author identities
    When they select an Author identity
    And they click Connect Author ID
    Then the user's Feide ID is added to the Author identity
    And the user's Feide organisation number is mapped to an Organisational ID (Cristin ID)
    And the user's Organisational ID (Cristin ID) is added to the Author identity
    And the Next button is enabled
  # There should also be a possibility to ask for support if there is a problem in the data, i.e. there are multiple registered Author identities for a single Author

  @384
  Scenario: User creates an Author identity
    Given that a user has no matching Author identity
    And they see that their name is selected
    When they click Create Author identity
    Then the user's identity is added to ARP
    And the user's Feide ID is added to the Author identity
    And the user's Feide organisation number is mapped to an Organisational ID (Cristin ID)
    And the user's Organisational ID (Cristin ID) is added to the Author identity
    And the Next button is enabled

  @221
  Scenario: User has no ORCID associated with their Author identity
    Given that the user has updated an Author identity
    When they click the Next button
    Then they are asked if they want to add or create an ORCID

  @222
  Scenario: User attempts to add an ORCID to their Author identity
    Given that the user has no ORCID associated with their Author identity
    When they click Add ORCID
    And the user is redirected to ORCID for login
    And they log into ORCID
    And they accept that NVA uses their data
    Then they are redirected back to NVA
    And their ORCID is added to their Author identity
    And they see their ORCID on their Profile page

  @226
  Scenario: User begins registering a Publication
    Given that the user is logged in
    And they are on the Start Page
    When they click Register new publication
    Then they are redirected to the Register new publication page

  @443
  Scenario: User starts registering a Publication
    Given that the user begins registering a Publication
    And they have selected one of the methods for starting the Wizard
    When they click Start
    Then the Wizard is started

  @228
  Scenario: User begins registering with a Link with direct data from Datacite/Crossref
    Given that the user begins registering a Publication
    When they click Link to publication
    And enter a <Link>
    And click Search
    Then they see metadata about the Link
    Examples:
      | Link                              |
      | https://doi.org/10.18711/yjieaump |

  @439
  Scenario: User begins registering with a Link with data from Datacite/Crossref from citation_doi meta tag (DOI)
    Given that the user begins registering a Publication
    When they click Link to publication
    And enter a <Link>
    And click Search
    Then they see metadata about the Link
    Examples:
      | Link                                                               |
      | https://dlr.unit.no/resources/66888570-3504-4d12-81a4-c3ffe0605945 |
      | https://loar.kb.dk/handle/1902/1674?show=full                      |

  @440
  Scenario: User begins registering with a Link with data from Datacite/Crossref from dc:identifier meta tag
    Given that the user begins registering a Publication
    When they click Link to publication
    And enter a <Link>
    And click Search
    Then they see metadata about the Link
    Examples:
      | Link |
      | ...  |

  @441
  Scenario: User begins registering with a Link with data from DC ans DCTERMS meta tags
    Given that the user begins registering a Publication
    When they click Link to publication
    And enter a <Link>
    And click Search
    Then they see metadata about the Link
    Examples:
      | Link                                                     |
      | https://ntnuopen.ntnu.no/ntnu-xmlui/handle/11250/2638973 |

  @442
  Scenario: User begins registering with a Link with data from Open Graph tag
    Given that the user begins registering a Publication
    When they click Link to publication
    And enter a <Link>
    And click Search
    Then they see metadata about the Link
    Examples:
      | Link                                                                                            |
      | https://www.nrk.no/norge/klimakur-2030_-mer-strom-og-mindre-kjott-kan-fa-norge-i-mal-1.14883788 |

  @452
  Scenario: User start Wizard registration and navigates to Description tab
    Given that the user starts registering a Publication
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
    And they see the tab Constributor is clickable
    And they see the tab Files and License is clickable
    And they see the tab Submission is clickable
    And they see Next is enabled
    And they see Save is enabled

  @453
  Scenario: User navigates to the Reference tab
    Given that the starts registering a Publication
    When they navigate to the Reference tab
    Then they see mandatory fields for
      | Type |
    And they see the tab Description is clickable
    And they see the tab Reference is selected
    And they see the tab Constributor is clickable
    And they see the tab Files and License is clickable
    And they see the tab Submission is clickable
    And they see Next is enabled
    And they see Save is enabled

  @274
  Scenario: User navigates to the Reference tab and selects Publication in Journal
    Given that the navigates to the Reference tab
    When they select a Reference Type from the list
      | Publication in Journal |
    Then they can select a Publication Subtype from the list
      | Article              |
      | Short communication  |
      | Leader               |
      | Letter to the editor |
      | Review               |
    And they see mandatory fields for
      | Search-box for Journal |
    And they see optional fields for
      | DOI            |
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |
      | Peer-review    |

  @392
  Scenario: User navigates to the Reference tab and selects Book
    Given that the navigates to the Reference tab
    When they select a Reference Type from the list
      | Book |
    And they select a Publication Subtype from the list
      | Monography |
      | Anthology  |
    And they see mandatory fields for
      | Search-box for Publisher |
    And they see optional fields for
      | ISBN                  |
      | Peer-review           |
      | Is this a textbook    |
      | Total number of pages |
      | Title of the Series   |
    And they see the value for NVI

  @393
  Scenario: User navigates to the Reference tab and selects Report
    Given that the navigates to the Reference tab
    When they select a Reference Type from the list
      | Report |
    And they select a Publication Subtype from the list
      | Report          |
      | Research report |
      | Policy report   |
      | Working paper   |
    And they see mandatory fields for
      | Search-box for Publisher |
    And they see optional fields for
      | ISBN                  |
      | Peer-review           |
      | Total number of pages |
      | Title of the Series   |

  @394
  Scenario: User navigates to the Reference tab and selects Degree
    Given that the navigates to the Reference tab
    When they select a Reference Type from the list
      | Degree |
    And they select a Publication Subtype from the list
      | Bachelor  |
      | Master    |
      | Doctorate |
    And they see mandatory fields for
      | Search-box for Publisher |
    And they see optional fields for
      | Title of the Series |

  @395
  Scenario: User navigates to the Reference tab and selects Chapter
    Given that the navigates to the Reference tab
    When they select a Reference Type from the list
      | Chapter |
    And they see mandatory fields for
      | Search-box for Book |
    And they see optional fields for
      | Title of the Series               |
      | pagenumber from and pagenumber to |
    And they see the value for NVI

  @417
  Scenario: User navigates to the Constributor tab
    Given that the starts registering a Publication
    When they navigate to the Constributor tab
    Then they see mandatory fields for
      | Name           |
      | Institution    |
      | Corresponding  |
      | Move up / down |
      | Edit           |
      | Delete         |
    And a button to add an Author is enabled
    And they see the tab Description is clickable
    And they see the tab Reference is clickable
    And they see the tab Constributor is selected
    And they see the tab Files and License is clickable
    And they see the tab Submission is clickable
    And they see Next is enabled
    And they see Save is enabled

  @275
  Scenario: User navigates to the Files and License tab
    Given that the starts registering a Publication
    When they navigate to the Files and License tab
    Then they see information about the Open Access Status for the Journal which they selected on the Reference page based in information from the Norwegian Register
    And they see the Sherpa Romeo data for the Journal which they selected on the Reference page based in information from the Norwegian Register
    And they see that the journal allows publication of the article with the license CCBY 4.0 based in information from the Norwegian Register
    And they can upload files for the Publication
    And they see the tab Description is clickable
    And they see the tab Reference is clickable
    And they see the tab Constributor is clickable
    And they see the tab Files and License is selected
    And they see the tab Submission is clickable
    And they see Next is enabled
    And they see Save is enabled

  @277
  Scenario: User navigates to the Submission tab
    Given that the starts registering a Publication
    When they navigate to the Submission tab
    Then they see all of the data they have entered including mandatory fields
      | Title                   |
      | Resource (file or link) |
      | License                 |
    And they see the tab Description is clickable
    And they see the tab Reference is clickable
    And they see the tab Constributor is clickable
    And they see the tab Files and License is clickable
    And they see the tab Submission is selected
    And they see Next is enabled
    And they see Save is enabled
    And they see Publish is enabled

  @385
  Scenario: User begins registration by uploading a file
    Given that the user begins registering a Publication
    When they click Upload file
    And they upload a file
    Then they see the filesize and checksum
    And Delete file is enabled
    And Start is enabled

  #Scenario: User start Wizard registration by uploading a file
  #  Given that the user begins registration by uploading a file
  #  When they click Start
  #  Then they see the tab Description

  @386
  Scenario: User begins registration by using suggestions from ORCID
    Given that the user begins registering a Publication
    When they click Suggestions from ORCID
    Then they see a list of last publications from ORCID API assosiated with the users ORCID ID
    And each list entry contains metadata for:
      | title         |
      | year          |
      | journal title |
      | DOI           |
    And that each entry is selectable

  #Scenario: User start Wizard registration by using suggestions from ORCID
  #  Given that the user begins registration by using suggestions from ORCID
  #  When they click Start
  #  Then they see the tab Description

  @388
  Scenario: User sees a Publication based on a Link
    Given that the user begins registering with a Link
    And they see that the title <Metadata> for the Link is correct
    When they click Start
    And they click My Publications
    Then they see the Publication is saved and the title is listed and marked as Draft
    Examples:
      | Metadata |
      | Title    |
  #| First three authors |
  #| Publication date    |

  @391
  Scenario: User sees publication for a registration based on uploading a file
    Given User begins registration by uploading a file
    And they see that filesize and checksum
    When they click Start
    And they click My Publications
    Then they see the Publication is saved and the title is listed (filename) and marked as Draft

  @432
  Scenario: User verifies file upload for a registration based on uploading a file
    Given User sees publication for a Publication based on uploading a file
    When they open the item in the Wizard
    And select the tab Files and licenses
    Then the files are available for download

  @229
  Scenario: User verifies initial metadata on the Description tab for a registration
    Given that the user start Wizard registration with a Link
    When they see the Description tab
    Then they see that the Description tab is populated with metadata for
      | Title                        |
      | Alternative title(s)         |
      | Abstract                     |
      | Alternative abstract(s)      |
      | Description                  |
      | Date published               |
      | Primary language for content |

  # Dette er av typen "Publication in Journal"
  Scenario: User verifies initial metadata on the Reference tab for a registration
    Given that the user start Wizard registration with a Link
    Then they they see that the Reference tab is populated with metadata values for
      | Publication type                              |
      | Link (the link that was provided by the user) |
      | The unmapped text for Journal                 |
      | Volume                                        |
      | Issue                                         |
      | Page from                                     |
      | Page to                                       |
      | Article number                                |
      | Peer-review                                   |

  Scenario: User verifies initial metadata on the Contributors tab for a registration
    Given that the user start Wizard registration with a Link
    Then they see that the Contributors tab Authors section is populated with metadata values for <Author> and <Institution>
    And they see that the Contributors tab Contributors section is populated with metadata values for <ContributionType>, <Name> and <Institution>
    Examples:
      | Author       | Institution |
      | Name Nameson | NTNU        |
      | Jan Jansson  | MTNU        |

    Examples:
      | ContributionType | Name        | Institution |
      | Photographer     | Jim Jimsson | AVH         |

  Scenario: User verifies initial metadata on the Files and Licenses tab for a registration
    Given that the user start Wizard registration with a Link
    Then they see that the Files and Licenses tab is pre-populated with metadata values for
      | Possible mapped value for License, Archiving policy and Unit agreement |
      | Possible file for upload  (Filename, File size)                        |

  # SLETT?
  @236
  Scenario: User verifies Contributor information
    Given that the user registers initial metadata for a Publication based on a Link
    And they have clicked Next
    When they review the information for Contributors
    Then they see that the Contributors are grouped in sections Authors and Other Contributors
    And they see that the Authors are verified in ARP
    And they see that the Authors are in the expected order
    And they see that the Authors have the expected institutional affiliations
    And they see that the correct authors have the expected value for Corresponding Author
    And they see that the Other Contributors are listed alphabetically by Surname
    And they see that the Other Contributors have the correct Role, Name and Institution

  @230
  Scenario: User adds NPI data for a Publication
    Given that the user starts registering a Publication
    When they select a value in the drop-down for NPI subject area
    Then this is added to the metadata for the Publication
    And the NPI subject area is listed in the Submission

  @231
  Scenario: User views Projects widget
    Given that the user starts registering a Publication
    When they click the Projects search box
    Then they see a list of up to ten most recent active projects in NVA associated with their ID
    And an empty search box

  @444
  Scenario: User selects pre-populated Project from initial drop-down
    Given that the user views Project widget
    When they click a project in the widget
    Then the Project ID is added to the Publication metadata
    And the user can add another Project

  @445
  Scenario: User searches for a Project
    Given that the user views Project widget
    When they write a project name in the search box
    Then they see a list of results based on free-text search for Project title in the Projects API

  @446
  Scenario: User selects searched-up Project from initial drop-down
    Given that the user searches for a Project
    When they click a project in the widget
    Then the Project ID is added to the Publication metadata
    And the user can add another Project

  @233
  Scenario: User verifies Norwegian Registry information for a Publication based on a Link
    Given that the user registers initial metadata for a Publication based on a Link
    And the Publication is a Publication in Journal
    And the Journal for the Publication is found in the Norwegian Register
    When they verify the information from the Norwegian Register that appears in the Journal Metadata
    Then they see that the information for Journal Title is correct
    And they see that the information for Print ISSN is correct
    And they see that the information for Online ISSN is correct
    And they see that the information for Academic Level is correct

  # Happy day scenario for a DOI-sourced Academic Publication
  # The DOI dereferences to a data document that contains ORCIDs for every Contributor
  # The DOI dereferences to a data document that contains a Grant ID
  # The Grant ID is available in Cristin Project DB
  # Cristin Project DB data document contains the ORCIDs for project members
  # There is a match between all ORCIDs from the DOI data document and (a subset of) the Cristin Project DB Project data document ORCIDs
  # All of the ORCIDs are in ARP

  @418
  Scenario: User opens the add Author dialog
    Given that the user navigates to Contributor tab
    When they click Add Author
    Then the dialog to add an Author is opened
    And the dialog contains fields for
      | Author search |
    And a button to close the dialog

  @419
  Scenario: User adds an Author to the Author list
    Given that the user opens the add Author dialog
    And enters a Name in the Author search box
    And see search results for the Author search containing the last publication
    And see the Institution from ARP
    When they click Add Author
    Then the dialog is closed
    And the Author is shown in the Author table in the Constributor tab

  # Tegn delete og fullfør beskrivelse
  @
  Scenario: User creates a new Author in the Author dialog
    Given that the user opens the add Author dialog
    And they click the link to create a new Author
    And enters a Name in the Author name box
    And enter Institution details
    When they click Add Author
    Then the dialog is closed
    And the Author is shown in the Author table in the Constributor tab

  #Legg til Scenario for delete, edit, move, korresponding

  @
  Scenario: User registers Corresponding Author
    Given that the user registers initial metadata for a Publication based on a Link
    And they have clicked Next
    When they review the information for Contributors
    Then they see that the Contributors are grouped in sections Authors and Other Contributors
    And they set the correct values for Corresponding Author
    And they see that the Other Contributors are listed alphabetically by Surname
    And they see that the Other Contributors have the correct Role, Name and Institution

  # Corresponding Author is not in fact present in the Datacite data, but probably will be soon

  # Important note about the "License": This assumes that the article is published in a journal that has a special Unit
  # agreement, which entails that Unit has negotiated a contract for Norwegian corresponding authors
  # In all other cases, a License-picker is provided

  @276
  Scenario: User uploads files for the Publication
    Given that the user navigates to files and licenses
    When they drag and drop a file into the File drag-and-drop area
    Then they see that the files are uploaded
    And for each file they see the file receipt and settings

  @454
  Scenario: User views file receipt and settings the Publication
    Given that the user uploads files for the Publication
    When the view each file
    Then they see that the files are uploaded
    And for each file they see the file receipt and file settings
    And they see the original filename
    And they see the filesize
    And they see the checksum for the uploaded file
    And see mandatory radio Select version with values
      | Accepted version  |
      | Published version |
    And see mandatory dropdown for License with values
      | CC-BY 4.0 |
    And optional fields for
      | postponed publication |
    And optional checkbox for Administrative contract
    And a Preview button
    And a Remove button

  Scenario: User select values for uploaded files
    Given that the user uploads files for the Publication
    When set values for the <Field>
    And they navigate to the Submission Page
    And they look at the Files section
    Then they see the <Value> for the <Field>
    Examples:
      | Field               | Value                 |
      | Filename            | original-filename.pdf |
      | Filesize            | 128k                  |
      | Version             | Accepted version      |
      | License             | CC-BY 4.0             |
      | Delayed Publication | 2032-12-21            |

  @455
  Scenario: User selects Administrative contract for uploaded files
    Given that the user uploads files for the Publication
    When the user selects Administrative contract
    Then they see the original filename
    And they see the filesize
    And they see the checksum for the uploaded file
    And optional checkbox for Administrative contract
    And a Preview button
    And a Remove button

  @278
  Scenario: User publishes Publication
    Given the user views Submission
    When they click Publish
    Then they see the Public page containing all data and files
    And they see the Publication is Published

  # Access to the different menu items
  @244
  Scenario: User sees non-logged-in menu
    Given the user is not logged in
    When they look at any page in NVA
    Then they see an menu containing
      | Logg inn |

  @345
  Scenario: User sees a menu when logged in
    Given the user is logged in (and has no NVA-role)
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile |
      | Log Out    |

  @346
  Scenario: User sees the menu for Creator
    Given the user is logged in
    And has the role of Creator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile       |
      | Log Out          |
      | New Registration |
      | My Publications  |
      | My Messages      |

  @347
  Scenario: User sees the menu for Curator
    Given the user is logged in
    And has the role of Curator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile  |
      | Log Out     |
      | My Worklist |

  @348
  Scenario: User sees the menu for Administrator
    Given the user is logged in
    And has the role of Administrator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile          |
      | Log Out             |
      | User administration |
      | My Institution      |

  @349
  Scenario: User sees the menu for Editor
    Given the user is logged in
    And has the role of Editor
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile            |
      | Log Out               |
      | Editor administration |

  @350
  Scenario: User sees the menu for Application administrator
    Given the user is logged in
    And has the role of Application administrator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile   |
      | Log Out      |
      | Institutions |

  # Description of each menu item

  # Menu items for anonymous
  @351
  Scenario: User opens login page
    Given the user is not logged in
    When they click the menu item Logg inn
    Then the page for login with Feide is opened

  # Menu items for logged in person
  @352
  Scenario: User opens the page My Profile
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

  @406
  Scenario: User views a list of sub-units at their Institution on My Profile
    Given user opens My Profile
    When they click Change Institution
    Then the user sees the Change Institution window
    And their Institution from ARP is selected
    And a dropdown with the units connected to the Institution is shown
    And a Change button is available

  @407
  Scenario: User adds a sub-unit to their Institution from My Profile
    Given user views a list of sub-units to their Institution from My Profile
    When the user selects a sub-unit
    And save the changes
    Then the changes are saved to the ARP
    And the changes are shown in My Profile

  @409
  Scenario: User views all sub-units at their Institution on My Profile
    Given the user views a list of sub-units at their Institution on My Profile
    When the users selects a sub-unit
    Then they see a dropdown with sub-units
    And they see a new sub-unit dropdown until there are no more sub-unit-levels

  @410
  Scenario: User opens Add Institution from My Profile
    Given user opens the page My Profile
    When they click Add (Institution)
    Then the Add Institution window is opened
    And the user can search for Institutions

  @411
  Scenario: User Adds an Institution from My Profile
    Given User opens Add Institution from My Profile
    When they have searched for an Institution
    And they have selected an Institution
    And they have clicked Add
    Then the Add Institution window is closed
    And the Institution ID is saved to ARP
    And the user sees the new Institution in My Profile

  @383
  Scenario: User removes an ORCID connection from My Profile
    Given user opens the page My Profile
    When they click Remove ORCID
    Then they are asked to confirm
    And their ORCID is removed from ARP

  @353
  Scenario: User logs out
    Given the user is logged in
    When they click the menu item Log Out
    Then the user is logged out from Feide
    And the search page is opened
    And the user sees non-logged-in menu

  # Menuitems for Creator
  Scenario: User opens New Registration
    Given the user is logged in as Creator
    When they click the menu item New Registration
    Then the page New Registration is opened
    And the user sees options
      | Start med å laste opp fil          |
      | Start med en lenke til publikasjon |
      | Start med forslag fra din ORCID    |

  @354
  Scenario: User opens My Publications
    Given the user is logged in as Creator
    When they click the menu item My Publications
    Then the page My Publications is opened
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
  @355
  Scenario: User opens an item in the My Publication list
    Given the user is logged in as Creator
    And has opened the page My Publications
    When they click Edit on an item
    Then the item is opened in the Wizard
    And the user sees the Description tab
    And the fields in the Wizard are populated with values from the saved publication

  # Actions from Page : My Publications (Delete)
  @356
  Scenario: User delete an item in the My Publications list
    Given the user is logged in as Creator
    And has opened the page My Publications
    When they click Delete on an item
    Then a comfirmation pop-up is opened
    When the user selects Yes the publication is marked as Deleted
    When the user selects No the pop-up is closed

  @421
  Scenario: User opens their Public Profile from My Publications Page
    Given the user is logged in as Creator
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
    Given the user is logged in as Curator
    When they click the menu item My Worklist
    Then the page My Worklist is opened
    And the user see the lists
      | For Approval |
      | Support      |
      | DOI-request  |
    And the lists have fields
      | Title     |
      | Submitter |
      | Date      |
    And a button Open that is enabled

  # Actions from Page : My Worklist
  @358
  Scenario: User opens an item in the For Approval or DOI-request list
    Given the user is logged in as Curator
    And has opened the page My Worklist
    And they select a <Tab>
    When they click Open on an item
    Then the item is opened in the wizard
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
    Given the user is logged in as Administrator
    When they click the menu item User administration
    Then the page User administration is opened
    And the user sees a list of all users connected to their institution
    And the users are grouped by NVA-roles
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
    Given the user is logged in as Administrator
    When they click the menu item My Institution
    Then are on the page My Institution

  @361
  Scenario: The Administrator edits an Institution
    Given the Administrator has opened My Institution
    When they edit the fields
      | Name in organisation registry |
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
  Scenario: Administrator adds a role to a user
    Given the user is logged in as Administrator
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
    Given the user is logged in as Editor
    When they click the menu item Editor administration
    Then the page Editor administration is opened
    And has the fields
      | Email |
    And a button Save that is enabled

  # Menuitems for Application adminstrator
  @365
  Scenario: The Application adminstrator opens Institutions
    Given the user is logged in as Application adminstrator
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
  @NP-366
  Scenario: Application adminstrator changes / adds an institution
    Given the user is logged in as Application adminstrator
    When they click <Button> in the page Institutions
    Then the page Institution is opened with the fields
      | Name in organisation registry |
      | Display name                  |
      | Short displayname             |
      | CNAME                         |
      | Intitution DNS                |
      | Administration ID             |
      | Feide Organisation ID         |
    And a button Add that is enabled
    Examples:
      | Button |
      | Add    |
      | Save   |
