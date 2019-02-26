Pod::Spec.new do |s|
	
  s.name             = "OSXTableKit"
  s.version          = "0.1.0"
  s.summary          = "NSTableView wrapper for managing iOS-like style tables on OS X and macOS."
  s.homepage         = "https://github.com/GDXRepo/OSXTableKit"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Georgiy Malyukov" => "elvorta.work@gmail.com" }
  s.source           = { :git => "https://github.com/GDXRepo/OSXTableKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://habr.com/ru/users/gdxrepo/'

  s.platform      = :osx, '10.10'
  s.swift_version = '4.2'
  s.requires_arc  = true

  s.resources = ['OSXTableKit/Pod/Assets/*.xcassets', 'OSXTableKit/Pod/Assets/*.strings']
  s.source_files = 'OSXTableKit/Pod/Classes/**/*'

end
