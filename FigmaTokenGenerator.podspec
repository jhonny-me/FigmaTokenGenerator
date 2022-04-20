Pod::Spec.new do |s|
  s.name             = 'FigmaTokenGenerator'
  s.version          = '0.1.2'
  s.summary          = 'Swift Command line tool to generate static strings from a Figma Design Token Json file.'
  s.homepage         = 'https://github.com/jhonny-me/FigmaTokenGenerator'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Johnny Gu' => 'guqiang180@gmail.com' }
  s.source           = { :git => 'https://github.com/jhonny-me/FigmaTokenGenerator.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.5'
  s.source_files = 'Sources/FigmaTokenGenerator/**/*'
  s.preserve_paths = "rswift"
end