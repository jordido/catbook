class CatMailer < ActionMailer::Base
  default from: "catbook@esdeluxe.com"

	def welcome(cat)
    @cat = cat
    @url  = 'http://example.com/login'
    mail(to: @cat.email, subject: 'Welcome to Catbook Site')
  end

end
