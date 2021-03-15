Feature: Creator begins registering a Registration

  @443
  Scenario Outline: Creator begins registering a Registration in the Wizard
    Given Creator begins registering a Registration
    And they have selected "<Method>" for starting the Wizard
    When they click Start
    Then they see the Wizard
    Examples:
      | Method               |
      | Link to registration |
      | Upload file          |

  @226
  Scenario: Creator begins registering a Registration
    Given that the user is logged in
    And they have Role Creator
    And they are on the Start page
    When they click the New Registration button
    Then they are redirected to the New Registration page
    And they see an Expansion panel for Upload file
    And they see an Expansion panel for Link to resource

  @385
  Scenario: Creator begins registration by uploading a file
    Given Creator begins registering a Registration
    When they click Upload file
    And they upload a file
    Then they see the file name
    And they see the file size
    And they see the Remove button
    And they see the Start button is enabled

  @228
  Scenario: Creator begins registering with a Link with direct data from Datacite/Crossref
    Given Creator begins registering a Registration
    And they expand the Expansion panel for Link to resource
    And they enter a DOI or a fully qualified DOI URL
    And they click Search
    Then they see metadata about the Link in the Expansion panel

  @439
  Scenario: Creator begins registering with a Link with data from Datacite/Crossref from citation_doi meta tag (DOI)
    Given Creator begins registering a Registration
    And they expand the Expansion panel for Link to resource
    And they enter https://dlr.unit.no/resources/66888570-3504-4d12-81a4-c3ffe0605945
    And they click Search
    Then they see metadata about the Link in the Expansion panel

  @440
  Scenario: Creator begins registering with a Link with data from dc:identifier meta tag
    Given Creator begins registering a Registration
    And they expand the Expansion panel for Link to resource
    And they enter https://loar.kb.dk/handle/1902/1674?show=full
    And they click Search
    Then they see metadata about the Link in the Expansion panel

  @441
  Scenario: Creator begins registering with a Link with data from DC and DCTERMS meta tags
    Given Creator begins registering a Registration
    And they expand the Expansion panel for Link to resource
    And they enter https://ntnuopen.ntnu.no/ntnu-xmlui/handle/11250/2638973
    And they click Search
    Then they see metadata about the Link in the Expansion panel

  @442
  Scenario: Creator begins registering with a Link with data from Open Graph tag
    Given Creator begins registering a Registration
    And they expand the Expansion panel for Link to resource
    And they enter https://www.nrk.no/norge/klimakur-2030_-mer-strom-og-mindre-kjott-kan-fa-norge-i-mal-1.14883788
    And they click Search
    Then they see metadata about the Link in the Expansion panel

  @2208
  Scenario: Creator begins registering with a Link with data from Highwire tag
    Given Creator begins registering a Registration
    And they expand the Expansion panel for Link to resource
    When they enter https://link.springer.com/article/10.1007/s13201-020-01350-9
    And click Search
    Then they see metadata about the Link in the Expansion panel

  @2370
  Scenario: Creator begins registering with a Link with data from LD+/JSON tag
    Given Creator begins registering a Registration
    And they expand the Expansion panel for Link to resource
    When they enter "https://e24.no/boers-og-finans/i/AdyrPM/syv-av-tangens-11-referanser-deltok-paa-luksusseminaret"
    And click Search
    Then they see metadata about the Link in the Expansion panel
