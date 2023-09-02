
Feature: Employees
    Employee API


    Scenario: Get all employees info
        Given that user wants check all employees information
        When start this search
        Then a employees list should be returned

    @second_scenario
    Scenario: Register an employee
        Given that user wants to register a new employee
        When the employee information be sent
        Then this employee should be register 