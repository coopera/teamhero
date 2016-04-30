require 'rails_helper'
require 'support/event_counter'

RSpec.describe TeamheroAPI::CommentsClient do
  it_behaves_like 'event counter', :comment
end
