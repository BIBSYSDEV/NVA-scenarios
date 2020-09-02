@1424
Scenario: Administrator configures automatic Creator role
    Given that the User is logged in as Administrator
    And they are on the User Administration Page
    And they see a list of checkboxes in the Registrator section
    And they see each checkbox has corresponding <Option> text
    And they see that none of the checkboxes are selected
    When they select an <Option> 
    And they click the Save button
    Then matching <Category> are granted the Creator role upon login
    Examples: 
        | Option                             | Category                  |
        | Scientific employees               | member, employee, faculty |
        | Techincal administrative employees | member, employee, staff   |
