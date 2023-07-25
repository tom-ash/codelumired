# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::MapawynajmuPl::Api::Sync do
  describe 'root' do
    subject do
      get '/mapawynajmu-pl/sync', headers: headers
    end

    let(:headers) do
      {
        'Route-Url': '/',
        # Is-Listings-Obsolete:
        # Type: ssr
        # User-Agent:
        # Access-Token
      }
    end

    context 'when syncing is successful' do
      let(:app_data) do
        {
          lang: 'pl'
        }
      end
      let(:render) do
        {
          "visitor": true,
          "announcement": true,
          "announcement/index": true,
          "announcement/index/map": true
        }
      end
      let(:user) do
        {
          authorized: false,
          accountType: nil,
          role: nil
        }
      end
      let(:texts) do
        {
          categoryInputPlaceholder: 'Kategoria',
          areaInputPlaceholder: 'Powierzchnia',
          areaMinInputLabel: 'Min.',
          areaMaxInputLabel: 'Maks.',
          priceInputPlaceholder: 'Miesięczna cena',
          priceMinInputLabel: 'Min.',
          priceMaxInputLabel: 'Maks.',
          officesCategoryLabel: 'Biura',
          usablePremisesCategoryLabel: 'Lokale użytkowe',
          apartmentsCategoryLabel: 'Mieszkania',
          housesCategoryLabel: 'Domy',
          roomsCategoryLabel: 'Pokoje',
          parkingSpacesCategoryLabel: 'Miejsca parkingowe',
          virtualOfficesCategoryLabel: 'Biura Wirtualne',
          coworkingSpacesCategoryLabel: 'Coworking - Przestrzenie coworkingowe',
          advertisingSpacesCategoryLabel: 'Przestrzenie reklamowe',
          garagesCategoryLabel: 'Garaże',
          signOutButtonLabel: 'Wyloguj',
          showMyAccountMenuButtonLabel: 'Moje konto',
          allRightsReserved: ''
        }
      end
      let(:assets) do
        {
          svgs: {}
        }
      end
      let(:links) do
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
      let(:control) do
        {
          isMapInitialized: false,
          shouldInitializeMap: false,
          isPinsDrawn: false,
          mapOptions: {
            center: {
              lat: 52,
              lng: 19,
            },
            zoom: 6.7,
          },
          categoryFilterPanel: false,
          areaFilterPanel: false
        }
      end
      let(:data) do
        {
          currentCategory: nil,
          currentPartnerName: nil,
          title: 'Nieruchomości na wynajem',
          tile: nil,
          announcements: [],
          amount: 0,
          categorySvgName: 'list',
          areaSvgName: 'area',
          priceSvgName: 'coins'
        }
      end
      let(:inputs) do
        {
          category: nil,
          areaOptions: ['20', '30', '40', '50', '60', '70', '80', '90', '100', '150', '200'],
          area: '',
          areaMin: nil,
          areaMax: nil,
          priceOptions: ['1000', '1500', '2000', '2500', '3000', '4000', '5000', '6000', '7000', '8000', '9000', '10000'],
          price: '',
          priceMin: nil,
          priceMax: nil
        }
      end
      let(:errors) { {} }
      let(:state) do
        {
          app: app_data,
          render: render,
          user: user,
          control: control,
          assets: assets,
          links: links,
          texts: texts,
          data: data,
          inputs: inputs,
          errors: errors,
          meta: {}, # meta preview
        }
      end
      let(:schemaOrg) do
        {
          inLanguage: 'pl',
          '@context': 'https://schema.org',
          '@type': 'WebSite',
          url: 'http://local.mapawynajmu.pl:8080',
          name: 'Nieruchomości na wynajem',
          description: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
          keywords: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
          image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
          isFamilyFriendly: true
        }
      end
      let(:openGraph) do
        {
          locale: 'pl_PL',
          locales: ['pl_PL', 'en_GB'],
          url: 'http://local.mapawynajmu.pl:8080',
          siteName: 'mapawynajmu.pl',
          type: 'website',
          title: "Nieruchomości na wynajem",
          keywords: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
          description: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
          image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
          'image:width': 1200,
          'image:height': 630,

        }
      end
      let(:meta) do
        {
          lang: 'pl',
          langs: ['pl', 'en'],
          title: 'Nieruchomości na wynajem',
          keywords: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
          description: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
          image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
          robots: 'index,follow,all',
          canonicalUrl: 'http://local.mapawynajmu.pl:8080',
          alternateLinks: '<link rel="alternate" hreflang="pl" href="http://local.mapawynajmu.pl:8080" /><link rel="alternate" hreflang="en" href="http://local.mapawynajmu.pl:8080/en" />',
          schemaOrg: schemaOrg,
          openGraph: openGraph,
        }
      end
      let(:body) do
        JSON.parse(response.body, symbolize_names: true)
      end

      it 'returns :ok (200) response' do
        subject
        expect(response.status).to eq(200)
      end

      it 'includes specific state & specific meta properties in body' do
        subject
        expect(body).to eq({
          state: state,
          meta: meta,
        })
      end

      describe 'state' do
        it 'includes specific state property in body' do
          subject
          expect(body[:state]).to eq(state)
        end

        it 'includes specific app property in state' do
          subject
          expect(body[:state][:app]).to eq(app_data)
        end

        it 'includes specific render property in state' do
          subject
          expect(body[:state][:render]).to eq(render)
        end

        it 'includes specific render property in state' do
          subject
          expect(body[:state][:user]).to eq(user)
        end

        it 'includes specific control property in state' do
          subject
          expect(body[:state][:control]).to eq(control)
        end

        it 'includes specific assets property in state' do
          subject
          expect(body[:state][:assets]).to eq(assets)
        end

        it 'includes specific links property in state' do
          subject
          expect(body[:state][:links]).to eq(links)
        end

        it 'includes specific texts property in state' do
          subject
          expect(body[:state][:texts]).to eq(texts)
        end

        it 'includes specific data property in state' do
          subject
          expect(body[:state][:data]).to eq(data)
        end

        it 'includes specific inputs property in state' do
          subject
          expect(body[:state][:inputs]).to eq(inputs)
        end

        it 'includes specific errors property in state' do
          subject
          expect(body[:state][:errors]).to eq(errors)
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
  end
end
