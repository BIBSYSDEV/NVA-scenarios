Feature: Creator begins registration by uploading a file

  @385
  Scenario: Creator begins registration by uploading a file
    Given Creator begins registering a Publication
    When they click Upload file
    And they upload a file
    Then they see the file name
    And they see the file size
    And they see the Remove button
    And they see Start is enabled