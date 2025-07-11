#
#  Be sure to run `pod spec lint NTLMessagePacker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "NTLMessagePacker"
  s.version      = "0.4.8"
  s.summary      = "MessagePack serializer implementation for Swift."
  s.homepage     = "https://github.com/netless-io/MessagePacker"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "hirotakan"
  s.ios.deployment_target = "11.0"

  s.swift_version  = "5.0"
  s.source       = { :git => "https://github.com/netless-io/MessagePacker.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.swift"
end
