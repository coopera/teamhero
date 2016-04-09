require 'rails_helper'
require 'support/event_counter'

RSpec.describe TeamheroAPI::IssuesClient do
  it_behaves_like 'event counter', :issues
end
