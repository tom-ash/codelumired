require_relative 'lib/codelumi/version'

Gem::Specification.new do |spec|
  spec.name        = 'codelumi'
  spec.version     = Codelumi::VERSION
  spec.authors     = ['tom-ash']
  spec.email       = ['tomasz.bogusz@outlook.com']
  spec.summary     = ''
  spec.license     = ''

  spec.metadata['allowed_push_host'] = ''

  spec.add_dependency 'rails', '~> 6.1.3'
end
