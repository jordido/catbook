module CatsHelper
  def localize_date(date)
  	if date
    	I18n.l date, format: :short
  	end
  end
end
