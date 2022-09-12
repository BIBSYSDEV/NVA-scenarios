Feature: Creator navigates to Files and License tab

  @TEST_NP-3998
  @test
  @275
  Scenario: Creator navigates to Files and License tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Files and License tab
    Then they see the File upload widget
    And they see an Input Field for Linked Resources
    And they have the option to mark that the Resource has no File or Linked Resource
    And they see the tab Description is clickable
    And they see the tab Resource Type is clickable
    And they see the tab Contributors is clickable
    And they see the tab Files and License is selected
    And they see Previous is enabled
    And they see Next is enabled
    And they see Save is enabled

  @TEST_NP-3999
  @2634
  Scenario Outline: Creator looks up a valid Link as a Linked Resource
    Given Creator navigates to Files and License tab
    When they enter "<Link>" in the Linked Resource field
    And they click the Add Link Button
    Then the Link is listed under Linked Resources
    And they see that the URL is "<URL>"
    And they see a Button to remove the Link
    Examples:
      | Link                                      |
      | https://github.com/BIBSYSDEV/NVA-Frontend |
      | https://www.nrk.no/                       |

  Scenario: Creator marks that a Resource has no File or Linked Resource
    Given Creator navigates to Files and License tab
    When they wish to mark that a Resource have no File or Linked Resource
    Then they see a warning message that the Resource will have no File or Linked Resource
    And they see they can cancel marking the Resource
    And they see they can confirm marking the Resource

  @TEST_NP-3997
  @2636
  Scenario Outline: Creator looks up an invalid Link as Linked Resource
    Given Creator navigates to Files and License tab
    When they enter "<Link>" in the Linked Resource field
    And they click the Add Link Button
    Then they see an error message that the Link could not be added

    Examples:
      | Link                       |
      | https://github.com/xxx/yyy |

  @TEST_NP-13016
  @test
  Scenario: Creator adds a file
    Given Creator navigates to Files and License tab
    When they add a file to the File upload widget
    Then they can see the file in the list of files

  @TEST_NP-12277
  @test
  Scenario: Creator deletes a file
    Given Creator open a Registration with a file
    And navigates to Files and License tab
    When they delete a file
    Then they no longer see the file in the list of files
