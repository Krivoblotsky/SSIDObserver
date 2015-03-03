Pod::Spec.new do |s|
  s.name         = "SSIDObserver"
  s.version      = "0.0.1"
  s.summary      = "iOS Wi-Fi network SSID observer"
  s.homepage     = "https://github.com/Krivoblotsky/SSIDObserver"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = { "Serg Krivoblotsky" => "krivoblotsky@me.com" }
  s.source       = { :git => "https://github.com/Krivoblotsky/SSIDObserver.git",
		                 :tag => s.version.to_s }
  s.source_files = 'SSID/*.{h,m}'
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  s.frameworks   = 'SystemConfiguration'
end