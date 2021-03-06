#
# Be sure to run `pod lib lint Celio.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Celio'
  s.version          = '0.1.0'
  s.summary          = 'A framework for advanced Operations usage https://developer.apple.com/videos/wwdc/2015/?id=226'
  s.swift_version = '4.1'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  
  Celio is a framework that leverages the power of Operation and OperationQueue. It enables you to use operations more easily in all parts of your project.
  This is an adaptation of the sample code provided in the Advanced NSOperations session of WWDC 2015.
                       DESC

  s.homepage         = 'https://github.com/j3patel/Celio'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'j3patel' => 'jatinpatel101@gmail.com' }
  s.source           = { :git => 'https://github.com/j3patel/Celio.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Celio/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Celio' => ['Celio/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
