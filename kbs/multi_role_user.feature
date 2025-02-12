Feature: Multi role user

  Scenario: Should see all KBS Projects where they have a role
    Given a user is Project Manager on a KBS Project
    And Local Project Manager on a second KBS Project
    And Project Participant on a third KBS Project
    When requesting their KBS Projects
    Then all KBS Projects where they have a role are provided