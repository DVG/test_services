# TestServices

Service Objects that provide useful benefits to your integration test suite.

## Installation

Add this line to your application's Gemfile:

    gem 'test_services', group: [:test]

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install test_services

## Usage

### Cucumber


Just require the cucumber file and all the cucumber service objects will become available.

```ruby
# features/support/my_configuration_file
require 'test_services/cucumber'
```

#### TableComparer

TableComparer lets you write a step definition representing an HTML Table and validate the text contents match

```gherkin
Then I should see the following search results:
| username | email address |
| Bobby    | b@gmail.com   |
```

And using it is as simple as:
```ruby
Then(/^I should see the following search results:$/) do |table|
  expect(TableComparer.new(table, "#search_results").matches?).to be_true
end
```

However you should also push this into a PageObject
```ruby
# features/support/pages/search_result_page.rb
class SearchResultsPage < SitePrism::Page
  def has_results_matching?(table)
    TableComparer.new(table, "#search_results").matches?
  end
end

# features/step_definitions/search_results_steps.rb
Then(/^I should see the following search results:$/) do |table|
  expect(SearchResultsPage.new).to have_results_matching(table)
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/test_services/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
