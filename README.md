# Dummy Employees API automation with RSpec and HTTParty

Walkthrough to install, set up and run the scenarios with RSpec + HTTParty.
Used in this project Ruby, RSpec, HTTParty, Faker, Rubocop and others gems. 

Scenarios for the API [Dummy RestAPI Example](https://dummy.restapiexample.com/).

##
### Requirements for Windows 10
Install *Ruby* on Windows using [**RubyInstaller**](https://rubyinstaller.org/). 


Install the latest [**GIT**](https://git-scm.com/download/win) to clone the repository.

##
### Clone the Repository and Install Packages

In your terminal (with admin privileges), run this command to clone project, install all dependencies and run the tests

```bash
git clone https://github.com/WillCoutinho/rspec-with-httparty && cd rspec-with-httparty && bundler install
```

To run the suite tests use the command: ``cucumber -t @scenario_tag_name``  
  
**Scenarios Available**
| Tag               | Scenario Name                   |
| -------------     | -------------                   |
| search_scenario   | Get all employees info          |
| register_scenario | Register an employee            |
| update_scenario   | Update employee information     |
| delete_scenario   | Delete an employee              |

>**DO NOT** run all scenarios without a time between them. The API used to run these scenarios has protection for repeated requests and returns an error when this limit is reached (429 - Too Many Requests).

##

#### Git Repository

GitHub: [_RSpec with HTTParty_](https://github.com/WillCoutinho/rspec-with-httparty)

##

#### Packages

- [RSpec](https://rspec.info/) - Behaviour Driven Development for Ruby
- [HTTParty](https://rubygems.org/gems/httparty) - Gem for API requests
- [Faker](https://rubygems.org/gems/faker) - Gem for Fake Data
- [Rubocop](https://rubygems.org/gems/rubocop) - Ruby code style and formatting tool