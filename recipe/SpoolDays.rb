class SpoolDays < BrewSparkling::Recipe::Builder
  github 'suer/spool-days', branch: '737455cccf3e8bfd36304c07812dcec5b9f1f4e0'
  description 'date count up/down application for iOS'
  version '1.0'
  bundle_identifiers %w(org.codefirst.SpoolDays org.codefirst.SpoolDays.SpoolDaysTodayExtension)

  def build
    pod 'install'
    Dir.chdir('SpoolDays') do
      system 'cp', 'preference.plist.example', 'preference.plist'
    end
    xcodebuild_archive(scheme: 'SpoolDays', workspace: 'SpoolDays.xcworkspace')
  end

  patch :DATA
end

__END__
diff --git a/SpoolDays.xcodeproj/project.pbxproj b/SpoolDays.xcodeproj/project.pbxproj
index 60e6735..bf39240 100644
--- a/SpoolDays.xcodeproj/project.pbxproj
+++ b/SpoolDays.xcodeproj/project.pbxproj
@@ -381,7 +381,7 @@
 						CreatedOnToolsVersion = 6.1;
 						SystemCapabilities = {
 							com.apple.ApplicationGroups.iOS = {
-								enabled = 1;
+								enabled = 0;
 							};
 						};
 					};
@@ -389,10 +389,10 @@
 						CreatedOnToolsVersion = 6.0.1;
 						SystemCapabilities = {
 							com.apple.ApplicationGroups.iOS = {
-								enabled = 1;
+								enabled = 0;
 							};
 							com.apple.BackgroundModes = {
-								enabled = 1;
+								enabled = 0;
 							};
 						};
 					};
@@ -625,8 +625,8 @@
 			isa = XCBuildConfiguration;
 			baseConfigurationReference = 28ED91F5F3718D86CF27B399 /* Pods.debug.xcconfig */;
 			buildSettings = {
-				CODE_SIGN_ENTITLEMENTS = SpoolDaysTodayExtension/SpoolDaysTodayExtension.entitlements;
 				CODE_SIGN_IDENTITY = "iPhone Developer";
+				ENABLE_BITCODE = NO;
 				GCC_PREPROCESSOR_DEFINITIONS = (
 					"DEBUG=1",
 					"$(inherited)",
@@ -674,8 +674,8 @@
 			isa = XCBuildConfiguration;
 			baseConfigurationReference = 51761DB67EF34A17DB7EAEF3 /* Pods.release.xcconfig */;
 			buildSettings = {
-				CODE_SIGN_ENTITLEMENTS = SpoolDaysTodayExtension/SpoolDaysTodayExtension.entitlements;
 				CODE_SIGN_IDENTITY = "iPhone Developer";
+				ENABLE_BITCODE = NO;
 				GCC_PREPROCESSOR_DEFINITIONS = (
 					"$(inherited)",
 					"COCOAPODS=1",
@@ -803,10 +803,10 @@
 			buildSettings = {
 				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
 				CLANG_ENABLE_MODULES = YES;
-				CODE_SIGN_ENTITLEMENTS = SpoolDays/SpoolDays.entitlements;
 				CODE_SIGN_IDENTITY = "iPhone Developer";
 				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
 				EMBEDDED_CONTENT_CONTAINS_SWIFT = YES;
+				ENABLE_BITCODE = NO;
 				INFOPLIST_FILE = SpoolDays/Info.plist;
 				IPHONEOS_DEPLOYMENT_TARGET = 8.0;
 				LD_RUNPATH_SEARCH_PATHS = "$(inherited) @executable_path/Frameworks";
@@ -827,10 +827,10 @@
 			buildSettings = {
 				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
 				CLANG_ENABLE_MODULES = YES;
-				CODE_SIGN_ENTITLEMENTS = SpoolDays/SpoolDays.entitlements;
 				CODE_SIGN_IDENTITY = "iPhone Developer";
 				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
 				EMBEDDED_CONTENT_CONTAINS_SWIFT = YES;
+				ENABLE_BITCODE = NO;
 				INFOPLIST_FILE = SpoolDays/Info.plist;
 				IPHONEOS_DEPLOYMENT_TARGET = 8.0;
 				LD_RUNPATH_SEARCH_PATHS = "$(inherited) @executable_path/Frameworks";
diff --git a/SpoolDays/Info.plist b/SpoolDays/Info.plist
index 227e97e..e20bfff 100644
--- a/SpoolDays/Info.plist
+++ b/SpoolDays/Info.plist
@@ -35,10 +35,6 @@
 	<string>15</string>
 	<key>LSRequiresIPhoneOS</key>
 	<true/>
-	<key>UIBackgroundModes</key>
-	<array>
-		<string>fetch</string>
-	</array>
 	<key>UILaunchStoryboardName</key>
 	<string>LaunchScreen</string>
 	<key>UIRequiredDeviceCapabilities</key>
diff --git a/SpoolDays/SpoolDays.entitlements b/SpoolDays/SpoolDays.entitlements
index a243079..0c67376 100644
--- a/SpoolDays/SpoolDays.entitlements
+++ b/SpoolDays/SpoolDays.entitlements
@@ -1,10 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.codefirst.SpoolDaysExtension</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/SpoolDaysTodayExtension/SpoolDaysTodayExtension.entitlements b/SpoolDaysTodayExtension/SpoolDaysTodayExtension.entitlements
index a243079..0c67376 100644
--- a/SpoolDaysTodayExtension/SpoolDaysTodayExtension.entitlements
+++ b/SpoolDaysTodayExtension/SpoolDaysTodayExtension.entitlements
@@ -1,10 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.codefirst.SpoolDaysExtension</string>
-	</array>
-</dict>
+<dict/>
 </plist>
