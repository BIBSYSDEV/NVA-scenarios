Feature: DOI related scenarios moved from MVP feature

  @TEST_NP-4192
  @1248
  Scenario: Creator Saves a comment on a DOI request
    Given that the Creator Edits a comment on a DOI request
    When they Save the comment
    Then the comment is saved
    And they see a confirmation message
    And they can no longer edit the comment
  #Draft DOIs are not acknowledged by the resolving mechanisms (Handle-system)

  @TEST_NP-4200
  @1235
  @test
  Scenario: Owner navigates to the submission tab and publish a Registration with a drafted DOI
    Given that the Owner navigates to Submission tab
    And the Registration has status Draft
    And the Registration has a Draft DOI
    When the Owner clicks the publish button
    Then the Landing Page for Registration is displayed
    And the "Request a DOI" button is still named "DOI pending" and is disabled
    And the Landing Page for Registration lists the Draft DOI
    And the Draft DOI is still not a link
    And the DOI request is listed in the Owners work list
    And the DOI request is listed in the Curators work list

  @TEST_NP-4198
  @1244
  Scenario: A Curator declines a DOI request
    Given that a Curator enters a decline comment on a DOI request
    When they click Save
    Then the DOI request is marked as "Declined"
    And the request in the User's Worklist is updated to "Declined"
    And the request is removed from the Curator's Worklist
    And they see their Worklist

  @TEST_NP-4193
  @1251
  @test
  Scenario: Creator opens a Registration with a DOI request
    Given that the Creator Opens a DOI request entry from My Worklist
    When they click the Edit Registration button
    Then the Registration is opened in the Wizard on the first tab

  @TEST_NP-4199
  @1234
  @test
  Scenario: Owner drafts a DOI for an unpublished Registration
    Given that the Owner View Landing Page for Registration for unpublished Registration without DOI
    And they are the Owner of the Registration
    When they click the "Draft a DOI" button
    Then the Landing Page for Registration is displayed
    And the "Draft a DOI" button is renamed to "DOI pending" and is disabled
    And the Draft DOI is added to the metadata
    And the Landing Page for Registration contains the Draft DOI
    And the Draft DOI is not a link

  @TEST_NP-4195
  @1240
  Scenario: Creator deletes a DOI request
    Given that the Creator opens My Worklist
    When they click the Delete button on a DOI request
    Then the request is deleted from their Worklist
    And the request is deleted from the Worklist of their Curator
    And the Public Page for Publication has an enabled "Request DOI" button

  @TEST_NP-4194
  @1243
  Scenario: A Curator enter a decline-comment on a DOI request
    Given that a Curator opens an item in the Worklist
    And the item is a DOI request
    When they click Decline DOI
    Then they may enter a decline-comment

  @TEST_NP-4197
  @358
  @test
  Scenario: Curator opens a Registration from a DOI Request Worklist Item
    Given that a Curator views details of a Worklist item
    And the item is a DOI request
    When they click "Go to Registration"
    Then they see the Landing Page for Registration
    And they see the Create DOI button is enabled
    And they see the Decline DOI button is enabled

  @TEST_NP-4190
  @1247
  Scenario: Creator Edits a comment on a DOI request
    Given that the Creator Opens a DOI request entry from My Worklist
    And the request has status Requested
    When they click the Edit button on a DOI request
    Then they can edit the comment
    And they see a Save button

  @TEST_NP-4191
  @1233
  @test
  Scenario: Owner navigates to the Landing Page for Registration for unpublished Registration without DOI
    Given that the Owner view Landing Page for Registration
    And the Registration is not Published
    And the Registration has no DOI
    When they look at the Status Bar
    Then they see buttons for Draft a DOI and Edit Registration

  @TEST_NP-4189
  @1250
  Scenario: Creator closes a DOI request
    Given that the Creator Opens a DOI request entry from My Worklist
    When they click the Close button
    Then they see the Worklist

  @TEST_NP-4184
  @1232
  @test
  Scenario: Owner navigates to the Landing page and requests a DOI
    Given that the Creator navigates to the Landing page for published Registration without DOI
    And they are the Owner of the Registration
    And open "Request a DOI" dialog
    And optional add a message to the Curator
    When the user click the Send Button
    Then the Landing page is displayed
    And the "Request a DOI" button is no longer visible
    And the request is listed in My Messages
    And the request is listed in Curator Worklist
