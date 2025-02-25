# Copied from https://sikt.atlassian.net/browse/NP-48112
Feature: Reset NVI candidate approval status upon impactful changes

  Scenario: Making impactful changes to a publication
    Given a publication that is an NVI candidate
    When one or more of the candidate-affecting fields are changed, such as:
      | Adding or removing Authors                              |
      | Changing contributor role to/from Creator               |
      | Adding or removing top-level institutional affiliations |
      | Changing publication type/category                      |
    And the publication still meets NVI candidacy requirements
    Then the approval status for all included institutions for the NVI candidate should be reset

  Scenario: Modifying publication context for an nvi candidate
    Given a publication that is an NVI candidate
    When modifying the publication context, such as:
      | Adding/removing the journal                         |
      | Adding/removing the publisher                       |
      | Adding/removing the series                          |
      | Adding/removing the referenced book (for a chapter) |
    And the publication still meets NVI candidacy requirements
    Then the approval status for all included institutions for the NVI candidate should be reset

  Scenario: Making non-impactful changes to a publication
    Given a publication that is an NVI candidate
    When the following alterations are made:
      | Editing an author's name                                        |
      | Changing affiliations within the institution (e.g., department) |
      | Changing publication month or day                               |
      | Modifying information such as title, abstract, or page numbers  |
    Then these changes do not affect the approval status of the NVI candidate

  Scenario: Editing an author with an ID without changing affiliations
    Given a publication that is an NVI candidate with approval for Institution A
    When an author affiliated with Institution B is edited to include an ID (identified in Cristin)
    And the author's affiliations remain unchanged
    Then the approval status for Institution A remains unchanged