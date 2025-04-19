module ApplicationHelper
  def current_locale_direction
    rtl_languages = [:ar]
    rtl_languages.include?(I18n.locale) ? 'rtl' : 'ltr'
  end
end
