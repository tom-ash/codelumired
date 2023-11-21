require 'shared/contexts/sync.rb'

RSpec.shared_context 'skillfind_tech_sync', :shared_context => :metadata do
  include_context 'sync'

  subject { get '/skillfind-tech/sync', headers: headers }

  let!(:user) { create(:skillfind_tech_user) }
  let!(:admin) { create(:skillfind_tech_user, email: 'admin@skillfind.tech', role: 'admin') }

  let(:visitor_links) do
    {
      'current/en': {
        href: '/',
        title: 'skillfind.tech | IT Skill Driven Posting Board & Knowledge Repository',
        label: nil,
        hrefLang: 'en',
      },
      'current/pl': {
        href: '/pl',
        title: 'skillfind.tech | Tablica ogłoszeń IT z umiejętnościami i repozytorium wiedzy',
        label: nil,
        hrefLang: 'pl',
      },
      root: {
        href: '/',
        title: 'skillfind.tech | IT Skill Driven Posting Board & Knowledge Repository',
        label: nil,
        hrefLang: 'en',
      },
      'visitor/contact': {
        href: '/contact',
        title: 'Contact',
        label: 'Contact',
        hrefLang: 'en',
      },
      'visitor/terms-of-service': {
        href: '/terms-of-service',
        title: 'Terms of Service',
        label: 'Terms of Service',
        hrefLang: 'en',
      },
      'visitor/privacy-policy': {
        href: '/privacy-policy',
        title: 'Privacy Policy',
        label: 'Privacy Policy',
        hrefLang: 'en',
      },
      'visitor/cookies-policy': {
        href: '/cookies-policy',
        title: 'Cookies Policy',
        label: 'Cookies Policy',
        hrefLang: 'en',
      },
      'visitor/privacy-settings': {
        href: '/privacy-settings',
        title: 'Privacy Settings',
        label: 'Privacy Settings',
        hrefLang: 'en',
      },
      'user/password-reset': {
        href: '/reset-password',
        title: 'Reset Password',
        label: nil,
        hrefLang: 'en',
      },
      'user/new/form': {
        href: '/sign-up',
        title: 'Sign Up',
        label: 'Sign Up',
        hrefLang: 'en',
      },
      'user/auth': {
        href: '/sign-in',
        title: 'Sign In',
        label: 'Sign In',
        hrefLang: 'en',
      },
      'listings>new>form': {
        href: '/add-posting',
        title: 'TODO',
        label: 'ASDASDASDAS',
        hrefLang: 'en'
      },
      'announcement/create/summary': {
        href: '/(?-mix:^posted-job\\/(\\d+)$)',
        title: 'TODO',
        label: nil,
        hrefLang: 'en',
      },
      'page/index': {
        href: '/pages',
        title: 'Pages',
        label: nil,
        hrefLang: 'en',
      },
      'image/index': {
        href: '/images',
        title: 'Images',
        label: nil,
        hrefLang: 'en',
      }
    }
  end
  let(:schemaOrgOrganization) do
    {
      '@type': 'Organization',
      url: 'http://local.skillfind.tech:8080',
      name: 'skillfind.tech',
      sameAs: [
        'https://www.facebook.com/profile.php?id=100091302428884',
        'https://www.linkedin.com/company/skillfind-tech/',
      ],
    }
  end
end
