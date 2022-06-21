require "spec_helper"
require "./console_app/dummy.rb"
describe ConsoleApp::Dummy do
  it "just passes" do
    expect(true).to be true
  end
end
