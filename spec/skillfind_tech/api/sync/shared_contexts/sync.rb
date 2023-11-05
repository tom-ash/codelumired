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
        path: '/',
        title: 'skillfind.tech | IT Skill Driven Posting Board & Knowledge Repository',
        label: nil,
        hrefLang: 'en',
      },
      'current/pl': {
        href: 'pl',
        path: 'pl',
        title: 'skillfind.tech | Tablica ogłoszeń IT z umiejętnościami i repozytorium wiedzy',
        label: nil,
        hrefLang: 'pl',
      },
      root: {
        href: '/',
        path: '/',
        title: 'skillfind.tech | IT Skill Driven Posting Board & Knowledge Repository',
        label: nil,
        hrefLang: 'en',
      },
      'visitor/contact': {
        href: 'http://local.skillfind.tech:8080/contact',
        path: 'contact',
        title: 'Contact',
        label: 'Contact',
        hrefLang: 'en',
      },
      'visitor/terms-of-service': {
        href: 'http://local.skillfind.tech:8080/terms-of-service',
        path: 'terms-of-service',
        title: 'Terms of Service',
        label: 'Terms of Service',
        hrefLang: 'en',
      },
      'visitor/privacy-policy': {
        href: 'http://local.skillfind.tech:8080/privacy-policy',
        path: 'privacy-policy',
        title: 'Privacy Policy',
        label: 'Privacy Policy',
        hrefLang: 'en',
      },
      'visitor/cookies-policy': {
        href: 'http://local.skillfind.tech:8080/cookies-policy',
        path: 'cookies-policy',
        title: 'Cookies Policy',
        label: 'Cookies Policy',
        hrefLang: 'en',
      },
      'visitor/privacy-settings': {
        href: 'http://local.skillfind.tech:8080/privacy-settings',
        path: 'privacy-settings',
        title: 'Privacy Settings',
        label: 'Privacy Settings',
        hrefLang: 'en',
      },
      'user/password-reset': {
        href: 'http://local.skillfind.tech:8080/reset-password',
        path: 'reset-password',
        title: 'Reset Password',
        label: nil,
        hrefLang: 'en',
      },
      'user/new/form': {
        href: 'http://local.skillfind.tech:8080/sign-up',
        path: 'sign-up',
        title: 'Sign Up',
        label: 'Sign Up',
        hrefLang: 'en',
      },
      'user/auth': {
        href: 'http://local.skillfind.tech:8080/sign-in',
        path: 'sign-in',
        title: 'Sign In',
        label: 'Sign In',
        hrefLang: 'en',
      },
      'listings>new>form': {
        href: 'http://local.skillfind.tech:8080/add-posting',
        path: 'add-posting',
        title: 'TODO',
        label: 'ASDASDASDAS',
        hrefLang: 'en'
      },
      'announcement/create/summary': {
        href: 'http://local.skillfind.tech:8080/(?-mix:^posted-job\\/(\\d+)$)',
        path: '(?-mix:^posted-job\\/(\\d+)$)',
        title: 'TODO',
        label: nil,
        hrefLang: 'en',
      },
      'page/index': {
        href: 'http://local.skillfind.tech:8080/pages',
        path: 'pages',
        title: 'Pages',
        label: nil,
        hrefLang: 'en',
      },
      'image/index': {
        href: 'http://local.skillfind.tech:8080/images',
        path: 'images',
        title: 'Images',
        label: nil,
        hrefLang: 'en',
      }
    }
  end
end
