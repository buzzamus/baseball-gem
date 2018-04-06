
lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baseball/version'

Gem::Specification.new do |spec|
  spec.name          = 'baseball'
  spec.version       = Baseball::VERSION
  spec.authors       = ['Brent Busby']
  spec.email         = ['brentbusby86@gmail.com']
  spec.summary       = 'a Ruby Gem library for calculating baseball statistics'
  spec.homepage      = 'https://github.com/buzzamus/baseball-gem'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
end
