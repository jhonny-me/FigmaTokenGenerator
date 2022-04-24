Pod::Spec.new do |s|
  s.name             = 'FigmaTokenGenerator'
  s.version          = '0.1.6'
  s.summary          = 'Swift Command line tool to generate static strings from a Figma Design Token Json file.'
  s.homepage         = 'https://github.com/jhonny-me/FigmaTokenGenerator'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Johnny Gu' => 'guqiang180@gmail.com' }
  s.source           = { :http => "https://github.com/jhonny-me/FigmaTokenGenerator/releases/download/v#{s.version}/FigmaTokenGenerator-v#{s.version}.zip" }
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.5'
  s.preserve_paths = "FigmaTokenGenerator"
end