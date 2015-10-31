# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'box/version'

Gem::Specification.new do |s|
  s.name = 'box'
  s.version = Box::VERSION
  s.summary = 'Unofficial Pandora API'
  s.description = 'Small wrapper for the unofficial Pandora API'
  s.authors = ['Patrick Andrews']
  s.homepage = 'http://rubygems.org/gems/box'
  s.license = 'MIT'
  s.email = 'pandrews@fandm.edu'

  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 2.2.0'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.add_runtime_dependency 'activesupport'
  s.add_runtime_dependency 'crypt'
end