lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lacewing'

Gem::Specification.new do |spec|
  spec.name          = 'lacewing'
  spec.version       = Lacewing::VERSION
  spec.authors       = ['cbrnrd']
  spec.email         = ['cbawsome77@gmail.com']
  spec.date          = Time.now.strftime('%Y-%m-%d')

  spec.summary       = '🦗 Your neighborhood bug bounty assistant'
  spec.description   = 'Lacewing is a tool to assist you in your bug bounty adventures.'
  spec.homepage      = 'https://github.com/cbrnrd/lacewing'
  spec.license       = 'MIT'


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'trollop', '~> 2.1.2'
  spec.add_runtime_dependency 'tty-prompt', '~> 0.16.0'
  spec.add_runtime_dependency 'colorize', '~> 0.8.1'
  spec.add_runtime_dependency 'rex-text', '~> 0.2.18'
  spec.add_runtime_dependency 'rex-socket', '0.1.14'
  spec.add_runtime_dependency 'http', '~> 3.0'
end
