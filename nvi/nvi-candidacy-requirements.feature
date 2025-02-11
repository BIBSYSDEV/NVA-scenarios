Feature: Requirements for NVI candidacy

  # Glossary:
  # NVI: Norwegian Scientific Index
  # NVI Candidate: A publication that meets the criteria to be included in the NVI
  # Creator: A contributor with a significant role in the creation of the publication, i.e. author
  # NVI Customer: An institution or organization that is part of the NVI system
  # Active year: The current year in which the publication is being evaluated
  # Publication channel: The medium through which the publication is disseminated (e.g., journal, conference)
  # Scientific level: A rating that indicates the quality and impact of the publication channel
  # Identified contributor: Contributor that has a Cristin ID and is verified in Cristin


  # Copied from https://sikt.atlassian.net/browse/NP-44705
  Scenario Outline: A publication is identified as an NVI candidate
    Given a logged in user with sufficient access rights
    And login is associated with a customer that is an "NVI institution"
    And there is a publication where at least one identified contributor with role Creator is affiliated with the login context customer
    And the publication is of <Type>
    And the publication is published in the active year
    And the publication has at least one publication channel of type <Channel> that has a level of one or two
    When the user views the NVI candidates
    Then the user sees the publication

    Examples:
      | Type                     | Channel   |
      | AcademicArticle          | journal   |
      | AcademicChapter          | publisher |
      | AcademicChapter          | series    |
      | AcademicLiteratureReview | journal   |
      | AcademicMonograph        | publisher |
      | AcademicMonograph        | series    |

  # Copied from https://sikt.atlassian.net/browse/NP-45122
  Scenario: Detect new NVI Candidate
    Given a publication
    And all criteria for being an NVA candidate is fulfilled
    When the publication is published
    Then the publication become an NVI candidate for the corresponding NVA period.


  # Copied from https://sikt.atlassian.net/browse/NP-45115
  Scenario: Remove NVI Candidate on change
    Given an NVI candidate
    When one or more of the candidate-affecting fields are changed
    And the NVI candidate is no longer an NVI candidate
    Then remove the NVI candidate from the NVI candidate list.

  # Copied from https://sikt.atlassian.net/browse/NP-47998
  Scenario Outline:
    Given a publication of type Academic Commentary with at least one identified* contributor with role Creator is affiliated with a nvi customer*
    And the publication is published in the active year
    And the publication has at least one publication channel of type <Channel> that has a scientific level of one or two
    And the publication is not reported as a candidate in previous years
    Then the publication is identified as a NVI candidate

    Examples:
      | Channel   |
      | publisher |
      | series    |