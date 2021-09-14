Project is a vital part of the core data model and thus a main entity in the Reaserch Graph. 

    The Project fills two roles:
    i) it connects other core entites 
        - Person
        - Institution
        - Result (sometime named Outputs - from a project)
    ii) it defines and add other entites:
        - describing it (Description)
        - give roles to Persons (Participants)
        - show the money trail (Financing)
        - documents Approvals (and applications)

The project is described by four feature files:
    project_landing_page:
        - describes the public view of a project
        - privileged users may preview a project prior to publication
    my_project:
        - give the user an overview of all projects where he is involved
        - seperate between active and closed projects
        - enable the user to create new projects
        - has search functionality
    project_wizard:
        - enable the user to fill in needed information about a project
    healt_project:
        - if the project got a REK approval, it is a healt project
        - it describe what changes, when the project is a healt project