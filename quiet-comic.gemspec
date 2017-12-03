# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "quiet-comic"
  spec.version       = "0.1.0"
  spec.authors       = ["tjjjwxzq"]
  spec.email         = ["aquietimmanence@gmail.com"]

  spec.summary       = %q{A simple webcomic Jekyll theme.}
  spec.homepage      = "https://github.com/tjjjwxzq/quiet-comic"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|setup_files|LICENSE|README|pages_feed.xml|artworks_feed.xml|_config.yml)}i) }
  spec.executables << "quiet-comic-setup"


  spec.add_runtime_dependency "jekyll", "~> 3.6"
  spec.add_runtime_dependency "jekyll-paginate-v2", "~> 1.9"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.1"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
  spec.add_runtime_dependency "jekyll-minimagick", "~> 0"
  spec.add_runtime_dependency "jekyll-last-modified-at", "~> 1"
  spec.add_runtime_dependency "jemoji", "~> 0.8"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
