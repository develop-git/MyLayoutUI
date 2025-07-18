#
# Be sure to run `pod lib lint MyLayoutUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MyLayoutUI'
  s.version          = '1.0.0'
  s.summary          = 'A short description of MyLayoutUI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/develop-git/MyLayoutUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '承轩' => 'develop-work@outlook.com' }
  s.source           = { :git => 'https://github.com/develop-git/MyLayoutUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.source_files = 'MyLayoutUI/Classes/**/*'
  
 s.requires_arc = true
   
   s.ios.deployment_target = '11.0'

   s.swift_versions = ['5.5']
   
   s.dependency 'TangramKit', '~> 1.4.2'

   s.xcconfig = {
       'LIBRARY_SEARCH_PATHS' => '$(SDKROOT)/usr/lib/swift',
   }
end
