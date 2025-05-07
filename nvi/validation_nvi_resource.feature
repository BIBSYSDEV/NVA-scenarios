Feature: Validation of an NVI resource

	This feature file contains scenarios related to validation of NVI-Resources as part of the NVI-process.

	In order to view the current status of the NVI-prosess
	As a Curator
	I want to see the current status compared with last year's results

	In order to view the current status of the NVI-prosess
	As a Curator
	I want to see how many Resources have the status Candidate, Being checked, Approved, Rejected or Dispute.

	In order to inspect a Resource
	As an Curator
	I want to be able to navigate to the Resource Landing Page 

	Background:
  		Given a logged-in User
  		And the User has the role "NVI-Curator" at an NVI-Institution
  		And the User has navigated to the NVI section from the Tasks option in the main menu

	Scenario: List of fields on NVI page
  	When the User sees the NVI section
  	Then the following fields are visible:
   		| field                 |
   		| Search                | 
    	| Curator               | 
    	| Area of responsibility| 
    	| Exclude subunits      | 
    	| Year                  | 
    	| List of candidates    | 
  	And the Year field is set to the currently open NVI period by default
  	And the Curator field is set to none by default
  	And the Area of responsibility field reflects my curator permissions

	Scenario: Menu on NVI page
	When the User navigate to the Task page
	Then a menu containing following objects are visable:
		| objects        |
		| a progress bar | 
		| Status menu    | 

	Scenario Outline:
		When the User select a status
		And the Resources have authors that are affiliated with the Curator's Institution
		And the authors affiliation is within the Users Area of responibiliy
		And status for own institution is "<Own institution>"
		And status for other institutions is "<Other institutions>"
		Then the Results are listed under "<Status>"

		Examples:
		| Status                                      | Own institution | Other institutions         | 
		| Candidate                                   | Candidate       | No status                  | 
		| Candidate - Waiting for your institution    | Candidate       | Approved                   |
		| Being checked                               | Being checked   | No status                  |
		| Being checked - Waiting for your institution| Being checked   | Approved                   | 
		| Approved                                    | Approved        | No status                  | 
		| Approved - Waiting for other institution    | Approved        | Being checked              | 
		| Rejected                                    | Rejected        | No status                  | 
		| Rejected - Waiting for other institution    | Rejected        | Candidate or Being checked |
		| Dispute                                     | Rejected        | Approved                   |
		| Dispute                                     | Approved        | Rejected                   |
		| Dispute                                     | Candidate       | Dispute                    |

	Scenario: The progress bar display the current NVI-report status
		When the User wish to see details 
		Then the User may select "Show reporting status"

	Scenario: Show reporting status
  		When the User select "Show reporting status"
  		Then the User see a table displaying status for the current open NVI-periode by default
  		And the columns show NVI resource statuses
  		And the rows represent my institution's subunits
  		And I can select to view any previous year
  		And I has an export option