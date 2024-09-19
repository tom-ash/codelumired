require 'shared/contexts/sync.rb'

RSpec.shared_context 'skillfind_tech_sync', :shared_context => :metadata do
  include_context 'sync'

  subject { get '/skillfind-tech/sync', headers: headers }

  let!(:user) { create(:skillfind_tech_user) }
  let!(:admin) { create(:skillfind_tech_user, email: 'admin@skillfind.tech', role: 'admin') }

  let(:common_links) do
    {
      root: {
        href: '/',
        hrefLang: 'en',
        title: 'IT Skill Board | skillfind.tech',
        label: nil,
        icon: nil,
      },
      'visitor/contact': {
        href: '/contact',
        hrefLang: 'en',
        title: 'Contact | skillfind.tech',
        label: 'Contact',
        icon: nil,
      },
      'visitor/terms-of-service': {
        href: '/terms-of-service',
        hrefLang: 'en',
        title: 'Terms of Service | skillfind.tech',
        label: 'Terms of Service',
        icon: nil,
      },
      'visitor/privacy-policy': {
        href: '/privacy-policy',
        hrefLang: 'en',
        title: 'Privacy Policy | skillfind.tech',
        label: 'Privacy Policy',
        icon: nil,
      },
      'visitor/cookies-policy': {
        href: '/cookies-policy',
        hrefLang: 'en',
        title: 'Cookies Policy | skillfind.tech',
        label: 'Cookies Policy',
        icon: nil,
      },
      'visitor/privacy-settings': {
        href: '/privacy-settings',
        hrefLang: 'en',
        title: 'Privacy Settings | skillfind.tech',
        label: 'Privacy Settings',
        icon: nil,
      },
      'user/password-reset': {
        href: '/reset-password',
        hrefLang: 'en',
        title: 'Reset Password | skillfind.tech',
        label: 'Reset Password',
        icon: nil,
      },
      'user/new/form': {
        href: '/sign-up',
        hrefLang: 'en',
        title: 'Sign Up | skillfind.tech',
        label: 'Sign Up',
        icon: 'userPlus',
      },
      'user/auth': {
        href: '/sign-in',
        hrefLang: 'en',
        title: 'Sign In | skillfind.tech',
        label: 'Sign In',
        icon: 'signIn',
      },
      'listings/new/form': {
        href: '/add-posting',
        hrefLang: 'en',
        title: 'Add Skill Driven Tech Job Posting | skillfind.tech',
        label: 'Add Posting For Free',
        icon: 'plus',
      },
      'announcement/create/summary': {
        href: '/(?-mix:^posted-job\\/(\\d+)$)',
        hrefLang: 'en',
        title: 'TODO',
        label: nil,
        icon: nil,
      },
      'page/index': {
        href: '/pages',
        hrefLang: 'en',
        title: 'Pages',
        label: nil,
        icon: nil,
      },
      'image/index': {
        href: '/images',
        hrefLang: 'en',
        title: 'Images',
        label: nil,
        icon: nil,
      },
      'user/postings/index': {
        href: '/added-postings',
        hrefLang: 'en',
        title: 'Added Postings | skillfind.tech',
        label: 'My Postings',
        icon: 'listOl',
      },
      'user/users/edit': {
        href: '/account',
        hrefLang: 'en',
        title: 'Account Settings | skillfind.tech',
        label: 'Settings',
        icon: 'cog',
      },
      'user/users/show': {
        href: nil,
        hrefLang: nil,
        title: nil,
        label: 'Account',
        icon: 'circleUser',
      },
      'visitor/about-skillfind-tech': {
        href: '/about-skillfind-tech',
        hrefLang: 'en',
        title: 'About skillfind.tech | skillfind.tech',
        label: 'About skillfind.tech',
        icon: nil,
      },
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
