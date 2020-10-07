Feature: Creator navigates to the Reference tab and selects Contribution to Journal

  @274
  Scenario: Creator navigates to the Reference tab and selects Contribution to Journal
    Given that the Creator opens their Publication and navigates to the Reference tab
    When they select Contribution to Journal as Reference Type
    And they see a dropdown of potential Reference Subtypes consisting of:
      | Journal article      |
      | Short communication  |
      | Letter to the Editor |
      | Book review          |
      | Editoral             |
      | Corrigendum          |
    And they see mandatory fields for:
      | Search-box for Journal |
    And they see optional fields for:
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |
    And they see a disabled field with DOI if the Publication has a DOI
    And they see a optional field for Peer-review if Journal article is selected as Reference Subtype
