require 'capybara/rspec'

class SimulatedBookmarksSite
  include Capybara::DSL
  include Capybara::RSpecMatchers

  def accept_next_confirmation
    page.evaluate_script('window.confirm = function() { return true; }')
  end
end
