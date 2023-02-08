Feature: Creator navigates to Contributors tab

  @TEST_NP-4003
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

  @TEST_NP-4002
  @test
  Scenario Outline: Creator see buttons to add Contributors
    Given Creator navigates to Contributors tab
    When the Registration has Registration Type "<RegistrationType>"
    Then they see buttons "<AddContributorButtons>"
    Examples:
      | RegistrationType              | AddContributorButtons                       |
      | BookAnthology                 | Add Editor, Add Contributor                 |
      | AcademicMonograph             | Add Author, Add Contributor                 |
      | NonFictionMonograph           | Add Author, Add Contributor                 |
      | PopularScienceMonograph       | Add Author, Add Contributor                 |
      | Textbook                      | Add Author, Add Contributor                 |
      | Encyclopedia                  | Add Author, Add Contributor                 |
      | ExhibitionCatalog             | Add Author, Add Contributor                 |
      | AcademicChapter               | Add Author, Add Contributor                 |
      | NonFictionChapter             | Add Author, Add Contributor                 |
      | PopularScienceChapter         | Add Author, Add Contributor                 |
      | TextbookChapter               | Add Author, Add Contributor                 |
      | EncyclopediaChapter           | Add Author, Add Contributor                 |
      | Introduction                  | Add Author, Add Contributor                 |
      | ExhibitionCatalogChapter      | Add Author, Add Contributor                 |
      | ChapterInReport               | Add Author, Add Contributor                 |
      | ChapterConferenceAbstract     | Add Author, Add Contributor                 |
      | DegreeBachelor                | Add Author, Add Supervisor, Add Contributor |
      | DegreeMaster                  | Add Author, Add Supervisor, Add Contributor |
      | DegreePhd                     | Add Author, Add Supervisor, Add Contributor |
      | DegreeLicentiate              | Add Author, Add Supervisor, Add Contributor |
      | OtherStudentWork              | Add Author, Add Supervisor, Add Contributor |
      | AcademicArticle               | Add Author, Add Contributor                 |
      | AcademicLiteratureReview      | Add Author, Add Contributor                 |
      | JournalLetter                 | Add Author, Add Contributor                 |
      | JournalReview                 | Add Author, Add Contributor                 |
      | JournalLeader                 | Add Author, Add Contributor                 |
      | JournalCorrigendum            | Add Author, Add Contributor                 |
      | JournalIssue                  | Add Author, Add Contributor                 |
      | ConferenceAbstract            | Add Author, Add Contributor                 |
      | CaseReport                    | Add Author, Add Contributor                 |
      | StudyProtocol                 | Add Author, Add Contributor                 |
      | ProfessionalArticle           | Add Author, Add Contributor                 |
      | PopularScienceArticle         | Add Author, Add Contributor                 |
      | ReportBasic                   | Add Author, Add Contributor                 |
      | ReportPolicy                  | Add Author, Add Contributor                 |
      | ReportResearch                | Add Author, Add Contributor                 |
      | ReportAbstractCollection      | Add Author, Add Contributor                 |
      | ReportWorkingPaper            | Add Author, Add Contributor                 |
      | ConferenceLecture             | Add Author, Add Contributor                 |
      | ConferencePoster              | Add Author, Add Contributor                 |
      | Lecture                       | Add Author, Add Contributor                 |
      | OtherPresentation             | Add Author, Add Contributor                 |
      | ArtisticDesign                | Add Contributor                             |
      | Architecture                  | Add Contributor                             |
      | PerformingArts                | Add Contributor                             |
      | MovingPicture                 | Add Contributor                             |
      | MusicPerformance              | Add Contributor                             |
      | LiteraryArts                  | Add Contributor                             |
      | VisualArts                    | Add Contributor                             |
      | MediaFeatureArticle           | Add Author, Add Contributor                 |
      | MediaReaderOpinion            | Add Author, Add Contributor                 |
      | MediaInterview                | Add Contributor                             |
      | MediaBlogPost                 | Add Author, Add Contributor                 |
      | MediaPodcast                  | Add Contributor                             |
      | MediaParticipationInRadioOrTv | Add Contributor                             |
      | DataManagementPlan            | Add Author, Add Contributor                 |
      | Dataset                       | Add Contributor                             |
      | Map                           | Add Contributor                             |

  @TEST_NP-4005
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

  @TEST_NP-4000
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

  @TEST_NP-4007
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

  @TEST_NP-4010
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

  @TEST_NP-4004
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

  @TEST_NP-4011
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

  @TEST_NP-4006
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

  @TEST_NP-4001
  @test
  Scenario: Creator sees Button to Verify Contributor
    Given Creator navigates to Contributors tab
    When the Registration has an Unverified Contributor
    Then they see a Button to Verify the Contributor

  @TEST_NP-4008
  @test
  Scenario: Creator opens Dialog to Verify Contributor
    Given Creator sees Button to Verify Contributor
    When they click the Button to Verify Contributor
    Then they see the Verify Contributor Dialog
    And they see a search field prefilled with the selected Contributor's name
    And they see a list of Persons matching the search

  @TEST_NP-4009
  @2467
  @test
  Scenario: Creator verifies Contributor
    Given Creator opens Dialog to Verify Contributor
    When they select a Person from the Search Results
    And they click the Button to Verify Contributor
    Then the Dialog is closed
    And they see the Contributor is now verified
    And all current Affiliations are listed for the Contributor
