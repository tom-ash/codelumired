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
      },
      'visitor/contact': {
        href: '/kontakt',
        hrefLang: 'pl',
        title: 'Kontakt',
        label: 'Kontakt',
      },
      'visitor/terms-of-service': {
        href: '/regulamin',
        hrefLang: 'pl',
        title: 'Regulamin',
        label: 'Regulamin',
      },
      'visitor/privacy-policy': {
        href: '/polityka-prywatnosci',
        hrefLang: 'pl',
        title: 'Polityka Prywatności',
        label: 'Polityka Prywatności',
      },
      'visitor/cookies-policy': {
        href: '/polityka-cookies',
        hrefLang: 'pl',
        title: 'Polityka Cookies',
        label: 'Polityka Cookies',
      },
      'visitor/privacy-settings': {
        href: '/ustawienia-prywatnosci',
        hrefLang: 'pl',
        title: 'Ustawienia Prywatności',
        label: 'Ustawienia prywatności',
      },
      'visitorPageIndex': {
        href: '/artykuly-o-wynajmie-nieruchomosci',
        hrefLang: 'pl',
        title: 'Artykuły o wynajmnie nieruchomości',
        label: 'Artykuły',
      },
      'user/new/form': {
        href: '/zarejestruj',
        hrefLang: 'pl',
        title: 'Zarejestruj',
        label: 'Zarejestruj',
      },
      'user/create/verification': {
        href: '/potwierdz-adres-email',
        hrefLang: 'pl',
        title: 'Potwierdź Adres Email',
        label: nil,
      },
      'user/edit': {
        href: '/ustawienia-konta',
        hrefLang: 'pl',
        title: 'Ustawienia Konta',
        label: 'Ustawienia konta',
      },
      'user/password-reset': {
        href: '/zresetuj-haslo',
        hrefLang: 'pl',
        title: 'Zresetuj Hasło',
        label: nil,
      },
      'user/auth': {
        href: '/zaloguj',
        hrefLang: 'pl',
        title: 'Zaloguj',
        label: 'Zaloguj',
      },
      'user/show': {
        title: 'Moje Konto',
        # TODO!
      },
      'listings>new>form': {
        href: '/dodaj-ogloszenie-wynajmu-nieruchomosci',
        hrefLang: 'pl',
        title: 'Dodaj ogłoszenie wynajmu nieruchomości',
        label: 'Dodaj ogłoszenie za darmo',
      },
      'announcement/index/user': {
        href: '/moje-ogloszenia',
        hrefLang: 'pl',
        title: 'Moje ogłoszenia',
        label: 'Moje ogłoszenia',
      },
      'page/index': {
        href: '/strony',
        hrefLang: 'pl',
        title: 'Strony',
        label: nil,
      },
      'image/edit': {
        href: '/(?-mix:^obrazy\\/.+$)',
        hrefLang: 'pl',
        title: 'Edytuj obraz',
        label: nil,
      },
      'image/index': {
        href: '/obrazy',
        hrefLang: 'pl',
        title: 'Obrazy',
        label: nil,
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
  let(:schemaOrgOrganization) do
    {
      '@type': 'Organization',
      url: 'http://local.mapawynajmu.pl:8080',
      name: 'mapawynajmu.pl',
      sameAs: [
        'https://www.facebook.com/mapawynajmupl',
        'https://www.linkedin.com/company/mapawynajmu-pl/',
      ],
    }
  end
end
