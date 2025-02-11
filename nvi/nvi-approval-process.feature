# Copied from https://sikt.atlassian.net/wiki/spaces/NVAP/pages/3322904645/NVI+Approval+process
Feature: NVI approval process

  Scenario: NVI curator approves Candidate
    Given a logged in user
    And the user is part of an NVI institution
    And the user have access right(s) to handle NVI candidates
    And the user has selected a specific NVI candidate
    Then the user can approve the NVA candidate on behalf of his/hers institution

  Scenario: NVI curator rejects Candidate
    Given a logged in user
    And the user is part of an NVI institution
    And the user have access right(s) to handle NVI candidates
    And the user has selected a specific NVI candidate
    Then the user can reject the NVA candidate on behalf of his/hers institution with a rejection note

  Scenario: NVI curator resets approval status
    Given a logged in curator with access right(s) to handle NVI candidates
    And views an approved NVI candidate in an active NVI periode
    When the approval is removed
    Then the approval status is set back to Pending

  Scenario: NVI curator resets rejection status with note
    Given a logged in curator with access right(s) to handle NVI candidates
    And views an rejected NVI candidate in an active NVI periode
    When the rejection is removed
    Then the approval status is set back to Pending
    And the rejection note that followed the rejection is removed

  # *candidate-affecting fields are changed:
  # level, publication type (category), creators with affiliations, points and year
  Scenario: Reset NVI Candidate on change
    Given an NVI candidate
    When one or more of the candidate-affecting fields are changed
    And the NVI candidate is still a candidate
    Then reset the approval status for all involved institutions for the NVI candidate.
    And the points should be updated according to the new factors.

  Scenario: NVI curator adds note to Candidate
    Given a logged in user
    And the user is part of an NVI institution
    And the user have access right(s) to handle NVI candidates
    And the user has selected a specific NVI candidate
    Then the user can add a note to the candidate
    And the note is visible for all nvi-curators with access right to view the candidate

  Scenario: Mark disputes
    Given a nvi candidate
    When the candidate has more than one approval
    And at least two institutions disagree on whether the candidate should be approved or rejected (one approved approval and one rejected approval)
    Then the candidate has global approval status “Dispute”