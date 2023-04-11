Feature: My Registrations

    @test
    Scenario: Creator opens My Registrations
        Given the user is logged in as Creator
        When they navigate to My Page
        And they navigate to Registrations
        Then they see a list of all unpublished Registrations with the fields
            | Title   |
            | Status  |
            | Created |
        And they see each list item has an option to Delete or Edit
        And they have an option to show published registrations
        And they see items with Status
            | Draft    |
            | Rejected |

    @test
    Scenario: Creator opens an item in My Registrations list
        Given that the user is logged in as Creator
        And they have navigated to Registrations in My page
        When they Edit an item
        Then they see the item is opened in the Wizard
        And they see the Description tab

  @test
    Scenario: Creator sees Validation Errors for Registration
        Given Creator navigate to My Page and select Registrations
        When they Edit a Registration with Validation Errors
        And they see the Registration is opened in Edit Mode
        And they see the Registration has Validation Errors
        Then they see that tabs with Validation Errors are marked as having errors

    @test
    Scenario: Creator wants to delete a Registration
        Given Creator navigate to My Page and select Registrations
        When they make the choice to Delete an item
        Then they are given a choice to confirm deleting the item

    @test
    Scenario: Creator deletes an item in My Registrations list
        Given Creator navigate to My Page and select Registrations
        And they make the choice to Delete an item
        When they confirm deleting the item
        Then they get a confirmation message that the item is deleted
        And they see that the Registration is deleted

    @test
    Scenario: Creator cancels deletion of an item in My Registrations list
        Given Creator navigate to My Page and select Registrations
        When they make the choice to Delete an item
        And they cancel deleting the item
        Then they see the Registration in the Registrations list

    Scenario: User sees published Registrations
        Given Creator navigate to My Page and select Registrations
        When they selecet Published Registrations
        Then they see a list of all published Registrations with the fields
            | Title   |
            | Status  |
            | Created |
        And they see list items with Status
            | Deleted   |
            | Published |
        And they see each list item has buttons
            | Show   |
            | Edit   |
            | Delete |
        And they see the Edit option is enabled
        And the Delete option is enabled for Registrations not marked as Deleted
        And they have an option to see Unpublished Registrations

    Scenario: User deletes a published Registration
        Given Creator navigate to My Page and select Registrations
        And they selecet Published Registrations
        When they make the choice to Delete an item
        And they confirm deleting the item
        Then they get a confirmation message that the item is marked as deleted
        And they see that the Registration is marked as deleted
      
    Scenario: User does not delete a published Registration
        Given Creator navigate to My Page and select Registrations
        And they see the list of published Registrations
        When they make the choice to Delete an item
        And they cancel deleting the item
        Then they see ther Registration is not marked as deleted