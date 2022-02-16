Feature: Creator sees Registration is saved

    @TEST_NP-4031
    @test
    @388
    Scenario: Creator sees Registration based on a Link is saved
        Given Creator begins registering with a Link
        When they click Start
        And they click My Registrations
        Then they see the Registration is saved and the title is listed and marked as Draft
        And they see that Edit is enabled
        And they see that Delete is enabled

    @TEST_NP-4030
    @test
    @391
    Scenario: Creator sees Registration based on file upload is saved
        Given Creator begins registration by uploading a file
        When they click Start
        And they click My Registrations
        Then they see the Registration is saved and the title is "[Missing title]" and marked as Draft
        And they see that Edit is enabled
        And they see that Delete is enabled