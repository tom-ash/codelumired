require_relative 'lib/soundof_it/version'

Gem::Specification.new do |spec|
  spec.name        = 'soundof_it'
  spec.version     = SoundofIt::VERSION
  spec.authors     = ['tom-ash']
  spec.email       = ['tomasz.bogusz@outlook.com']
  spec.summary     = ''
  spec.license     = ''

  spec.metadata['allowed_push_host'] = ''

  spec.add_dependency 'rails', '~> 6.1.3'
end
