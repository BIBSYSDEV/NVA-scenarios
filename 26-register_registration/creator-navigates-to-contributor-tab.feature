Feature: Creator navigates to Contributors tab

  @417
  Scenario: Creator navigates to Contributors tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Contributors tab
    Then they see "Add Author" Button is enabled
    And they see the tab Description is clickable
    And they see the tab Resource Type is clickable
    And they see the tab Contributors is selected
    And they see the tab Files and License is clickable
    And they see Previous is enabled
    And they see Next is enabled
    And they see Save is enabled

  @1837
  Scenario: Creator adds themselves to the list of Authors
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Contributors tab
    And they see the "Add Author" Button
    And they click "Add Author"
    And they see the Author Search Dialog
    And they click "Add me as Author"
    Then their Author identity is added to the list of Authors

  @419
  Scenario: Creator adds an Author to the list of Authors
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Contributors tab
    And they see the "Add Author" Button
    And they click "Add Author"
    And they search for Author in the Author Search Dialog
    And they select an Author identity
    And they click "Add"
    Then the selected Author identity is added to the list of Authors

  Scenario: Creator adds an Author to the list of Authors for Resource Type Book, Monograph
    Given Creator begins registering a Registration in the Wizard
    And they navigate to the Resources tab
    And they select Resource Type "Book"
    And they select Registration Subtype "Monograph"
    When they navigate to the Contributors tab
    And they see the "Add Author" Button
    And they click "Add Author"
    And they search for Author in the Author Search Dialog
    And they select an Author identity
    And they click "Add"
    Then the selected Author identity is added to the list of Authors

  Scenario: Creator adds an Author to the list of Authors for Resource Type Chapter
    Given Creator begins registering a Registration in the Wizard
    And they navigate to the Resources tab
    And they select the Resource Type "Part of book / report"
    And they select the Registration Subtype "Chapter in anthology"
    When they navigate to the Contributors tab
    And they see the "Add Author" Button
    And they click "Add Author"
    And they search for Author in the Author Search Dialog
    And they select an Author identity
    And they click "Add"
    Then the selected Author identity is added to the list of Authors

  @2203
  Scenario: Creator adds an Editor to the list of Editors for Resource Type Book, Anthology
    Given Creator begins registering a Registration in the Wizard
    And they navigate to the Resources tab
    And they select Resource Type "Book"
    And they select Registration Subtype "Anthology"
    When they navigate to the Contributors tab
    And they see the "Add Editor" Button
    And they click "Add Editor"
    And they search for Editor in the Author Search Dialog
    And they select an Author identity
    And they click "Add"
    Then the selected Author identity is added to the list of Editors

  @2204
  Scenario: Creator adds a Supervisor to the list of Supervisors for Resource Type Student Thesis
    Given Creator begins registering a Registration in the Wizard
    And they navigate to the Resources tab
    And they select Resource Type "Student Thesis"
    And they select any Registration Subtype
    When they navigate to the Contributors tab
    And they see the "Add Author" Button
    And they see the "Add Supervisor" Button
    And they click "Add Supervisor"
    And they search for Supervisor in the Author Search Dialog
    And they select an Author identity
    And they click "Add"
    Then the selected Author identity is added to the list of Supervisors

  @788
  Scenario: Creator creates a new Author in the Author dialog
    Given Creator begins registering a Registration in the Wizard
    And they navigate to the Contributors tab
    And they see the "Add Author" Button
    And they click "Add Author"
    And they see the "Create new Author" Button
    When they click "Create new Author"
    Then they see fields:
      | First name |
      | Last name  |
    And they see the "Create new Author" Button in the Create new Author Dialog

  # WIP:
  Scenario: Creator decide to add a Contributor to a Registration
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Contributors tab
    And they see the "Add Contributor" button
    And they click "Add Contributor"
    Then they see a "Add Contributor" page
    And they see a dropdown to select type of Contributor
    And they see a search box

  Scenario: Creator search for a Contributor
    Given Creator decide to add a Contributor to a Registration
    When they select a Contributor type in the dropdown
    And they type in a search term in the search box
    Then they see a list matching the search term
    And they see a text with number of hits and the search term
    And thay see a result table with headings
    And they see a radio button
    And they see the name of the author
    And they see an example of a publication by the author
    And they see the authors primary institution
    And they see a "Close" button
    And they see a "Create new author" button
    And they see a "Add me as author" button
    And they see a "Add" button

  Scenario: Creator adds a Contributor to a Registration
    Given Creator search for a Contributor
    When they have selected an author from the search result
    And they have clicked the "Add" button
    Then they see the Contributor tab
    And the selected author is displayed with selected contributor type
    And they see the "Add contributor" button

# Det som mangler her er å få med kva typer contributorer som er valgbare, alt etter kva type ressurs som blir registrert
# Dette står i tabellen og teksten som ligger under skissene i figma.