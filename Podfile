# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'WILLDOM' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WILLDOM

  pod 'Alamofire', '~> 4.7'
  pod 'Player', '~> 0.13.0'
  pod 'SKActivityIndicatorView'
  pod 'AlamofireObjectMapper', '~> 5.2'
  pod 'Randient'
  pod 'AlamofireImage', '~> 3.6'
  pod 'YouTubePlayer'
  pod 'SwiftMessages'
  pod 'MaterialComponents'
  pod 'MDFInternationalization'
  
  
  post_install do |installer|
  installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
  end
  end
  end
  target 'WILLDOMTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WILLDOMUITests' do
    # Pods for testing
  end

end
