
Feature: Employees
    Employee API


    @search_scenario
    Scenario: Get all employees info
        Given that user wants check all employees information
        When start this search
        Then a employees list should be returned

    @register_scenario
    Scenario: Register an employee
        Given that user wants to register a new employee
        When the employee information be sent
        Then this employee should be register 

    @update_scenario
    Scenario: Update employee information
        Given that user changes an employee info
        When this changes be sent
        Then this employee info will be changed

    @delete_scenario
    Scenario: Delete an employee
        Given that user wants to delete an employee
        When this delete request is sent
        Then this employee should be deleted
