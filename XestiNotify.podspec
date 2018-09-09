Pod::Spec.new do |s|
  s.name                = 'XestiNotify'
  s.version             = '0.1.0'
  s.swift_version       = '4.0'
  s.authors             = { 'J. G. Pusey' => 'ebardx@gmail.com' }
  s.license             = { :type => 'MIT',
                            :file => 'LICENSE.md' }
  s.homepage            = 'https://github.com/eBardX/XestiNotify'
  s.source              = { :git => 'https://github.com/eBardX/XestiNotify.git',
                            :tag => "v#{s.version}" }
  s.summary             = '...'
  s.documentation_url   = 'https://ebardx.github.io/XestiNotify/'

  s.ios.deployment_target       = '8.0'
  s.osx.deployment_target       = '10.10'
  s.tvos.deployment_target      = '9.0'
  s.watchos.deployment_target   = '2.0'

  s.requires_arc        = true

  s.ios.frameworks      = 'Foundation'
  s.osx.frameworks      = 'Foundation'
  s.tvos.frameworks     = 'Foundation'
  s.watchos.frameworks  = 'Foundation'

  s.source_files        = 'Sources/XestiNotify/**/*.swift'
end
