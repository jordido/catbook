require "rails_helper"

RSpec.describe CatMailer, :type => :mailer do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @cat = Cat.new
    @cat.email = "jordi@zona-e.com"
    CatMailer.welcome(@cat).deliver
  end

  it 'should send an email' do
    ActionMailer::Base.deliveries.count.should == 1
  end

  it 'renders the receiver email' do
    ActionMailer::Base.deliveries.first.to.should == @cat.email
  end

  after(:each) do
  ActionMailer::Base.deliveries.clear
	end

end