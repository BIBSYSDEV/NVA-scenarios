# encoding: utf-8
# language: en

Feature: A registrar adds a file and metadata

  Scenario: A registrar adds a publication using a link
    Given that the user is logged in and has the role registrar
    When they look up a link
    And they click "Next"
    And they verify the information for Description
    And they verify the information for Reference
    And they verify the information for Contributors
    And they verify the information for Files
    And they verify the information for Summary
    Then they see the splash-page for the successfully registered publication

  Scenario: A registrar looks up a link
    Given that the user is logged in and has the role registrar
    And they are on the landing page for logged in users
    When they click "Link to publication"
    And they enter a valid link to a resource of kind
      | DOI    |
      | Handle |
    And they click search
    Then they see that the display updates
    And they see that the breadcrumb information is Home > Workspace > New publication
    And contains metadata about the resource title
    And the "Next" button is enabled

  Scenario: A registrar verifies the information for Description
    Given that the user is logged in and has the role registrar
    And they have looked up a link
    When they click "Next"
    Then they see that the "Description" Tab is in focus
    And they see that the breadcrumb information is Home > Workspace > New publication
    And they verify information for
      | Title                    |
      | Alternative Title        |
      | Summary                  |
      | Alternative Summary      |
      | Description              |
      | NPI Type                 |
      | Keywords                 |
      | Publication Date or Year |
      | Language                 |
      | Project                  |
      | Grant ID                 |
      | Funding Body             |
    And they see that the "Next" button is enabled

  Scenario: A user verifies information for Title
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Title field
    Then they see information for Title
    And the text of Title is in the same as the language specified in the document Language metadata field

  Scenario: A user verifies information for an Alternative Title
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Alternative Title field
    Then they see information for Alternative Title
    And the text of the title is in German
    And German is selected in the Alternative Title language field

  Scenario: A user verifies information for Summary
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Summary field
    Then they see information for Summary
    And the text of Summary is in the same as the language specified in the document Language metadata field

  Scenario: A user verifies information for an Alternative Summary
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Alternative Summary field
    Then they see information for Alternative Summary
    And the text of the Alternative Summary is in German
    And German is selected in the Alternative Summary language field

  Scenario: A user verifies information for Description
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Description field
    Then they see information for Description

  Scenario: A user verifies information for NPI Type
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the NPI Type field
    Then they see information for NPI Type
    And the value is one of
      | Something      |
      | Something else |

  Scenario: A user verifies information for Keywords
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Keywords field
    Then they see a comma-separated list of keywords

  Scenario: A user verifies information for Publication Date or Year
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Publication Date or Year field
    Then they see a value for Publication Date or Year that corresponds to
      | yyyy       |
      | yyyy-MM-dd |

  Scenario: A user verifies information for Language
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Language field
    Then they see a value for Language is selected in the dropdown

  Scenario: A user verifies information for Project
    Given that the user is logged in and has the role registrar
    And they are on the description page for a looked-up link
    When they view information in the Project field
    Then they see a value for Project is selected in the dropdown
    And the field for Grant ID is populated
    And the field for Funding body is populated

  Scenario: A user verifies the information for Reference for a Journal article
    Given that the user is logged in and has the role registrar
    When they are on the Reference page for a looked-up link
    Then they see that the Resource Type tab is selected
    And they see that the breadcrumb information is Home > Workspace > New publication
    And they see that Journal article is selected for resource type
    And that the correct information is present for
      | Link                           |
      | Journal title                  |
      | Journal ISSN                   |
      | Journal e-ISSN                 |
      | Norwegian Journal Ranking data |
      | Journal Publisher              |
      | Journal Volume                 |
      | Journal Issue                  |
      | Page from                      |
      | Page to                        |
      | Article number                 |
      | Peer-review data               |
    And that the Next button is enabled

  Scenario: A user verifies information for link
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up a
      | DOI    |
      | Handle |
    When they view the information for the link
    Then they see that the link is properly formatted
    And that the link refers to the item they looked up

  Scenario: A user verifies information for a Journal title:
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view the Journal title
    Then they see that the data is a sentence-case string
    And it does not contain non-title information or special characters
    And that the string corresponds to the journal in which the article was published

  Scenario: A user verifies information for a Journal ISSN:
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view the Journal ISSN
    Then they see a string matching /\d{4}-\d{4}/
    And this string corresponds to the ISSN for the Journal

  Scenario: A user verifies information for a Journal e-ISSN:
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view the Journal e-ISSN
    Then they see a string matching /\d{4}-\d{4}/
    And this string corresponds to the e-ISSN for the Journal

  Scenario: A user verifies information for Norwegian Journal Ranking data
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view the Norwegian Journal Ranking data
    Then they see a string matching /(Level|Nivå) \d{1}/
    And this string accurately represents the Norwegian Journal Ranking data for the Journal

  Scenario: A user verifies information for Publisher for a Journal article
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view Publisher
    Then they see a string
    And this string corresponds to the publisher of the Journal

  Scenario: A user verifies information for Volume for a Journal article
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view Volume
    Then they see a string matching /\d+/
    And this string corresponds to the Volume of the Journal in which the article was published

  Scenario: A user verifies information for Issue for a Journal article
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view Issue
    Then they see a string matching /\d+/
    And this string corresponds to the Issue of the Journal in which the article was published

  Scenario: A user verifies information for Page From for a Journal article
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view Page From
    Then they see a string matching /\d+/
    And this string corresponds to the Page From of the Journal in which the article was published

  Scenario: A user verifies information for Page To for a Journal article
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view Page To
    Then they see a string matching /\d+/
    And this string corresponds to the Page To of the Journal in which the article was published

  Scenario: A user verifies information for Article Number for a Journal article
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view Article Number
    Then they see a string
    And this string corresponds to the Article Number of the article

  Scenario: A user verifies information for Peer-Review Data for a Journal article
    Given that the user is logged in and has the role registrar
    And they are on the Reference page for a looked-up link for a journal article
    When they view Peer-Review Data
    Then they see that the radio button is selected for (Peer-reviewed|Not peer-reviewed)
    And that this corresponds to the expected value for the Journal article

  Scenario: A user verifies the information for Contributors for a Journal article
    Given that the user is logged in and has the role registrar
    When they are on the Contributor page for a looked-up link
    Then they see that the Contributors tab is selected
    And they see that the breadcrumb information is Home > Workspace > New publication
    And they see a list of Author Contributors
    And they see a list of Non-Author Contributors
    And they verify that the Author Contributors are in the correct order
    And they verify that the correct Author Contributor is marked as the Corresponding Author
    And they verify that each Author Contributor has the correct information
    And they verify that Non-Author Contributors have the correct information
    And they see that the Next button is enabled

  Scenario: A user verifies the information for an Author Contributor
    Given that the user is logged in and has the role registrar
    And they are on the Contributor page for a looked-up link
    When they look at an Author Contributor
    Then they see that the Author has a name represented in the format First name, Middle name(s), Last name(s)
    And they see that the Author is Verified
    And that the Author's Affiliation is correct for the looked up link
    And they see that the Author is either Corresponding Author or not
    And they see that they Author's ORCID is present if they have one
    And they see that their placement in the Contributors list is correct

  Scenario: A user verifies the information for a Non-Author Contributor
    Given that the user is logged in and has the role registrar
    And they are on the Contributor page for a looked-up link
    When they look at a Non-Author Contributor
    Then they see that the Non-Author Contributor has a name represented in the format First name, Middle name(s), Last name(s)
    And they see that the Non-Author-Contributor role is specified
    And that the Author's Affiliation is correct for the looked up link

  Scenario: A user verifies the information for Files and Licenses for a Journal article
    Given that the user is logged in and has the role registrar
    When they are on the Files and Licenses page for a looked-up link
    Then they see that the Files and Licenses tab is selected
    And they see that the breadcrumb information is Home > Workspace > New publication
    And they verify the information for Open Access Status
    And they verify the information for Sherpa Romeo
    And they verify the information for Licensing
    And they verify the Uploaded File for the article
    And they see that the Next button is enabled

  Scenario: A user verifies the information for Open Access Status
    Given that the user is logged in and has the role registrar
    And they are on the Files and Licenses page for a looked-up link
    When they view information for Open Access Status
    Then they see that the Article is published in a Journal that has a Open Access Status
    And that this Open Access Status corresponds to the expected value

  Scenario: A user verifies the information for Sherpa Romeo
    Given that the user is logged in and has the role registrar
    And they are on the Files and Licenses page for a looked-up link
    When they view information for Sherpa Romeo
    Then what?
    And what?
    And isn't this the same as OA?

  Scenario: A user verifies the information for Licensing
    Given that the user is logged in and has the role registrar
    And they are on the Files and Licenses page for a looked-up link
    When they view information for Licensing
    Then they see that the Article is published with an Open License approved by the Corresponding Author's institution

  Scenario: A user verifies the information for a File
    Given that the user is logged in and has the role registrar
    And they are on the Files and Licenses page for a looked-up link
    When they view information for Uploaded file
    Then they see information for
      | File name   |
      | Upload date |
      | Version     |
      | Embargo     |
    And they see a preview of the file

  Scenario: A user verifies the information for Registration Summary for a Journal article
    Given that the user is logged in and has the role registrar
    When they are on the Summary page for a looked-up link
    Then they see that the Summary tab is selected
    And they see that the breadcrumb information is Home > Workspace > New publication
    And see information about
      | Type                    |
      | Title                   |
      | Contributors            |
      | Summary                 |
      | NPI academic discipline |
      | Year of publicatiion    |
      | Language                |
      | Project                 |
      | Reference               |
      | Files and licenses      |
    And they see that the Publish in NVA button is enabled

  Scenario: A user publishes a looked up Journal article in NVA
    Given that the user is logged in and has the role registrar
    And they are on the Summary page for a looked-up link
    When they click the Publish in NVA button
    Then they see a Splash page
    And they can select options for
      | Syncing with ORCID  |
      | DOI creation        |
      | Link to publication |



  Scenario: A registrar adds a file
    Given that the user is logged in and has the role registrar
    When they click New registration
    And add the file for upload
    And click Upload
    And fill in metadata for the thing regarding
      | creator(s)          |
      | title               |
      | date of publication |
    And they select CC-BY license
    And clicks on the checkbox for resource publication
    And click Publish
    Then they receive see the generated resource page containing information about
      | owner             |
      | owner institution |
      | file location     |
      | file checksum     |
      | Handle id         |
      | metadata summary  |
