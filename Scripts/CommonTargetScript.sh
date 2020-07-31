## SwiftLint
#$PODS_ROOT/SwiftLint/swiftlint --config $PROJECT_DIR/../swiftlint.yml

## Generate .strings from code and interface builders
# Incrementally update all Storyboards/XIBs strings files
$PODS_ROOT/BartyCrouch/bartycrouch interfaces -p $PROJECT_DIR/$PROJECT_NAME -v -i

# Add new keys to Localizable.strings files from NSLocalizedString in code
$PODS_ROOT/BartyCrouch/bartycrouch code -p $PROJECT_DIR/$PROJECT_NAME -l $PROJECT_DIR -a -s -k
$PODS_ROOT/BartyCrouch/bartycrouch normalize -p $PROJECT_DIR/$PROJECT_NAME -l en -h -d
#$PODS_ROOT/BartyCrouch/bartycrouch lint -p $PROJECT_DIR/$PROJECT_NAME -e -d

## Generate Localization, Assets and Storyboards Enums
$PODS_ROOT/SwiftGen/bin/swiftgen strings -t structured-swift4 $PROJECT_DIR/../Core/Core/Resources/Localizations/en.lproj/Localizable.strings -o $PROJECT_DIR/../Core/Core/Resources/L10n.swift --param publicAccess

# SwiftGen
$PODS_ROOT/SwiftGen/bin/swiftgen xcassets -t swift4 $PROJECT_DIR/$PROJECT_NAME/Resources/Assets.xcassets  $PROJECT_DIR/$PROJECT_NAME/Resources/Colors.xcassets -o $PROJECT_DIR/$PROJECT_NAME/Resources/Assets.swift

#$PODS_ROOT/SwiftGen/bin/swiftgen ib -t scenes-swift4 $PROJECT_NAME/ -o $PROJECT_DIR/../Presentation/Presentation/Resources/Storyboards.swift --param module=$PROJECT_NAME --param ignoreTargetModule=true --param sceneEnumName=Storyboards

$PODS_ROOT/SwiftGen/bin/swiftgen ib -t scenes-swift4  $PROJECT_NAME/ -o $PROJECT_DIR/$PROJECT_NAME/Resources/"${PROJECT_NAME}Storyboards".swift --param module=$PROJECT_NAME --param ignoreTargetModule=true --param sceneEnumName=Storyboards

$PODS_ROOT/SwiftGen/bin/swiftgen ib -t segues-swift4  $PROJECT_NAME/ -o $PROJECT_DIR/$PROJECT_NAME/Resources/"${PROJECT_NAME}Segues".swift --param module=$PROJECT_NAME

