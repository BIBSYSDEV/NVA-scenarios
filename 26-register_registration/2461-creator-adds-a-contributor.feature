Feature: Creator adds a Contributor

    Scenario Outline: Creator opens the Add Contributor Dialog
        Given Creator navigates to Contributors tab
        And the Registration has Registration Type "<RegistrationType>"
        And the Registration has Registration Subtype "<RegistrationType>"
        When they click "Add Contributor"
        Then they see the "Add Contributor" Dialog
        And they see a dropdown with Contributor Types "<ContributorTypes>"
        And they see a "Close" Button
        And they see a "Create new Contributor" Button
        And they see a "Add me as Contributor" Button
        And they see a disabled "Add" Button
        Examples:
            | RegistrationType | RegistrationSubtype       | ContributorTypes                                                                     |
            | Book             | BookAnthology             | Contact person, Related person, Researcher, Rights holder, Supervisor, Other         |
            | Book             | BookMonograph             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Chapter          | ChapterArticle            | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Degree           | DegreeBachelor            | Contact person, Editor, Related person, Researcher, Rights holder, Other             |
            | Degree           | DegreeMaster              | Contact person, Editor, Related person, Researcher, Rights holder, Other             |
            | Degree           | DegreePhd                 | Contact person, Editor, Related person, Researcher, Rights holder, Other             |
            | Degree           | OtherStudentWork          | Contact person, Editor, Related person, Researcher, Rights holder, Other             |
            | Journal          | FeatureArticle            | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Journal          | JournalArticle            | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Journal          | JournalCorrigendum        | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Journal          | JournalLeader             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Journal          | JournalLetter             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Journal          | JournalReview             | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Journal          | JournalShortCommunication | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Report           | ReportBasic               | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Report           | ReportPolicy              | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Report           | ReportResearch            | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |
            | Report           | ReportWorkingPaper        | Contact person, Editor, Related person, Researcher, Rights holder, Supervisor, Other |

    Scenario: Creator selects a Contributor Type
        Given Creator opens the Add Contributor Dialog
        When they select a Contributor Type
        Then they see a search field

    Scenario: Creator searches for a Contributor
        Given Creator selects a Contributor Type
        When they enter a search term
        Then they see a List of Contributors matching the search term
        And they see number of hits and the search term
        And they see Previous Publications by the Contributors
        And they see the Primary Institution for the Contributors

    Scenario: Creator selects a Contributor from search
        Given Creator searches for a Contributor
        When they click on a Contributor from the search result
        Then they see the "Add" Button is enabled

    Scenario: Creator adds a Contributor to the List of Contributors
        Given Creator selects a Contributor from search
        When they click the "Add" Button
        Then the Dialog is closed
        And the selected Contributor is added to the List of Contributors
