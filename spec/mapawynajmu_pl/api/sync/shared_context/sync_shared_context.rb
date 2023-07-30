RSpec.shared_context 'sync', :shared_context => :metadata do
  subject { get '/mapawynajmu-pl/sync', headers: headers }

  let!(:user) { create(:mapawynajmu_pl_user) }
  let(:headers) do
    {
      'Route-Url': route,
      'Access-Token': accessToken,
    }
  end
  let(:body) { JSON.parse(response.body, symbolize_names: true) }
  let(:visitor_state) do
    {
      app: visitor_app_data,
      render: visitor_render,
      user: visitor_user,
      control: visitor_control,
      assets: visitor_assets,
      links: visitor_links,
      texts: visitor_texts,
      data: visitor_data,
      inputs: visitor_inputs,
      errors: {},
      meta: {}, # meta preview
    }
  end
  let(:visitor_links) do
    {
      'listing/index/offices': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/biura',
        path: 'wynajem/biura'
      },
      'listing/index/usablePremises': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/lokale-uzytkowe',
        path: 'wynajem/lokale-uzytkowe'
      },
      'listing/index/apartments': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/mieszkania',
        path: 'wynajem/mieszkania'
      },
      'listing/index/houses': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/domy',
        path: 'wynajem/domy'
      },
      'listing/index/rooms': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/pokoje',
        path: 'wynajem/pokoje'
      },
      'listing/index/parkingSpaces': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/miejsca-parkingowe',
        path: 'wynajem/miejsca-parkingowe'
      },
      'listing/index/virtualOffices': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/biura-wirtualne',
        path: 'wynajem/biura-wirtualne'
      },
      'listing/index/coworkingSpaces': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/coworking-przestrzenie-coworkingowe',
        path: 'wynajem/coworking-przestrzenie-coworkingowe'
      },
      'listing/index/advertisingSpaces': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/przestrzenie-reklamowe',
        path: 'wynajem/przestrzenie-reklamowe'
      },
      'listing/index/garages': {
        href: 'http://local.mapawynajmu.pl:8080/wynajem/garaze',
        path: 'wynajem/garaze'
      },
      'current/pl': {
        href: 'http://local.mapawynajmu.pl:8080/',
        path: ''
      },
      'current/en': {
        href: 'http://local.mapawynajmu.pl:8080/en',
        path: 'en'
      },
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
      'announcement/create/form': {
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

  describe 'visitor' do
    let(:accessToken) { nil }

    it 'returns :ok (200) response' do
      subject
      expect(response.status).to eq(200)
    end
  
    it 'includes specific state & specific meta properties in body' do
      subject
      expect(body).to eq({
        state: visitor_state,
        meta: meta,
      })
    end
  
    describe 'state' do
      it 'includes specific state property in body' do
        subject
        expect(body[:state]).to eq(visitor_state)
      end
  
      it 'includes specific app property in state' do
        subject
        expect(body[:state][:app]).to eq(visitor_app_data)
      end
  
      it 'includes specific render property in state' do
        subject
        expect(body[:state][:render]).to eq(visitor_render)
      end
  
      it 'includes specific user property in state' do
        subject
        expect(body[:state][:user]).to eq(visitor_user)
      end
  
      it 'includes specific control property in state' do
        subject
        expect(body[:state][:control]).to eq(visitor_control)
      end
  
      it 'includes specific assets property in state' do
        subject
        expect(body[:state][:assets]).to eq(visitor_assets)
      end
  
      it 'includes specific links property in state' do
        subject
        expect(body[:state][:links]).to eq(visitor_links)
      end
  
      it 'includes specific texts property in state' do
        subject
        expect(body[:state][:texts]).to eq(visitor_texts)
      end
  
      it 'includes specific data property in state' do
        subject
        expect(body[:state][:data]).to eq(visitor_data)
      end
  
      it 'includes specific inputs property in state' do
        subject
        expect(body[:state][:inputs]).to eq(visitor_inputs)
      end
  
      it 'includes specific errors property in state' do
        subject
        expect(body[:state][:errors]).to eq({})
      end
    end
  
    describe 'meta' do
      it 'includes specific meta property in body' do
        subject
        expect(body[:meta]).to eq(meta)
      end
  
      it 'includes specific schemaOrg property in meta' do
        subject
        expect(body[:meta][:schemaOrg]).to eq(schemaOrg)
      end
  
      it 'includes specific openGraph property in meta' do
        subject
        expect(body[:meta][:openGraph]).to eq(openGraph)
      end
    end
  end

  describe 'user' do
    let(:accessToken) { accessToken = ::Ciphers::Jwt::Encoder.new(id: user.id).call }
    let(:password) { 'test_password' }

    it 'returns :ok (200) response' do
      subject
      expect(response.status).to eq(200)
    end

    it 'includes specific render property in state' do
      subject
      expect(body[:state][:user]).to eq(
        accountType: nil, # TODO: Fix nil!
        authorized: true, # TODO: Change to authenticated.
        role: nil,
      )
    end
  end
end
