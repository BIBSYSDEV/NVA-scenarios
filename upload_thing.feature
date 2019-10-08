# encoding: utf-8
# language: en

Feature: A publisher adds a file and metadata

  Scenario: A user adds a file
    Given that the user is logged in and has the role publisher
    When they click Add resource
    And add the file for upload
    And click Upload
    And fill in metadata for the thing regarding
      | creator(s)           |
      | title                |
      | date of publication  |
    And they select CC-BY license
    And clicks on the checkbox for resource publication
    And click Publish
    Then they receive see the generated resource page containing information about
      | owner             |
      | owner institution |
      | file location     |
      | file checksum     |
      | Handle id         |
      | metadata summary  |
