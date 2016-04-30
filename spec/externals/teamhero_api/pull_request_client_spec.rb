require 'rails_helper'
require 'support/event_counter'

RSpec.describe TeamheroAPI::PullRequestsClient do
  it_behaves_like 'event counter', :pull_request
end
