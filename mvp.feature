# encoding: utf-8
# language: en

Feature: MVP features for NVA

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

  @1205
  Scenario: User connects Author
    Given that the user logs in with Feide for the first time
    When they click OK in the Connect Author dialog
    Then the Connect Author dialog closes
    And they see a confirmation dialog

  @28
  Scenario: A user is already authenticated with Feide (single sign on)
    Given that the user is already authenticated with Feide
    When they navigate to the Start page
    And they click Log in
    And they are redirected to Feide
    And they click on the identity they wish to proceed with in the Feide interface
    Then they are redirected back to the Start page
    And they see their name in the Menu

  @353
  Scenario: A user logs out
    Given that the user is already logged in
    When they click on the Menu
    And they click Log out
    Then they are logged out of the NVA application

  @1207
  Scenario: User has no matching Author identity
    Given that Sandy Jones has a valid Feide ID and password
    And they do not have a Feide ID in their ARP entry
    And there are no matching entries in ARP
    When they log in
    Then they see the Create Authority dialog
    And that their name is selected

  @646
  Scenario: Creator creates own Author identity
    Given that Sandy Jones has a valid Feide ID and password
    And there are results for Sandy Jones in ARP
    And they do not identify with one of the results
    When they click the Create New Author Button
    Then they see the Create New Authority dialog
    And that their name is selected

  @453
  Scenario: Creator navigates to Resource Type tab
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Resource Type tab
    Then they see the mandatory field for Type
    And they see the tab Description is clickable
    And they see the tab Resource Type is selected
    And they see the tab Contributor is clickable
    And they see the tab Files and Licenses is clickable
    And they see the tab Submission is clickable
    And they see Next is enabled
    And they see Save is enabled

  @393
  Scenario: Creator navigates to Resource Type tab and selects Report
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Resource Type tab
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
  Scenario: Creator navigates to Resource Type tab and selects Degree
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Resource Type tab
    And they select a Reference Type — Degree
    And they select a Publication Subtype from the list
      | Bachelor  |
      | Master    |
      | Doctorate |
    Then they see Search box for "Publisher name"
    And they see Search box for "Title of the Series"

  @395
  Scenario: Creator navigates to the Resource Type tab and selects Chapter
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Resource Type tab
    And they select the Reference Type Book
    And they select the Publication Subtype Chapter
    Then they see an Information box with text "Before you register the chapter, you need to register the book"
    And they see field "Link to publication"
    And they see a Search box for "Published in"
    And they see a preselected value for Peer review "Not peer reviewed"
    And they see field for Page number from
    And they see field for Page number to
    And they see a Search box for "Series title"
    And they see the NVI evaluation is Not NVI Applicable

  @275
  Scenario: Creator navigates to Files and Licenses tab
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Files and Licenses tab
    Then they see the Publication Channel Information box
    And they see the File upload widget

  #    Then they see information about the Open Access Status for the Journal which they selected on the Reference page based in information from the Publication Channel Register
  #    And they see the Sherpa Romeo data for the Journal which they selected on the Reference page based in information from the Publication Channel Register
  #    And they see that the journal allows publication of the article with the license CCBY 4.0 based in information from the Publication Channel Register
  #    And they can upload files for the Publication
  #    And they see the tab Description is clickable
  #    And they see the tab Resource Type is clickable
  #    And they see the tab Contributor is clickable
  #    And they see the tab Files and Licenses is selected
  #    And they see the tab Submission is clickable
  #    And they see Next is enabled
  #    And they see Save is enabled

  @277
  Scenario: Creator navigates to Submission tab
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Submission tab
    Then they see all of the data they have entered including
      | Title                   |
      | Resource (file or link) |
      | License                 |
    And they see the tab Description is clickable
    And they see the tab Resource Type is clickable
    And they see the tab Contributor is clickable
    And they see the tab Files and Licenses is clickable
    And they see the tab Submission is selected
    And they see Save is enabled
    And they see Publish is enabled

  @653
  Scenario: Creator sees validation errors
    Given Creator begins registering a Publication in the Wizard
    And they have not filled out any input fields in the Wizard
    When they navigate to the Submission tab
    Then they see a Validation Section with description of errors
      | Description: Title is mandatory                        |
      | References: Subtype, journal, peer review is mandatory |
      | Contributors: Minimum one contributor required         |
      | Files: Minimum one file required                       |

  #Scenario: User start Wizard registration by uploading a file
  #  Given Creator begins registration by uploading a file
  #  When they click Start
  #  Then they see the tab Description

  @386
  Scenario: Creator begins registration by using suggestions from ORCID
    Given Creator begins registering a Publication
    When they click Suggestions from ORCID
    Then they see a list of last publications from ORCID API associated with their ORCID
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
  #  Given Creator begins registration by using suggestions from ORCID
  #  When they click Start
  #  Then they see the tab Description

  @432
  Scenario: Creator verifies file upload for a registration based on uploading a file
    Given Creator opens an item in the My Publication list
    When they select the tab Files and Licenses
    Then they see upload information

  @454
  Scenario: Creator sees upload information
    Given Creator navigates to Files and Licenses tab
    When they view the page
    Then they see the File Detail box contains information about:
      | File name |
      | File size |
      | Checksum  |
    And they see the File Detail box has a checkbox for Administrative agreement
    And they see the File Detail box has a radio for Version with values:
      | Accepted version  |
      | Published version |
    And they see the File Detail box has a date picker for delayed publishing
    And they see the File Detail box has a drop down for Licenses
    And they see the Download button in the File Detail box is enabled
    And they see the Delete button in the File Detail box is enabled

  # Dette er av typen "Publication in Journal"
  Scenario: Creator verifies initial metadata on the Resource Type tab for a registration
    Given Creator begins registering with a Link with direct data from Datacite/CrossRef
    And the Publication is a Publication in Journal
    When they click Start
    And they click the Resource Type tab
    Then they they see that the Resource Type tab is populated with metadata values for
      | Publication type                              |
      | Link (the link that was provided by the user) |
      | The unmapped text for Journal                 |
      | Volume                                        |
      | Issue                                         |
      | Page from                                     |
      | Page to                                       |
      | Article number                                |
      | Peer review                                   |

  Scenario: Creator verifies initial metadata on the Contributors tab for a registration
    Given Creator begins registering with a Link with direct data from Datacite/CrossRef
    And the Publication is a Publication in Journal
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
  Scenario: Creator verifies initial metadata on the Files and Licenses tab for a registration
    Given Creator begins registering with a Link with direct data from Datacite/CrossRef
    And the Publication is a Publication in Journal
    When they click the Files and Licenses tab
    Then they see that the Files and Licenses tab is prepopulated with metadata values for
      | Possible mapped value for License, Archiving policy and Unit agreement |
      | Possible file for upload  (Filename, File size)                        |

  @230
  Scenario: Creator adds NPI data for a Publication
    Given Creator begins registering a Publication in the Wizard
    And they click the Description tab
    When they select a value in the dropdown for NPI subject area
    And they click the Submission tab
    Then they see the NPI subject area is listed

  @231
  Scenario: Creator sees Autosearch dropdown for Project
    Given Creator begins registering a Publication in the Wizard
    And they click the Description tab
    When they click the Projects search box
    Then they see a Autosearch dropdown with an empty search field
    And they see a pre-filled selectable list of results featuring the ten most recent active projects in NVA associated with their User

  @444
  Scenario: Creator selects prepopulated Project from Autosearch dropdown for Project
    Given Creator sees Autosearch dropdown for Project
    When they click a project in the dropdown
    Then they see the project details in a new Project Information box
    And they see the Project Information box contains information about:
      | Project title |
      | Grant ID      |
      | Financed by   |
    And they see that Project Information box Delete button is enabled
    And they see a Autosearch dropdown for Project above the Project Information box

  @233
  Scenario: Creator sees journal title suggestion from a Link
    Given Creator begins registering with a Link with direct data from Datacite/CrossRef
    And the Publication is a Publication in Journal
    And the Journal for the Publication is in the Publication Channel Register
    When they click the Resource Type tab
    Then they see the Autosearch dropdown for Journal contains a journal title

  @1209
  Scenario: Creator sees Publication Channel Register information for a Journal
    Given Creator sees journal title suggestion from a Link
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
  Scenario: Creator opens the Add Author dialog
    Given Creator navigates to Contributor tab
    When they click Add Author
    Then they see the Add Author dialog
    And they see Author search
    And they can cancel the dialog

  @1211
  Scenario: Creator sees Author search results
    Given Creator opens the Add Author dialog
    And there are matching results for Name Nameson in ARP
    When they enter Name Nameson in the Author search
    Then they see search results for the Author search
    And they see each Author result contains:
      | Author name                   |
      | the Author's last publication |
      | Affiliation(s)                |

  @784
  Scenario: Creator finds no matching Author in Author Search
    Given Creator opens the Add Author dialog
    And there are no matching results for Name Nameson in ARP
    When they enter Name Nameson in the Author search
    Then they see no matching results
    And they see the Create New Author button

  @786
  Scenario: Creator sees New Author in the Author dialog
    Given Creator finds no matching Author in Author Search
    When they click Create New Author
    Then they see a field for Author name
    And they see an Autosearch box for Affiliation

  #Legg til Scenario for delete, edit, move, korresponding

  @1213
  Scenario: Creator sees Corresponding Author Email field
    Given Creator begins registering with a Link with direct data from Datacite/CrossRef
    And they are on the Contributors tab
    When they click Corresponding Author checkbox on an Author
    Then they see an input field for Email

  @1214
  Scenario: Creator registers Corresponding Author
    Given that they see Corresponding Author Email field
    When they enter a valid Email address
    And they blur out of the Corresponding Author Email field
    And they click the Summary tab
    Then they see that the Author is registered as the Corresponding Author for the Publication

  # Corresponding Author is not in fact present in the Datacite data, but probably will be soon

  # Important note about the "License": This assumes that the article is published in a journal that has a special Unit
  # agreement, which entails that Unit has negotiated a contract for Norwegian corresponding authors
  # In all other cases, a License-picker is provided

  @276
  Scenario: Creator uploads files for a Publication
    Given Creator navigates to Files and Licenses
    When they drag and drop a file into the File drag-and-drop area
    Then they see upload information

  @1215
  Scenario Outline: Creator selects values for uploaded files
    Given Creator uploads files for a Publication
    When they set values for <Field>
    And they navigate to the Submission tab
    And they look at the Files section
    Then they see the <Value> for the <Field>
    Examples:
      | Field              | Value            |
      | Version            | Accepted version |
      | License            | CC-BY 4.0        |
      | Delayed publishing | 2032-12-21       |

  @455
  Scenario: Creator selects Administrative contract for uploaded files
    Given Creator uploads files for the Publication
    When they select Administrative contract
    Then they see the original filename
    And they see the filesize
    And they see the checksum for the uploaded file
    And they see a message stating that the file is Adminsitrative and has no License and has restricted viewing rights
    And they see a Delete button

  @278
  Scenario: Creator publishes Publication
    Given Creator sees Publication Channel Register information for a Journal
    And they select values for uploaded files
    And they are on the Submission tab
    When they click Publish
    Then they are redirected to the Public Page for Publication
    And they see the Publication confirmation message

  @881
  Scenario Outline: Anonymous User View Public Page for Publication
    Given the Anonymous User has opened NVA
    And they see the <Page>
    When they click to view a Publication
    Then the Public Page for Publication is opened
    And they see page fields for
      | Title                  |
      | Abstract               |
      | NPI                    |
      | Keywords               |
      | Publication date       |
      | Primary language       |
      | Projects               |
      | Publication type       |
      | Publication subtype    |
      | Values per sybtype     |
      | Clickable Contributors |
      | Clickable emails       |
      | Affiliations           |
      | File download link     |
      | ORCID                  |
      | DOI link               |
      | Licence                |
      | <Licence link>         |

    Examples:
      | Page        | Licence link                                                            |
      | Start Page  | https://creativecommons.org/licenses/by/4.0/deed.no                     |
      | Public Page | https://dlr.unit.no/licenses/ntnu-alle-rettigheter-forbeholdt-forfatter |

  @1236
  Scenario: A user navigates to the Public Page for Publication with a Draft DOI
    Given that a user navigates to the Public Page for Publication
    And the Publication is published
    And the Publication has a Draft DOI
    Then the Public Page for Publication is displayed without the Draft DOI

  # Access to the different menu items
  @344
  Scenario: User sees non-logged-in menu
    Given that the user is not logged in
    When they look at any page in NVA
    Then they see the Log in button

  @345
  Scenario: User sees a menu when logged in
    Given that the user is logged in
    And they have no NVA role
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile |
      | Log Out    |

  @346
  Scenario: User sees the menu for Creator
    Given that the user is logged in
    And they have the role of Creator
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
    And they have the role of Curator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile  |
      | My Worklist |
      | Log Out     |

  @348
  Scenario: User sees the menu for Administrator
    Given that the user is logged in
    And they have the role of Administrator
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile          |
      | User administration |
      | My Institution      |
      | Log Out             |

  @349
  Scenario: User sees the menu for Editor
    Given that the user is logged in
    And they have the role of Editor
    When they look at any page in NVA
    Then they see a menu containing
      | My Profile            |
      | Editor administration |
      | Log Out               |

  @350
  Scenario: User sees the menu for Application administrator
    Given that the user is logged in
    And they have the role of Application administrator
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
    Then they see My Profile
    And they see their Profile page which includes information for
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
    Then they see the Add Institution dialog is opened
    And they see the Autosearch box for Institutions

  @411
  Scenario: User adds an Institution from My Profile
    Given User opens Add Institution from My Profile
    When they enter an Institution name
    And they select an Institution
    And they click Save
    Then they see the Add Institution dialog is closed
    And they see the new Institution in My Profile
    And they see a button Remove that is enabled for the new Institution

  @551
  Scenario: User removes an Institution from My Profile
    Given User adds an Institution from My Profile
    When they click Remove
    Then they see a Notification that the Institution is removed

  @406
  Scenario: User sees a Subunit from My Profile
    Given User opens Add Institution from My Profile
    When they enter an Institution name
    And they select an Institution
    Then they see Subunit dropdown containing all the subunits at their Institution

  @407
  Scenario: User selects a Subunit from My Profile
    Given user sees a Subunit from My Profile
    When they select a Subunit from the Subunit dropdown
    And they click Save
    Then they see the Add Institution dialog is closed
    And they see the new Institution and subunit in My Profile

  @409
  Scenario: User sees a Subsubunit from My Profile
    Given they see a Subunit from My Profile
    When they click the Subunit dropdown
    Then they see a Subsubunit dropdown containing all the Subsubunits at their Subunit

  @1218
  Scenario: User selects a Subsubunit from My Profile
    Given user sees a Subsubunit from My Profile
    When they select a Subsubunit from the Subsubunit dropdown
    And they click Save
    Then they see the Add Institution dialog is closed
    And they see the new Institution and Subunit and Subsubunit in My Profile

  @1219
  Scenario: User sees a Subsubsubunit from My Profile
    Given they see a Subsubunit from My Profile
    And they select a Subsubunit from the Subsubunit dropdown
    When they click the Subsubsubunit dropdown
    Then they see a Subsubsubunit dropdown containing all the Subsubsubunits at their Subsubunit

  @1220
  Scenario: User selects a Subsubsubunit from My Profile
    Given user sees a Subsubsubunit from My Profile
    When they select a Subsubsubunit from the Subsubsubunit dropdown
    And they click Save
    Then they see the Add Institution dialog is closed
    And they see the new Institution and Subunit and Subsubunit and Subsubsubunit in My Profile

  @383
  Scenario: User removes an ORCID connection from My Profile
    Given user opens the page My Profile
    When they click Remove ORCID
    Then they see a confirmation that the ORCID is removed

  # Menuitems for Creator
  Scenario: Creator opens New Registration
    Given that the user is logged in as Creator
    When they click the menu item New Registration
    Then they see the New Registration page
    And they see options
      | Upload file            |
      | Link                   |
      | Suggestions from ORCID |

  @354
  Scenario Outline: Creator opens My Publications
    Given the user is logged in as Creator
    When they click the menu item My Publications
    Then they see My Publications
    And they see a list of all unpublished registrations with the fields
      | Title    |
      | <Status> |
      | Created  |
    And they see each list item has a button Delete and Edit that is enabled
    And they see the navigation bar for unpublished registrations is selected
    And they see the navigation bar for published registrations is enabled

    Examples:
      | Status   |
      | Draft    |
      | Rejected |

  # Actions from Page : My Publications (Edit)
  @355
  Scenario: Creator opens an item in My Publication list
    Given that the user is logged in as Creator
    And is on the page My Publications
    When they click Edit on an item
    Then they see the item is opened in the Wizard
    And they see the Description tab
    And they see fields:
      | Title                        |
      | Alternative title(s)         |
      | Abstract                     |
      | Alternative abstract(s)      |
      | Description                  |
      | Date published               |
      | Primary language for content |

  # Actions from Page : My Publications (Delete)
  @356
  Scenario: Creator deletes an item in My Publications list
    Given Creator opens My Publications
    When they click Delete on an item
    And they see a confirmation pop-up is opened
    And they select Yes
    Then they see that the Publication is deleted

  @967
  Scenario: Creator does not delete an item in My Publications list
    Given Creator opens My Publications
    When they click Delete on an item
    And they see a confirmation pop-up is opened
    And they select No
    Then they see that the pop-up is closed

  @576
  Scenario: Creator cancels deletion of an item in My Publications list
    Given that the user is logged in as Creator
    And is on the My Publications page
    When they click Delete on an item
    And they click No in the confirmation dialog
    Then they see the Publication in My Publications list

  @421
  Scenario: Creator opens their Public Profile from My Publications Page
    Given that the user is logged in as Creator
    And they open My Publications page
    When they click Public Profile
    Then they see their Public Profile
    And they see fields:
      | Name                                                                              |
      | Institutions                                                                      |
      | Public email                                                                      |
      | ORCID                                                                             |
      | List of publications where the user is a contributor and with status is Published |

  @1247
  Scenario: Creator Edits a comment on a DOI request
    Given that the Creator Opens a DOI request entry from My Worklist
    And the request has status Requested
    When they click the Edit button on a DOI request
    Then they can edit the comment
    And they see a Save button

  @1248
  Scenario: Creator Saves a comment on a DOI request
    Given that the Creator Edits a comment on a DOI request
    When they Save the comment
    Then the comment is saved
    And they see a confirmation message
    And they can no longer edit the comment

  @1250
  Scenario: Creator closes a DOI request
    Given that the Creator Opens a DOI request entry from My Worklist
    When they click the Close button
    Then they see the Worklist

  @1251
  Scenario: Creator opens a Publication with a DOI request
    Given that the Creator Opens a DOI request entry from My Worklist
    When they click the Edit publication button
    Then the Publication is opened in the Wizard on the first tab

  @1240
  Scenario: Creator deletes a DOI request
    Given that the Creator opens My Worklist
    When they click the Delete button on a DOI request
    Then the request is deleted from their Worklist
    And the request is deleted from the Worklist of their Curator
    And the Public Page for Publication has an enabled "Request DOI" button

  @1242
  Scenario: Request/Draft Doi buttion is disabled for Publications with existing DOI
    Given that the Creator navigates to the Public Page for Publication
    And they are the Owner of this Publication
    And the Publication has a DOI
    When they see the Status Bar
    Then they see that the Request/Draft DOI button is disabled
  # a Publication may have more then one DOI,
  # but NVA is only source for one DOI for each Publication

  @1231
  Scenario: Owner navigates to the Public Page for Publication for published publication without DOI
    Given that the Creator navigates to the Public Page for Publication
    And they are the Owner of this Publication
    And the Publication has no DOI
    When they see the Status Bar
    Then they see buttons for "Request a DOI" and "Edit Publication"

  @511
  Scenario: Owner opens the "Request a DOI" dialog
    Given that a Creator navigates to the Public Page for Publication for published publication without DOI
    And they are the Owner of this Publication
    When they click the "Request a DOI" button
    Then the "Request a DOI dialog" is opened
    And they see fields for Message
    And they see a "Send Request" button

  @1232
  Scenario: Owner navigates to the Public Page for Publication and requests a DOI
    Given that the Creator navigates to the Public Page for Publication for published publication without DOI
    And they are the Owner of the Publication
    And open "Request a DOI" dialog
    And optional add a message to the Curator
    When the user click the Send Button
    Then the Public Page for Publication is displayed
    And the "Request a DOI" button is renamed to "DOI pending" and is disabled
    And the request is listed in User Worklist
    And the request is listed in Curator Worklist

  @1233
  Scenario: Owner navigates to the Public Page for Publication for unpublished publication without DOI
    Given that the Owner view Public Page for Publication for publication
    And the publication is not Published
    And the publication has no DOI
    When they look at the Status Bar
    Then they see buttons for Draft a DOI and Edit publication

  @1234
  Scenario: Owner drafts a DOI for an unpublished Publication
    Given that the Owner View Public Page for Publication for unpublished publication without DOI
    And they are the Owner of the Publication
    When they click the "Draft a DOI" button
    Then the Public Page for Publication is displayed
    And the "Draft a DOI" button is renamed to "DOI pending" and is disabled
    And the Draft DOI is added to the metadata
    And the Public Page for Publication contains the Draft DOI
    And the Draft DOI is not a link
  #Draft DOIs are not acknowledged by the resolving mechanisms (Handle-system)

  @1235
  Scenario: Owner navigates to the submission tab and publish a Publication with a drafted DOI
    Given that the Owner navigates to Submission tab
    And the Publication has status Draft
    And the Publication has a Draft DOI
    When the Owner clicks the publish button
    Then the Public Page for Publication is displayed
    And the "Request a DOI" button is still named "DOI pending" and is disabled
    And the Public Page for Publication lists the Draft DOI
    And the Draft DOI is still not a link
    And the DOI request is listed in the Owners work list
    And the DOI request is listed in the Curators work list

  # Actions from Page : My Worklist
  @1252
  Scenario: Curator views details of a Worklist item
    Given that a Curator views DOI request tab
    When they expand the item
    Then they see the item is expanded
    And they see the Title of the Publication
    And they see the DOI request status
    And they see a list of Messages with fields:
      | Message   |
      | Submitter |
      | Date      |
    And they see an input field for Answer
    And they see buttons
      | Send answer       |
      | Go to publication |
      | Archive           |

  @358
  Scenario: Curator opens a Publication from a DOI Request Worklist Item
    Given that a Curator views details of a Worklist item
    And the item is a DOI request
    When they click "Go to Publication"
    Then they see the Publication is opened in the Wizard
    And they see the Submission tab
    And they see the Create DOI button is enabled
    And they see the Decline DOI button is enabled

  @512
  Scenario: A Curator approves a DOI request
    Given that a Curator opens a Publication from a DOI Request Worklist Item
    When they click Create DOI
    Then they see the Public Page for Publication
    And the Publication has a DOI Link
    And the Request DOI item is marked as Approved in their Worklist

  @1243
  Scenario: A Curator enter a decline-comment on a DOI request
    Given that a Curator opens an item in the Worklist
    And the item is a DOI request
    When they click Decline DOI
    Then they may enter a decline-comment

  @1244
  Scenario: A Curator declines a DOI request
    Given that a Curator enters a decline comment on a DOI request
    When they click Save
    Then the DOI request is marked as "Declined"
    And the request in the User's Worklist is updated to "Declined"
    And the request is removed from the Curator's Worklist
    And they see their Worklist

  # Menuitems for Administrator
  @359
  Scenario Outline: Administrator views User Administration Sections with Role members (Part I)
    Given that the user is logged in as Administrator
    When they click the menu item User Administration
    Then they see the User Administration page
    And they see the <Section>
    And they see the <Section> contains a list of all users affiliated with their institution and with with role <Role>
    And they see under each Section a Button to assign the <Role> to a another user
    And they see that each list has the field "Authentication ID"
    And they see a button Remove that is enabled for each user
    Examples:
      | Section                    | Role          |
      | Institution Administrators | Administrator |
      | Curators                   | Curator       |
      | Editors                    | Editor        |
      | Creators                   | Creator       |

  @360
  Scenario: Administrator opens My Institution (Part I)
    Given that the user is logged in as Administrator
    When they click the menu item My Institution
    Then they see the My Institution page
    And they see fields:
      | Name in organization registry |
      | Display name                  |
      | Short display name            |
      | CNAME                         |
      | Institution DNS               |

  @575
  Scenario: Administrator uploads a new Logo
    Given Administrator opens My Institution
    When they click Upload Logo
    And they select an image from their computer
    And they click OK
    Then they see the Logo on My Institution page

  @361
  Scenario: Administrator edits an Institution
    Given Administrator opens My Institution
    When they edit the fields
      | Name in organization registry |
      | Display name                  |
      | Short display name            |
      | CNAME                         |
      | Institution DNS               |
    And they check Publications must be approved by Curator checkbox
    And they upload a new Logo
    Then they see a notification that the information was saved
    And they can visit the Institutional Portal

  @362
  Scenario: Administrator views the Institutional Portal
    Given Administrator edits an Institution
    When they visit the Institutional Portal
    Then they see the web address in their web browser is the CName + .nva.unit.no
    And they see the page title is the same as the Display Name on My Institution

  # Menuitems for Editor
  @364
  Scenario: Editor opens Editor Administration
    Given that the user is logged in as Editor
    When they click the menu item Editor Administration
    Then they see the page Editor Administration
    And they see a field for Email
    And they see a Save Button that is enabled

  # Menuitems for Application adminstrator
  @365
  Scenario: Application Administrator opens Institutions
    Given that the user is logged in as Application Administrator
    When they click the menu item Institutions
    Then they see the page Institutions
    And they see a table of all Institutions (customers)
    And they see the table contains the fields
      | Institution |
      | Created     |
      | Editor      |
    And they see a button Open that is enabled for each Institution
    And they see a button Create Institution that is enabled

  # Actions from page : Institution (Add/Update)
  @366
  Scenario: Application Administrator views an Institution
    Given Application Administrator opens Institutions
    When they click Open on an Institution
    Then they see the page for the Institution
    And they see fields:
      | Name in organization registry |
      | Display name                  |
      | Short display name            |
      | CNAME                         |
      | Institution DNS               |
      | Administration ID             |
      | Feide Organization ID         |
    And a button Save that is enabled

  @366
  Scenario: Application Administrator adds an Institution
    Given Application Administrator opens Institutions
    When they click Add Institution
    And they search and select a Name in Organization registry
    And they upload a Logo
    And they enter a Display name
    And they enter a Short display name
    And they enter a CNAME
    And they enter an Institution DNS
    And they enter an Administration ID
    And they enter a Feide organization ID
    And they click Save
    Then they see a Notification that the Institution has been created
    And they see the values they entered in the fields on the page

  @574
  Scenario Outline: Application Administrator edits an Institution
    Given Application Administrator views an Institution
    When they make a change in <Field>
    And they click Save
    Then they see a Notification that the changes are saved
    And they see the <Field> has the new value in the page

    Examples:
      | Field                         |
      | Name in organization registry |
      | Display name                  |
      | Short display name            |
      | CNAME                         |
      | Institution DNS               |
      | Feide Organization ID         |

  @902
  Scenario: User opens a Public Profile from a Public Page for Publication
    Given the Creator publishes Publication
    When they click a Contributor
    Then they see the Contributor's public profile page

  @913
  Scenario Outline: User sees published publications
    Given Creator opens the page My Publications
    When they click Published registrations in the navigation bar
    Then they see a list of all published registrations with the fields
      | Title    |
      | <Status> |
      | Created  |
    And they see each list item has buttons Delete and Edit
    And the they see the Edit button is enabled
    And the Delete button is enabled for registrations not marked as Deleted
    And they see the navigation bar for unpublished registrations is enabled
    And they see the navigation bar for published registrations is selected

    Examples:
      | Status    |
      | Deleted   |
      | Published |

  @914
  Scenario: User deletes a published Publication
    Given that the user is logged in as Creator
    And they see the page My Publications
    And they click Published registrations in the navigation bar
    When they click Delete on an item
    And they see a confirmation pop-up asking to delete the Publication
    And they select Yes
    Then they see that the Publication is marked as deleted

  @967
  Scenario: User does not delete a published Publication
    Given that the user is logged in as Creator
    And they see the page My Publications
    And they click Published registrations in the navigation bar
    When they click Delete on an item
    And they se a confirmation pop-up asking to delete the Publication
    And they select No
    Then they see that the pop-up is closed

  @1071
  Scenario: User sees a published Publication with delayed publishing
    Given Creator publishes Publication
    And the Publication has a date for delayed publishing in the future
    When they see the File box
    Then they see that the file can't be downloaded
    And they see the delayed publishing date

  @1409
  Scenario Outline: Creator selects Publication in Journal and Peer Review Details are hidden
    Given that a Creator navigates to the Resource Type tab
    And they select type Publication in Journal
    When they select <Subtype>
    Then they see that the Peer Review Details are hidden
    Examples:
      | Subtype              |
      | Short communication  |
      | Leader               |
      | Letter to the editor |
      | Review               |