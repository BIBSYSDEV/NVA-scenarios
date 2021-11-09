Feature: Creator navigates to Contributors tab

  @test
  @417
  Scenario: Creator navigates to Contributors tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Contributors tab
    Then they see the tab Description is clickable
    And they see the tab Resource Type is clickable
    And they see the tab Contributors is selected
    And they see the tab Files and License is clickable
    And they see Previous is enabled
    And they see Next is enabled
    And they see Save is enabled

  Scenario Outline: Creator see buttons to add Contributors
    Given Creator navigates to Contributors tab
    When the Registration has Registration Type "<RegistrationType>"
    And the Registration has Registration Subtype "<RegistrationSubtype>"
    Then they see buttons "<AddContributorButtons>"
    Examples:
      | RegistrationType | RegistrationSubtype | AddContributorButtons                       |
      | Book             | BookAnthology       | Add Editor, Add Contributor                 |
      | Book             | BookMonograph       | Add Author, Add Contributor                 |
      | Chapter          | ChapterArticle      | Add Author, Add Contributor                 |
      | Degree           | DegreeBachelor      | Add Author, Add Supervisor, Add Contributor |
      | Degree           | DegreeMaster        | Add Author, Add Supervisor, Add Contributor |
      | Degree           | DegreePhd           | Add Author, Add Supervisor, Add Contributor |
      | Degree           | OtherStudentWork    | Add Author, Add Supervisor, Add Contributor |
      | Journal          | FeatureArticle      | Add Author, Add Contributor                 |
      | Journal          | JournalArticle      | Add Author, Add Contributor                 |
      | Journal          | JournalCorrigendum  | Add Author, Add Contributor                 |
      | Journal          | JournalLeader       | Add Author, Add Contributor                 |
      | Journal          | JournalLetter       | Add Author, Add Contributor                 |
      | Journal          | JournalReview       | Add Author, Add Contributor                 |
      | Report           | ReportBasic         | Add Author, Add Contributor                 |
      | Report           | ReportPolicy        | Add Author, Add Contributor                 |
      | Report           | ReportResearch      | Add Author, Add Contributor                 |
      | Report           | ReportWorkingPaper  | Add Author, Add Contributor                 |
      | Artistic         | ArtisticDesign      | Add Contributor                             |

  @test
  @1837
  Scenario: Creator adds themselves to the list of Authors
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Contributors tab
    And they see the "Add Author" Button
    And they click "Add Author"
    And they see the Author Search Dialog
    And they click "Add me as Author"
    Then their Author identity is added to the list of Authors
    And their current Affiliations are listed

  @test
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
    And their current Affiliations are listed

  @test
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
    And their current Affiliations are listed

  @test
  Scenario: Creator adds an Author to the list of Authors for Resource Type Chapter
    Given Creator begins registering a Registration in the Wizard
    And they navigate to the Resources tab
    And they select the Resource Type
      | Part of book/report |
    And they select the Registration Subtype "Chapter in anthology"
    When they navigate to the Contributors tab
    And they see the "Add Author" Button
    And they click "Add Author"
    And they search for Author in the Author Search Dialog
    And they select an Author identity
    And they click "Add"
    Then the selected Author identity is added to the list of Authors
    And their current Affiliations are listed

  @test
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
    And their current Affiliations are listed

  @test
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
    And their current Affiliations are listed

  @test
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

  Scenario: Creator sees Button to Verify Contributor
    Given Creator navigates to Contributors tab
    When the Registration has an Unverified Contributor
    Then they see a Button to Verify the Contributor

  Scenario: Creator opens Dialog to Verify Contributor
    Given Creator sees Button to Verify Contributor
    When they click the Button to Verify Contributor
    Then they see the Verify Contributor Dialog
    And they see a search field prefilled with the selected Contributor's name
    And they see a list of Persons matching the search

  @2467
  Scenario: Creator verifies Contributor
    Given Creator opens Dialog to Verify Contributor
    When they select a Person from the Search Results
    And they click the Button to Verify Contributor
    Then the Dialog is closed
    And they see the Contributor is now verified
    And all current Affiliations are listed for the Contributor
