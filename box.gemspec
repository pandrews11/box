Gem::Specification.new do |s|
  s.name        = 'box'
  s.version     = '0.0.0'
  s.summary     = 'Unofficial Pandora API'
  s.description = 'Small wrapper for the unofficial Pandora API'
  s.authors     = ['Patrick Andrews']
  s.email       = 'pandrews@fandm.edu'
  s.files       = [
    'lib/box.rb',
    'lib/box/partner.rb',
    'lib/box/request.rb',
    'lib/box/response.rb'
  ]
  s.homepage    =
    'http://rubygems.org/gems/box'
  s.license       = 'MIT'

  s.required_ruby_version = '>= 2.2.0'
  s.add_runtime_dependency 'activesupport'
  s.add_runtime_dependency 'crypt'
end
