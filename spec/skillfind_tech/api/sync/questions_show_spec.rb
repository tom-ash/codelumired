# frozen_string_literal: true

require 'skillfind_tech/rails_helper'
require_relative './shared_contexts/sync.rb'

# TODO!
RSpec.describe ::SkillfindTech::Api::Sync do
  describe 'questionsShow' do
    include_context 'skillfind_tech_sync'

    let!(:question) {create(:question) }

    # let!(:answer_a) { create(:question_answer, question: question) }

    let(:route) { 'questions/test' }
    let(:visitor_app_data) do
      {
        lang: 'en'
      }
    end
    let(:visitor_render) do
      {
        visitor: true,
        renderQuestions: true,
        renderQuestionsShow: true,
      }
    end
    let(:visitor_user) do
      {
        authorized: false,
        accountType: nil,
        role: nil
      }
    end
    let(:visitor_texts) do
      {
        :signOutButtonLabel=>"Sign Out",
        :showMyAccountMenuButtonLabel=>"My account",
        :allRightsReserved=>""
      }
    end
    let(:visitor_assets) do
      {
        svgs: {}
      }
    end
    let(:visitor_control) do
      {}
    end
    let(:visitor_data) do
      {
        type: 'singleChoice',
        isSingleChoice: true,
        isMultipleChoice: false,
        title: 'test_title',
        body: 'test_body',
        answers: [
          {
            sequenceLetter: 'a',
            body: 'body_a',
            isCorrect: false,
            isSelected: false,
          },
          {
            sequenceLetter: 'b',
            body: 'body_b',
            isCorrect: true,
            isSelected: false,
          },
          {
            sequenceLetter: 'c',
            body: 'body_c',
            isCorrect: false,
            isSelected: false,
          },
          {
            sequenceLetter: 'd',
            body: 'body_d',
            isCorrect: false,
            isSelected: false,
          },
        ],
        hint: 'test_hint',
        explanation: 'test_explanation',
        isSubmitted: false,
        isAnsweredCorrectly: nil,
        isAnyAnswerSelected: false
      }
    end
    let(:visitor_inputs) do
      {}
    end
    let(:schemaOrg) do
      {
        '@context': 'https://schema.org',
        '@graph': [
          {
            '@type': 'Organization',
            url: 'http://local.skillfind.tech:8080',
            name: 'skillfind.tech',
            sameAs: [
              'https://www.facebook.com/profile.php?id=100091302428884',
              'https://www.linkedin.com/company/skillfind-tech/',
            ]
          },
          # {
          #   '@context': 'https://schema.org',
          #   '@type': 'WebSite',
          #   url: 'http://local.skillfind.tech:8080/questions/test',
          #   inLanguage: 'en',
          #   name: 'test_title',
          #   description: nil,
          #   keywords: nil,
          #   image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
          #   isFamilyFriendly: true
          # },
          {
            '@type': 'QAPage',
            mainEntity: {
              '@type': 'Question',
              # encodingFormat: 'text/markdown',
              name: 'test_title',
              text: 'test_body',
              learningResourceType: 'Practice problem',
              suggestedAnswer: [{:@type=>"Answer", :answerExplanation=>{:@type=>"Comment", :text=>"explanation_a"}, :encodingFormat=>"text/markdown", :position=>0, :text=>"body_a"}, {:@type=>"Answer", :answerExplanation=>{:@type=>"Comment", :text=>"explanation_b"}, :encodingFormat=>"text/markdown", :position=>1, :text=>"body_b"}, {:@type=>"Answer", :answerExplanation=>{:@type=>"Comment", :text=>"explanation_c"}, :encodingFormat=>"text/markdown", :position=>2, :text=>"body_c"}, {:@type=>"Answer", :answerExplanation=>{:@type=>"Comment", :text=>"explanation_d"}, :encodingFormat=>"text/markdown", :position=>3, :text=>"body_d"}],
              :acceptedAnswer=>{:@type=>"Answer", :answerExplanation=>{:@type=>"Comment", :text=>"explanation_b"}, :encodingFormat=>"text/markdown", :position=>1, :text=>"body_b"},
            },
          },
        ],
      }
    end
    let(:openGraph) do
      {
        title: 'test_title',
        keywords: nil,
        description: nil,
        image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
        siteName: 'skillfind.tech',
        url: 'http://local.skillfind.tech:8080/questions/test',
        type: 'website',
        locale: 'en_GB',
        'image:width': 1200,
        'image:height': 630,
        locales: [
          'en_GB',
          'pl_PL',
        ],
      }
    end
    let(:visitor_links) do
      common_links.merge(
        'current/en': {
          href: '/TODO',
        },
        'current/pl': {
          href: '/TODO',
        },
      )
    end
    let(:meta) do
      {
        lang: 'en',
        title: 'test_title',
        keywords: nil,
        description: nil,
        image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
        langs: [
          'en',
          'pl'
        ],
        schemaOrg: schemaOrg,
        openGraph: openGraph,
        robots: 'index,follow,all',
        canonicalUrl: 'http://local.skillfind.tech:8080/questions/test',
        alternateLangLinks: [
          {
            href: 'http://local.skillfind.tech:8080/TODO',
            hrefLang: 'en',
          },
          {
            href: 'http://local.skillfind.tech:8080/TODO',
            hrefLang: 'pl',
          },
        ],
      }
    end
    let(:user_user) do
      {
        accountType: nil, # TODO: Fix nil!
        authorized: true, # TODO: Change to authenticated.
        role: nil,
      }
    end
    let(:admin_user) do
      {
        accountType: nil, # TODO: Fix nil!
        authorized: true, # TODO: Change to authenticated.
        role: 'admin',
      }
    end
    let(:visitor_status) { 200 }
  end
end
