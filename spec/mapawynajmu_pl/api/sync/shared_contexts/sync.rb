require 'shared/contexts/sync.rb'

RSpec.shared_context 'mapawynajmu_pl_sync', :shared_context => :metadata do
  include_context 'sync'

  subject { get '/mapawynajmu-pl/sync', headers: headers }

  let!(:user) { create(:mapawynajmu_pl_user) }
  let!(:admin) { create(:mapawynajmu_pl_user, email: 'admin@mapawynajmu.pl', role: 'admin') }
  let(:common_links) do
    {

      'root': {
        href: '/',
        hrefLang: 'pl',
        title: 'Mapa wynajmu nieruchomości w Polsce',
        label: 'Strona główna',
        path: '/',
      },
      'visitor/contact': {
        href: '/kontakt',
        hrefLang: 'pl',
        title: 'Kontakt',
        label: 'Kontakt',
        path: 'kontakt',
      },
      'visitor/terms-of-service': {
        href: '/regulamin',
        hrefLang: 'pl',
        title: 'Regulamin',
        label: 'Regulamin',
        path: 'regulamin',
      },
      'visitor/privacy-policy': {
        href: '/polityka-prywatnosci',
        hrefLang: 'pl',
        title: 'Polityka Prywatności',
        label: 'Polityka Prywatności',
        path: 'polityka-prywatnosci',
      },
      'visitor/cookies-policy': {
        href: '/polityka-cookies',
        hrefLang: 'pl',
        title: 'Polityka Cookies',
        label: 'Polityka Cookies',
        path: 'polityka-cookies',
      },
      'visitor/privacy-settings': {
        href: '/ustawienia-prywatnosci',
        hrefLang: 'pl',
        title: 'Ustawienia Prywatności',
        label: 'Ustawienia prywatności',
        path: 'ustawienia-prywatnosci',
      },
      'visitorPageIndex': {
        href: '/artykuly-o-wynajmie-nieruchomosci',
        hrefLang: 'pl',
        title: 'Artykuły o wynajmnie nieruchomości',
        label: 'Artykuły',
        path: 'artykuly-o-wynajmie-nieruchomosci',
      },
      'user/new/form': {
        href: '/zarejestruj',
        hrefLang: 'pl',
        title: 'Zarejestruj',
        label: 'Zarejestruj',
        path: 'zarejestruj',
      },
      'user/create/verification': {
        href: '/potwierdz-adres-email',
        hrefLang: 'pl',
        title: 'Potwierdź Adres Email',
        label: nil,
        path: 'potwierdz-adres-email',
      },
      'user/edit': {
        href: '/ustawienia-konta',
        hrefLang: 'pl',
        title: 'Ustawienia Konta',
        label: 'Ustawienia konta',
        path: 'ustawienia-konta',
      },
      'user/password-reset': {
        href: '/zresetuj-haslo',
        path: 'zresetuj-haslo',
        title: 'Zresetuj Hasło',
        label: nil,
        hrefLang: 'pl'
      },
      'user/auth': {
        href: '/zaloguj',
        path: 'zaloguj',
        title: 'Zaloguj',
        label: 'Zaloguj',
        hrefLang: 'pl'
      },
      'user/show': {
        title: 'Moje Konto'
      },
      'listings>new>form': {
        href: '/dodaj-ogloszenie-wynajmu-nieruchomosci',
        path: 'dodaj-ogloszenie-wynajmu-nieruchomosci',
        title: 'Dodaj ogłoszenie wynajmu nieruchomości',
        label: 'Dodaj ogłoszenie za darmo',
        hrefLang: 'pl'
      },
      'announcement/index/user': {
        href: '/moje-ogloszenia',
        path: 'moje-ogloszenia',
        title: 'Moje ogłoszenia',
        label: 'Moje ogłoszenia',
        hrefLang: 'pl'
      },
      'page/index': {
        href: '/strony',
        path: 'strony',
        title: 'Strony',
        label: nil,
        hrefLang: 'pl'
      },
      'image/edit': {
        href: '/(?-mix:^obrazy\\/.+$)',
        path: '(?-mix:^obrazy\\/.+$)',
        title: 'Edytuj obraz',
        label: nil,
        hrefLang: 'pl'
      },
      'image/index': {
        href: '/obrazy',
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
