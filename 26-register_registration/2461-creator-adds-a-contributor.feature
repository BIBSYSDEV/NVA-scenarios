Feature: Creator adds a Contributor

    @TEST_NP-3992
    @test
    Scenario Outline: Creator opens the Add Contributor Dialog
        Given Creator navigates to Contributors tab
        And the Registration has Registration Type "<RegistrationType>"
        When they click "Add Contributor"
        Then they see the "Add Contributor" Dialog
        And they see a dropdown with Contributor Types "<ContributorTypes>"
        And they see a "Close" Button
        And they see a "Create new Contributor" Button
        And they see a "Add me as Contributor" Button
        And they see a disabled "Add" Button
        Examples:
            | RegistrationType              | ContributorTypes                                                                                                                                                              |
            | BookAnthology                 | Contact person, Related person, Researcher, Rights holder, Supervisor, Other                                                                                                  |
            | AcademicMonograph             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | NonFictionMonograph           | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | PopularScienceMonograph       | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | Textbook                      | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | Encyclopedia                  | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ExhibitionCatalog             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | AcademicChapter               | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | NonFictionChapter             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | PopularScienceChapter         | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | TextbookChapter               | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | EncyclopediaChapter           | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | Introduction                  | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ExhibitionCatalogChapter      | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ChapterInReport               | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ChapterConferenceAbstract     | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | DegreeBachelor                | Contact person, Editor, Related person, Researcher, Rights holder, Other                                                                                                      |
            | DegreeMaster                  | Contact person, Editor, Related person, Researcher, Rights holder, Other                                                                                                      |
            | DegreePhd                     | Contact person, Editor, Related person, Researcher, Rights holder, Other                                                                                                      |
            | DegreeLicentiate              | Contact person, Editor, Related person, Researcher, Rights holder, Other                                                                                                      |
            | OtherStudentWork              | Contact person, Editor, Related person, Researcher, Rights holder, Other                                                                                                      |
            | AcademicArticle               | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | AcademicLiteratureReview      | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | JournalLetter                 | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | JournalReview                 | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | JournalLeader                 | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | JournalCorrigendum            | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | JournalIssue                  | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ConferenceAbstract            | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | CaseReport                    | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | StudyProtocol                 | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ProfessionalArticle           | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | PopularScienceArticle         | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ReportBasic                   | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ReportPolicy                  | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ReportResearch                | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ReportAbstractCollection      | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ReportWorkingPaper            | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ConferenceLecture             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ConferencePoster              | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | Lecture                       | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | OtherPresentation             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                                                          |
            | ArtisticDesign                | Designer, Curator/Organizer, Consultant, Other                                                                                                                                |
            | Architecture                  | Architect, Landscape architect, Interior architect, Architectural planner, Other                                                                                              |
            | PerformingArts                | Dancer, Actor, Choreographer, Director, Scenographer, Costume designer, Producer, Artistic director, Dramatist, Librettist, Dramaturge, Sound designer, Light designer, Other |
            | MovingPicture                 | Director, Screenwriter, Producer, Photographer, Production designer, Video editor, Sound design, VFX Supervisor, Other                                                        |
            | MusicPerformance              | Soloist, Conductor, Musician, Composer, Organizer, Writer, Other                                                                                                              |
            | LiteraryArts                  | Author, Translator, Editor, Other                                                                                                                                             |
            | VisualArts                    | Artist, Curator, Consultant, Other                                                                                                                                            |
            | MediaFeatureArticle           | Other                                                                                                                                                                         |
            | MediaReaderOpinion            | Other                                                                                                                                                                         |
            | MediaInterview                | Journalist, Interviewee, Other                                                                                                                                                |
            | MediaBlogPost                 | Other                                                                                                                                                                         |
            | MediaPodcast                  | Program host, Participant, Other                                                                                                                                              |
            | MediaParticipationInRadioOrTv | Program host, Participant, Other                                                                                                                                              |
            | DataManagementPlan            | Data collector, Data curator, Data manager, Distributor, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                 |
            | Dataset                       | Data collector, Data curator, Data manager, Distributor, Editor, Related person, Researcher, Rights holder, Supervisor, Other                                                 |
            | Map                           | Contact person, Rights holder, Other                                                                                                                                          |
            | ExhibitionProduction          | Contact person, Rights holder, Other                                                                                                                                          |

    @TEST_NP-3995
    @test
    Scenario: Creator selects a Contributor Type
        Given Creator opens the Add Contributor Dialog
        When they select a Contributor Type
        Then they see a search field

    @TEST_NP-3996
    @test
    Scenario: Creator searches for a Contributor
        Given Creator selects a Contributor Type
        When they enter a search term
        Then they see a List of Contributors matching the search term
        And they see number of hits and the search term
        And they see Previous Publications by the Contributors
        And they see the Primary Institution for the Contributors

    @TEST_NP-3991
    @test
    Scenario: Creator selects a Contributor from search
        Given Creator searches for a Contributor
        When they click on a Contributor from the search result
        Then they see the "Add" Button is enabled

    @TEST_NP-3994
    @test
    Scenario: Creator adds a Contributor to the List of Contributors
        Given Creator selects a Contributor from search
        When they click the "Add" Button
        Then the Dialog is closed
        And the selected Contributor is added to the List of Contributors
