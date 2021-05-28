Feature: Creator navigates to Files and License tab

  @275
  Scenario: Creator navigates to Files and License tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Files and License tab
    Then they see the File upload widget
    And they see an Input Field for Linked Resources
    And they see the tab Description is clickable
    And they see the tab Resource Type is clickable
    And they see the tab Contributors is clickable
    And they see the tab Files and License is selected
    And they see Previous is enabled
    And they see Next is enabled
    And they see Save is enabled

  Scenario Outline: Creator looks up a valid Link as a Linked Resource
    Given Creator navigates to Files and License tab
    When they enter "<Link>" in the Linked Resource field
    And they click "Verify"
    Then they see that the Title is "<Title>"
    And they see that the Description is "<Description>"
    And they see that the Image is "<Image>"
    And they see that the URL is "<URL>"
    And they see that the Site Name is "<SiteName>"
    And they see an "Add" Button
    Examples:
      | Link                                      | Title                                                  | Description                                                                                                                                                                     | Image                                                                                                                      | URL                                       | SiteName |
      | https://github.com/BIBSYSDEV/NVA-Frontend | BIBSYSDEV/NVA-Frontend                                 | Web app for NVA. Contribute to BIBSYSDEV/NVA-Frontend development by creating an account on GitHub.                                                                             | https://opengraph.githubassets.com/9b8b6574086bddaac12ee7cbdde3aeea1bed7d3bbf93b5efe34ea14cb438fc5d/BIBSYSDEV/NVA-Frontend | https://github.com/BIBSYSDEV/NVA-Frontend | GitHub   |
      | https://www.nrk.no/                       | NRK.no – nyheter, tv og radio fra Norge og hele verden | NRK.no er Norges største tilbud på nett: nyheter fra Norge og verden, lokalnyheter, radio- og tv-program, podcast, vær, helse-, kultur-, underholdning-, humor- og debattstoff. | https://gfx.nrk.no/MypkihdsBkCYb-cXvwW8BgLqqp7OO7Fkyj8B_mXoY4Ew                                                            | https://www.nrk.no/                       | NRK      |

  Scenario: Creator adds a valid Link as a Linked Resource
    Given Creator looks up a valid Link as a Linked Resource
    When they click "Add"
    Then the Link is listed under Linked Resources
    And they see a Button to remove the Link

  Scenario Outline: Creator looks up an invalid Link as Linked Resource
    Given Creator navigates to Files and License tab
    When they enter "<Link>" in the Linked Resource field
    And they click "Verify"
    Then they see that the Link was not found
    Examples:
      | Link                       |
      | https://github.com/xxx/yyy |
