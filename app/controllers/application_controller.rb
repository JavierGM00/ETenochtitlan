class ApplicationController < ActionController::Base

#before_action :set_locale
#def set_locale
#  I18n.locale = params[:locale] || I18n.default_locale
#end

before_action :set_locale
  		def set_locale
  		  I18n.locale = params[:locale] ||
    	  extract_locale_from_accept_language_header ||
    	  I18n.default_locale
  		end
  
	def extract_locale_from_accept_language_header
  		request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  		locale if ['es', 'en'].include? locale.to_s
	end


end
