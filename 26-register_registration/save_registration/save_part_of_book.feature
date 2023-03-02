Feature: Save registration for Part of book
    @test
    Scenario Outline: Creator sees registration is saved with correct values presented on landing page for Part of book
        Given Author begins registering a Registration
        And selects "<Subtype>"
        And fill in values for all fields
        When they saves Registration
        Then they can see the values on the Registration Landing Page
        And they can see the values in the Registration Wizard

        Examples:
            | Subtype                   |
            | AcademicChapter           |
            | NonFictionChapter         |
            | PopularScienceChapter     |
            | TextbookChapter           |
            | EncyclopediaChapter       |
            | Introduction              |
            | ExhibitionCatalogChapter  |
            | ChapterInReport           |
            | ChapterConferenceAbstract |
