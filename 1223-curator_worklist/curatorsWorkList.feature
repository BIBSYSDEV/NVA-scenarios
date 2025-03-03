Background:
    Given a logged-in user with a curator role
    And the Curator opens Tasks

Scenario: Display of alert on Task menu item
	Given the curator has an alert
	When I see the Task menu item
	Then I should see two types of alerts: 
		| A bell symbol |
		| A number      |

Scenario: Display of a bell symbol on Task menu item
	When I see a bell symbol on the Task menu item
	Then I know there are tasks without an assigned curator

Scenario: Display of a number alert Task menu item
	When I see a number on the Task menu item
	Then I know how many tasks I am assigned as a curator
	And the status is "Pending"

Scenario Outline: Curator opens the task page
	Given a user with a curator role "<role>"
	When I navigate to the Task page
	Then I can see all my personal tasks
	And other tasks related to me
	Examples:
		| role                 |
		| File curator         | 
        | DOI curator          | 
        | User support curator | 
        | NVI curator          | 
        | Thesis curator       | 

Scenario Outline: Menu on Task page
        Given a user with a curator role <role>
	When I navigate to the Task page
	Then I should see a menu containing <options>
	And each option should be represented by a checkbox
	And each checkbox label should display the count of occurrences for that option
	Examples:
		| role                 | options                            |
		| File curator         | Publishing requests                |
		| Thesis curator       | Student thesis publishing requests |
		| DOI curator          | DOI requests                       |
		| User support curator | Curator support requests           |

Scenario: List of fields on Task page
	When I navigate to the Task page
	Then I should see the following fields:
		| field                |
		| Status               | 
		| Search               | 
		| Display options      | 
		| Task without curator | 
		| Curator              | 
		| Area of responibiliy | 
		| Start date           | 
		| End date             | 
		| Select category      | 
	And the status should be set to "Pending" by default
	And the display option should be "Show all"
	And "Task without curator" should be selected
	And the Curator field should be set to me
	And the area of responsibility should reflect my curator permissions

Scenario: Curator filters by request types
	When I change which menu options are activated 
	Then the coresponding tasks are displayed in the task list
	And each menu item should display a count in its label

Scenario: Curator sorts and navigates the task list
	When I view the task list
	Then I should see the number of tasks
	And the current ordering
	And an option to change the ordering 
	And I should see paging navigation options
	And the current page size
	And an option to change the page size 

Scenario: Curator inspects a task in the task page
	When I inspect a randomly selected task
	Then I should see the following fields describing the task: 
		| field                                       |
		| The color of the request type               | 
		| The icon of the registration type           | 
		| The name of the registration type           | 
		| The title of the registration               | 
		| The first authors of the registration       | 
		| A short note about the request (what to do) | 
		| Last note from the user requesting the task | 
		| The status of the registration              | 
		| The date of the registration                | 

Scenario: Curator selects a new Status on the Task page
	When I select a new Status
	Then I should see the corresponding tasks displayed according to other field values

Scenario: Curator performs a new search on the Task page
	When I execute a new search
	Then I should see the corresponding tasks displayed according to other field values

Scenario Outline: Curator selects new Display options on the Task page
	When I select a new Display option <option>
	Then I should see the corresponding tasks displayed according to other field values
	Examples:
	| option  |
	| read    |
	| unread  |

Scenario: Curator toggles "Task without curator" on Task page
	When I change the "Task without curator"
	Then I should see the corresponding tasks displayed according to other field values

Scenario: Curator selects a new Curator on the Task page
	When I selects a new Curator or none
	Then I should see the corresponding tasks displayed according to other field values

Scenario: Curator selects a new "Area of responibiliy" on the Task page
	When I have a non leaf-node area of responsibility
	Then I should see my "Area of responsibility"
	And I can change it to any lower level in my institution's hierarchy
	And all requests are made by users employed within the selected area of responsibility
	And all tasks displayed should match the other selected field values

Scenario: Curator is not allowed to change "Area of responsibility" on the task page
	When I have a leaf-node area of responsibility
	Then I should see my "Area of responsibility" as an informative text
	And all requests are made by users employed within my area of responsibility
	And all tasks displayed should match the other selected field values

Scenario: Curator selects a new Start date on the Task page
	When I selects a new Start date
	Then I should see tasks created after the selected start date
	And all tasks displayed should match the other selected field values

Scenario: Curator selects a new End date on Task page
	When I select a new End date
	Then I should see tasks created before the selected end date
	And all tasks displayed should match the other selected field values

Scenario: Curator selects a category on the Task page
	When I select a category
	Then I should see tasks related to registrations of the selected category
	And all tasks displayed should match the other selected field values	