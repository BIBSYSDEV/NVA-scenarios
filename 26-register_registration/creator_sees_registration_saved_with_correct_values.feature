Feature: Creator sees registration is saved with correct values presented on landing page

@test
Scenario Outline: Creator sees registration is saved with correct values presented on landing page
  Given Author begins registering a Registration
  And selects "<Resource Type>" and "<Subtype>"
  And fill in values for all fields
  When they saves Registration
  Then they can see the values on the Registration Landing Page
  And they can see the values in the Registration Wizard

  Examples:
    | Resource Type | Subtype            |
    | Book          | BookMonograph      |
    | Book          | BookAnthology      |
    | Report        | ReportResearch     |
    | Report        | ReportPolicy       |
    | Report        | ReportWorkingPaper |
    | Report        | ReportBasic        |
    | Journal       | JournalArticle     |
    | Journal       | FeatureArticle     |
    | Journal       | JournalLetter      |
    | Journal       | JournalReview      |
    | Journal       | JournalLeader      |
    | Journal       | JournalCorrigendum |
    | Degree        | DegreeBachelor     |
    | Degree        | DegreeMaster       |
    | Degree        | DegreePhd          |
    | Degree        | OtherStudentWork   |
    | Chapter       | ChapterArticle     |
    | Event         | ConferenceLecture  |
    | Event         | ConferencePoster   |
    | Event         | Lecture            |
    | Event         | OtherPresentation  |
    | Artistic      | ArtisticDesign     |
