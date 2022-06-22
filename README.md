[![codecov](https://codecov.io/gh/Hermanlangner/console-app/branch/main/graph/badge.svg?token=SW45QMJK16)](https://codecov.io/gh/Hermanlangner/console-app)
# console-app

## Installation
- Uses Ruby 3.0.0 (installing [rvm](https://rvm.io/rvm/install) is the easiest)
- `bundle install`

## Running the application
### Help

`ruby league.rb -h`

### run for console output

`ruby league.rb -i ./local_test/input.txt`

where the path is the input file

`ruby league.rb -i <your_input_file_path_here`

### output to a text file
`ruby league.rb -i <your_input_file_path_here |> <your_output_file_path_here>`

### To run tests locally
`bundle exec rspec ./spec/**/*.rb`

## CI
The CI at the moment uses github actions to run on pull requests or pushes to main, it then uploads the coverage data to codecov
