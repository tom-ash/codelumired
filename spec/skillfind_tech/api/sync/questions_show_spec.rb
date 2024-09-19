# frozen_string_literal: true

require 'skillfind_tech/rails_helper'
require_relative './shared_contexts/sync.rb'

# TODO!
RSpec.describe ::SkillfindTech::Api::Sync do
  describe 'questionsShow' do
    include_context 'skillfind_tech_sync'

    let!(:question) {create(:question) }

    let(:route) { 'javascript/practice-problems/test' }
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
        signOutButtonLabel: 'Sign Out',
        showMyAccountMenuButtonLabel: 'My account',
        allRightsReserved: '',
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
        title: 'test_title',
        type: 'singleChoice',
        body: 'test_body',
        answers: [
          {
            position: 0,
            body: 'body_a',
            isCorrect: false,
            isSelected: false,
            explanation: 'explanation_a',
            hint: nil,
          },
          {
            position: 1,
            body: 'body_b',
            isCorrect: true,
            isSelected: false,
            explanation: 'explanation_b',
            hint: nil,
          },
          {
            position: 2,
            body: 'body_c',
            isCorrect: false,
            isSelected: false,
            explanation: 'explanation_c',
            hint: nil,
          },
          {
            position: 3,
            body: 'body_d',
            isCorrect: false,
            isSelected: false,
            explanation: 'explanation_d',
            hint: nil,
          },
        ],
        hint: 'test_hint',
        isSubmitted: false,
        isAnsweredCorrectly: nil,
        isSingleChoice: true,
        isMultipleChoice: false,
        isAnyAnswerSelected: false,
        breadcrumbs: [
          {
            name: 'Homepage',
            lang: 'en',
            item: '/',
          },
          {
            name: 'JavaScript',
            lang: 'en',
            item: '/javascript',
          },
          {
            name: 'practice-problems',
            lang: 'en',
            item: '/javascript/practice-problems',
          }
        ]
      }
    end
    let(:visitor_inputs) do
      {}
    end
    let(:schemaOrg) do
      {
        :@context=>"https://schema.org",
        :@graph=>[
          {
            :@type=>"Organization",
            :url=>"http://local.skillfind.tech:8080",
            :name=>"skillfind.tech",
            :sameAs=>[
              "https://www.facebook.com/profile.php?id=100091302428884",
              "https://www.linkedin.com/company/skillfind-tech/"
            ]
          },
          {
            '@type': 'Quiz',
            name: 'test_title',
            hasPart: {
              '@type': 'Question',
              eduQuestionType: 'Multiple choice',
              educationalAlignment: [
                {
                  '@type': 'AlignmentObject',
                  alignmentType: 'educationalSubject',
                  targetName: 'Programming',
                },
                {
                  '@type': 'AlignmentObject',
                  alignmentType: 'educationalSubject',
                  targetName: 'Software Engineering',
                },
                {
                  '@type': 'AlignmentObject',
                  alignmentType: 'educationalSubject',
                  targetName: 'JavaScript',
                }
              ],
              typicalAgeRange: '15-99',
              educationalLevel: 'beginner',
              assesses: 'test_assesses',
              comment: {
                '@type': 'Comment',
                encodingFormat: 'text/markdown',
                text: 'test_hint',
              },
              learningResourceType: 'Practice problem',
              name: 'test_title',
              encodingFormat: 'text/markdown',
              text: 'test_body',
              suggestedAnswer: [
                {
                  '@type': 'Answer',
                  position: 0,
                  encodingFormat: 'text/markdown',
                  text: 'body_a',
                  comment: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: nil,
                  },
                  answerExplanation: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: 'explanation_a',
                  }
                },
                {
                  '@type': 'Answer',
                  position: 2,
                  encodingFormat: 'text/markdown',
                  text: 'body_c',
                  comment: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: nil,
                  },
                  answerExplanation: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: 'explanation_c',
                  }
                },
                {
                  '@type': 'Answer',
                  position: 3,
                  encodingFormat: 'text/markdown',
                  text: 'body_d',
                  comment: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: nil,
                  },
                  answerExplanation: {
                    '@type': 'Comment',
                    encodingFormat: 'text/markdown',
                    text: 'explanation_d',
                  }
                },
              ],
              acceptedAnswer: {
                '@type': 'Answer',
                position: 1,
                encodingFormat: 'text/markdown',
                text: 'body_b',
                comment: {
                  '@type': 'Comment',
                  encodingFormat: 'text/markdown',
                  text: nil,
                },
                answerExplanation: {
                  '@type': 'Comment',
                  encodingFormat: 'text/markdown',
                  text: 'explanation_b',
                }
              },
            }
          }
        ]
      }
    end
    let(:openGraph) do
      {
        title: 'test_title',
        keywords: nil,
        description: 'test_description',
        image: 'https://skillfind-tech.s3.eu-central-1.amazonaws.com/images/skillfind-tech.jpeg',
        siteName: 'skillfind.tech',
        url: 'http://local.skillfind.tech:8080/javascript/practice-problems/test',
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
        facebook: {
          external: true,
          href: 'https://www.facebook.com/profile.php?id=100091302428884',
        },
        linkedin: {
          external: true,
          href: 'https://www.linkedin.com/company/skillfind-tech/'
        },
      )
    end
    let(:meta) do
      {
        lang: 'en',
        title: 'test_title',
        keywords: nil,
        description: 'test_description',
        image: 'https://skillfind-tech.s3.eu-central-1.amazonaws.com/images/skillfind-tech.jpeg',
        langs: [
          'en',
          'pl'
        ],
        schemaOrg: schemaOrg,
        openGraph: openGraph,
        robots: 'index,follow,all',
        canonicalUrl: 'http://local.skillfind.tech:8080/javascript/practice-problems/test',
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
