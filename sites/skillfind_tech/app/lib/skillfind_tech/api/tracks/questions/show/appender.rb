# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Questions
        module Show
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Questions::Show::Meta

            private

            def data
              {
                title: 'npm start',
                body: 'What is the purpose of the "npm start" command in a Node.js project?',
                hint: 'https://docs.npmjs.com/cli/v7/commands/npm-start',
                answers: [
                  'To install new npm packages globally.',
                  'To start the Node.js REPL (Read-Eval-Print Loop).',
                  'To run the tests defined in the project.',
                  'To start the application as defined in the "scripts" section of the package.json file.',
                ],
                explanation: 'The "npm start" command is a script defined in the "scripts" section of the package.json file in a Node.js project. This script is typically used to start the application. When you run "npm start," npm looks for a script named "start" in the "scripts" section and executes the command specified there. It is a common convention to use "npm start" for starting the main application in a project. This is particularly useful for web applications, servers, or any other Node.js application where starting the application is a common task during development or deployment.',
              }
            end
          end
        end
      end
    end
  end
end
