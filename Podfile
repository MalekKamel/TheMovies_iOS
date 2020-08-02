platform :ios, '11.0'

use_frameworks!

workspace 'Posts'

#core module
def core_pods
  pod 'BulletinBoard'
  pod 'SwiftLint', :configurations => ['Debug']
  pod 'SwiftGen', '6.1.0', :configurations => ['Debug']
  pod 'BartyCrouch', '3.13.0', :configurations => ['Debug']
  pod 'RxSwift',    '~> 5.0'
  pod 'Moya/RxSwift', '~> 14.0.0'
  pod 'IQKeyboardManager'
  pod 'RxRequester/Moya', '~> 0.4.0'

end

target 'Core' do
    project 'Core/Core.project'
    pod 'Crashlytics', '3.14.0'

#    core_pods
end

#presentation module
def presentation_pods
    core_pods
    pod 'SwiftMessages'
    pod 'SDWebImage', '4.4.2'
    pod 'SnapKit', '~> 4.0'
    pod 'FLEX', '2.4', :configurations => ['Debug']
    pod 'Layout', '~> 0.6'
    pod 'CountryPickerSwift'
    pod 'WMSegmentControl'
    pod 'MaterialComponents/BottomSheet'
end

target 'Presentation' do
    project 'Presentation/Presentation.project'
    presentation_pods
end

#data module
def data_pods
    core_pods
    pod 'RealmSwift'
end

target 'Data' do
    project 'Data/Data.project'
    data_pods
    pod 'ModelsMapper'
end

#app module
def app_pods
    core_pods
    pod 'GoogleMaps'
    pod 'GooglePlaces'
end

def test_pods
  pod 'RxTest'
  pod 'RxBlocking'
end

target 'App' do
    project 'App/App.project'
    app_pods
    presentation_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
    end
  end
end
