Feature: Validation of an NVI resource

	This feature file contains scenarios related to validation of NVI-Resources as part of the NVI-process.

	In order to view the current status of the NVI-prosess
	As a Curator
	I want to see the current status compared with last year's results

	In order to inspect a Resource
	As an Curator
	I want to be able to navigate to the Resource Landing Page 

	Background:
  		Given a logged-in User
  		And the User has the role "NVI-Curator" at an NVI-Institution
  		And the User has navigated to the NVI section in the left menu via the Tasks option in the top menu

  	Scenario: List of fields on NVI page
	When I navigate to the Task page
	Then I should see the following fields:
		| field                |
		| Search               | 
		| Curator              | 
		| Area of responibiliy | 
		| Exclude subunits     | 
		| Year                 | 
		| List of candidates   | 
	And the Year is set to current open NVI-periode by default
	And the Curator field is set to none by default 
	And the area of responsibility is set to my curator permissions

	Scenario: Menu on NVI page
	When I navigate to the Task page
	Then I see a menu containing following objects
		| objects              |
		| a progress bar       | 
		| Status submenu       | 

	Scenario: Status submenu on NVI page
	When I navigate to the Task page
	Then I see a submenu containing following status
		| status               |
		| Candidate            | 
		| Being checked        | 
		| Approved             | 
		| Rejected             | 
		| Dispute              | 
	And each status except Dispute has has an sub option 
	And all options and suboption has a radiobutton 
	And each radiobutton label display the count of occurrences for that option
	And the Candidate radiobutton is selected by deafult
	And a list of NVI-resources of given status is listed

	Scenario: The progress bar display the current NVI-report status
		When I wish to see details 
		Then I select "Show reporting status"

	Scenario: Show reporting status
  		When I select "Show reporting status"
  		Then I see a table showing the reporting status for the current open NVI-periode by default
  		And the columns show NVI resource statuses
  		And the rows represent my institution's subunits
  		And I can select to view any previous year
  		And I see an option to export

