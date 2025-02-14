Feature: Claim ownership of Publication Channels

  Scenario: List Publication Channel owned by institution
    Given a User with the Editor role
    When they navigate to the Institution settings page
    Then they see a list of Publication Channels owned by the institution per type:
      | Publisher |
      | Series    |
      | Journal   |

  Scenario: Claim ownership of an unclaimed Publication Channel
    Given a User with the Editor role
    When they navigate to the Institution settings page
    And they find and select a Publication Channel to claim of type:
      | Publisher |
      | Series    |
      | Journal   |
    And the selected Publication Channel is not claimed by an Institution already
    Then the Instutution is set as the owner of the Publication Channel

  Scenario: Claim ownership of a channel that is claimed by a different or the current Institution
    Given a User with the Editor role
    When they navigate to the Institution settings page
    And they find and select a Publication Channel to claim of type:
      | Publisher |
      | Series    |
      | Journal   |
    And the selected Publication Channel is claimed by:
      | the Institution of the User |
      | a different Institution     |
    Then the User is informed that it is not possible to claim the Publication Channel
    And they are informed which Institution that owns the Publication Channel