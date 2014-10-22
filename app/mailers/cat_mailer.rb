class CatMailer < ActionMailer::Base
  default from: "catbook@esdeluxe.com"

	def welcome(cat)
    @cat = cat
    @url  = 'http://example.com/login'
    mail(to: @cat.email, subject: 'Welcome to Catbook Site')
  end
  handle_asynchronously :welcome, :run_at => Proc.new { 3.minutes.from_now }

end
