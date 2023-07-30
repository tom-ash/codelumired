# frozen_string_literal: true

require 'factory_bot'

# RSpec.shared_context 'links', :shared_context => :metadata do
#   let(:links) do
#     {
#       'listing/index/offices': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/biura',
#         path: 'wynajem/biura'
#       },
#       'listing/index/usablePremises': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/lokale-uzytkowe',
#         path: 'wynajem/lokale-uzytkowe'
#       },
#       'listing/index/apartments': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/mieszkania',
#         path: 'wynajem/mieszkania'
#       },
#       'listing/index/houses': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/domy',
#         path: 'wynajem/domy'
#       },
#       'listing/index/rooms': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/pokoje',
#         path: 'wynajem/pokoje'
#       },
#       'listing/index/parkingSpaces': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/miejsca-parkingowe',
#         path: 'wynajem/miejsca-parkingowe'
#       },
#       'listing/index/virtualOffices': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/biura-wirtualne',
#         path: 'wynajem/biura-wirtualne'
#       },
#       'listing/index/coworkingSpaces': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/coworking-przestrzenie-coworkingowe',
#         path: 'wynajem/coworking-przestrzenie-coworkingowe'
#       },
#       'listing/index/advertisingSpaces': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/przestrzenie-reklamowe',
#         path: 'wynajem/przestrzenie-reklamowe'
#       },
#       'listing/index/garages': {
#         href: 'http://local.mapawynajmu.pl:8080/wynajem/garaze',
#         path: 'wynajem/garaze'
#       },
#       'current/pl': {
#         href: 'http://local.mapawynajmu.pl:8080/',
#         path: ''
#       },
#       'current/en': {
#         href: 'http://local.mapawynajmu.pl:8080/en',
#         path: 'en'
#       },
#       'root': {
#         href: 'http://local.mapawynajmu.pl:8080/',
#         hrefLang: 'pl',
#         path: '',
#         label: 'Strona główna',
#         title: 'Nieruchomości na wynajem'
#       },
#       'visitor/contact': {
#         href: 'http://local.mapawynajmu.pl:8080/kontakt',
#         path: 'kontakt',
#         title: 'Kontakt',
#         label: 'Kontakt',
#         hrefLang: 'pl'
#       },
#       'visitor/terms-of-service': {
#         href: 'http://local.mapawynajmu.pl:8080/regulamin',
#         path: 'regulamin',
#         title: 'Regulamin',
#         label: 'Regulamin',
#         hrefLang: 'pl'
#       },
#       'visitor/privacy-policy': {
#         href: 'http://local.mapawynajmu.pl:8080/polityka-prywatnosci',
#         path: 'polityka-prywatnosci',
#         title: 'Polityka Prywatności',
#         label: 'Polityka Prywatności',
#         hrefLang: 'pl'
#       },
#       'visitor/cookies-policy': {
#         href: 'http://local.mapawynajmu.pl:8080/polityka-cookies',
#         path: 'polityka-cookies',
#         title: 'Polityka Cookies',
#         label: 'Polityka Cookies',
#         hrefLang: 'pl'
#       },
#       'visitor/privacy-settings': {
#         href: 'http://local.mapawynajmu.pl:8080/ustawienia-prywatnosci',
#         path: 'ustawienia-prywatnosci',
#         title: 'Ustawienia Prywatności',
#         label: 'Ustawienia prywatności',
#         hrefLang: 'pl'
#       },
#       'visitorPageIndex': {
#         href: 'http://local.mapawynajmu.pl:8080/artykuly-o-wynajmie-nieruchomosci',
#         path: 'artykuly-o-wynajmie-nieruchomosci',
#         title: 'Artykuły o wynajmnie nieruchomości',
#         label: 'Artykuły',
#         hrefLang: 'pl'
#       },
#       'user/new/form': {
#         href: 'http://local.mapawynajmu.pl:8080/zarejestruj',
#         path: 'zarejestruj',
#         title: 'Zarejestruj',
#         label: 'Zarejestruj',
#         hrefLang: 'pl'
#       },
#       'user/create/verification': {
#         href: 'http://local.mapawynajmu.pl:8080/potwierdz-adres-email',
#         path: 'potwierdz-adres-email',
#         title: 'Potwierdź Adres Email',
#         label: nil,
#         hrefLang: 'pl'
#       },
#       'user/edit': {
#         href: 'http://local.mapawynajmu.pl:8080/ustawienia-konta',
#         path: 'ustawienia-konta',
#         title: 'Ustawienia Konta',
#         label: 'Ustawienia konta',
#         hrefLang: 'pl'
#       },
#       'user/password-reset': {
#         href: 'http://local.mapawynajmu.pl:8080/zresetuj-haslo',
#         path: 'zresetuj-haslo',
#         title: 'Zresetuj Hasło',
#         label: nil,
#         hrefLang: 'pl'
#       },
#       'user/auth': {
#         href: 'http://local.mapawynajmu.pl:8080/zaloguj',
#         path: 'zaloguj',
#         title: 'Zaloguj',
#         label: 'Zaloguj',
#         hrefLang: 'pl'
#       },
#       'user/show': {
#         title: 'Moje Konto'
#       },
#       'announcement/create/form': {
#         href: 'http://local.mapawynajmu.pl:8080/dodaj-ogloszenie-wynajmu-nieruchomosci',
#         path: 'dodaj-ogloszenie-wynajmu-nieruchomosci',
#         title: 'Dodaj ogłoszenie wynajmu nieruchomości',
#         label: 'Dodaj ogłoszenie za darmo',
#         hrefLang: 'pl'
#       },
#       'announcement/index/user': {
#         href: 'http://local.mapawynajmu.pl:8080/moje-ogloszenia',
#         path: 'moje-ogloszenia',
#         title: 'Moje ogłoszenia',
#         label: 'Moje ogłoszenia',
#         hrefLang: 'pl'
#       },
#       'page/index': {
#         href: 'http://local.mapawynajmu.pl:8080/strony',
#         path: 'strony',
#         title: 'Strony',
#         label: nil,
#         hrefLang: 'pl'
#       },
#       'image/edit': {
#         href: 'http://local.mapawynajmu.pl:8080/(?-mix:^obrazy\\/.+$)',
#         path: '(?-mix:^obrazy\\/.+$)',
#         title: 'Edytuj obraz',
#         label: nil,
#         hrefLang: 'pl'
#       },
#       'image/index': {
#         href: 'http://local.mapawynajmu.pl:8080/obrazy',
#         path: 'obrazy',
#         title: 'Obrazy',
#         label: nil,
#         hrefLang: 'pl'
#       },
#       'facebook': {
#         href: 'https://www.facebook.com/mapawynajmupl',
#         external: true
#       },
#       linkedin: {
#         href: 'https://www.linkedin.com/company/mapawynajmu-pl/',
#         external: true
#       }
#     }
#   end
# end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  # config.include_context 'links', :include_shared => true
end
