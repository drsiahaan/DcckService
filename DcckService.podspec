Pod::Spec.new do |s|
  s.name         = 'DcckService'
  s.version      = '0.1.0'
  s.summary      = 'A simple REST API library for Swift.'

  s.description  = <<-DESC
    DcckService is a simple library for handling REST API requests in Swift, including support for application/json and multipart/form-data.
  DESC

  s.homepage     = 'https://github.com/drsiahaan/DcckService'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Dicka Reynaldi' => 'dickareynaldisiahaan@gmail.com' }
  s.source       = { :git => 'https://github.com/drsiahaan/DcckService.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files  = 'DcckService/Classes/**/*'
  s.swift_version = '5.0'
end

