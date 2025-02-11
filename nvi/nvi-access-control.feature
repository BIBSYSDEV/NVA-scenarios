# Copied from https://sikt.atlassian.net/wiki/spaces/NVAP/pages/3323461700/Access+control
Feature: Access control
  Scenario: NVI curator can access their own candidates
    Given a logged in user
    And the user is part of an NVI institution
    And the user have access right(s) to handle NVI candidates
    And the user has a area of responsibility*
    Then the user should only access candidates with at least one verified contributor affiliated to the users area of responsibitily