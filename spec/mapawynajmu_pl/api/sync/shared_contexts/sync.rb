require 'shared/contexts/sync.rb'

RSpec.shared_context 'mapawynajmu_pl_sync', :shared_context => :metadata do
  include_context 'sync'

  subject { get '/mapawynajmu-pl/sync', headers: headers }

  let!(:user) { create(:mapawynajmu_pl_user) }
  let!(:admin) { create(:mapawynajmu_pl_user, email: 'admin@mapawynajmu.pl', role: 'admin') }
  let(:common_links) do
    {

      'root': {
        href: 'http://local.mapawynajmu.pl:8080/',
        hrefLang: 'pl',
        path: '',
        label: 'Strona główna',
        title: 'Nieruchomości na wynajem'
      },
      'visitor/contact': {
        href: 'http://local.mapawynajmu.pl:8080/kontakt',
        path: 'kontakt',
        title: 'Kontakt',
        label: 'Kontakt',
        hrefLang: 'pl'
      },
      'visitor/terms-of-service': {
        href: 'http://local.mapawynajmu.pl:8080/regulamin',
        path: 'regulamin',
        title: 'Regulamin',
        label: 'Regulamin',
        hrefLang: 'pl'
      },
      'visitor/privacy-policy': {
        href: 'http://local.mapawynajmu.pl:8080/polityka-prywatnosci',
        path: 'polityka-prywatnosci',
        title: 'Polityka Prywatności',
        label: 'Polityka Prywatności',
        hrefLang: 'pl'
      },
      'visitor/cookies-policy': {
        href: 'http://local.mapawynajmu.pl:8080/polityka-cookies',
        path: 'polityka-cookies',
        title: 'Polityka Cookies',
        label: 'Polityka Cookies',
        hrefLang: 'pl'
      },
      'visitor/privacy-settings': {
        href: 'http://local.mapawynajmu.pl:8080/ustawienia-prywatnosci',
        path: 'ustawienia-prywatnosci',
        title: 'Ustawienia Prywatności',
        label: 'Ustawienia prywatności',
        hrefLang: 'pl'
      },
      'visitorPageIndex': {
        href: 'http://local.mapawynajmu.pl:8080/artykuly-o-wynajmie-nieruchomosci',
        path: 'artykuly-o-wynajmie-nieruchomosci',
        title: 'Artykuły o wynajmnie nieruchomości',
        label: 'Artykuły',
        hrefLang: 'pl'
      },
      'user/new/form': {
        href: 'http://local.mapawynajmu.pl:8080/zarejestruj',
        path: 'zarejestruj',
        title: 'Zarejestruj',
        label: 'Zarejestruj',
        hrefLang: 'pl'
      },
      'user/create/verification': {
        href: 'http://local.mapawynajmu.pl:8080/potwierdz-adres-email',
        path: 'potwierdz-adres-email',
        title: 'Potwierdź Adres Email',
        label: nil,
        hrefLang: 'pl'
      },
      'user/edit': {
        href: 'http://local.mapawynajmu.pl:8080/ustawienia-konta',
        path: 'ustawienia-konta',
        title: 'Ustawienia Konta',
        label: 'Ustawienia konta',
        hrefLang: 'pl'
      },
      'user/password-reset': {
        href: 'http://local.mapawynajmu.pl:8080/zresetuj-haslo',
        path: 'zresetuj-haslo',
        title: 'Zresetuj Hasło',
        label: nil,
        hrefLang: 'pl'
      },
      'user/auth': {
        href: 'http://local.mapawynajmu.pl:8080/zaloguj',
        path: 'zaloguj',
        title: 'Zaloguj',
        label: 'Zaloguj',
        hrefLang: 'pl'
      },
      'user/show': {
        title: 'Moje Konto'
      },
      'listings>new>form': {
        href: 'http://local.mapawynajmu.pl:8080/dodaj-ogloszenie-wynajmu-nieruchomosci',
        path: 'dodaj-ogloszenie-wynajmu-nieruchomosci',
        title: 'Dodaj ogłoszenie wynajmu nieruchomości',
        label: 'Dodaj ogłoszenie za darmo',
        hrefLang: 'pl'
      },
      'announcement/index/user': {
        href: 'http://local.mapawynajmu.pl:8080/moje-ogloszenia',
        path: 'moje-ogloszenia',
        title: 'Moje ogłoszenia',
        label: 'Moje ogłoszenia',
        hrefLang: 'pl'
      },
      'page/index': {
        href: 'http://local.mapawynajmu.pl:8080/strony',
        path: 'strony',
        title: 'Strony',
        label: nil,
        hrefLang: 'pl'
      },
      'image/edit': {
        href: 'http://local.mapawynajmu.pl:8080/(?-mix:^obrazy\\/.+$)',
        path: '(?-mix:^obrazy\\/.+$)',
        title: 'Edytuj obraz',
        label: nil,
        hrefLang: 'pl'
      },
      'image/index': {
        href: 'http://local.mapawynajmu.pl:8080/obrazy',
        path: 'obrazy',
        title: 'Obrazy',
        label: nil,
        hrefLang: 'pl'
      },
      'facebook': {
        href: 'https://www.facebook.com/mapawynajmupl',
        external: true
      },
      linkedin: {
        href: 'https://www.linkedin.com/company/mapawynajmu-pl/',
        external: true
      }
    }
  end
end
