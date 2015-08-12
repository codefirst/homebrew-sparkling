class Cling < BrewSparkling::Recipe::Builder
  github 'suer/cling', branch: '3be2bf34ac19413e503ca1d9b83f71401915ac4c'
  description 'a web page viewer on iOS, that rotates sites every minutes.'
  version '1.0'
  bundle_identifiers %w(org.codefirst.cling org.codefirst.cling.AddToClingActionExtension)

  def build
    pod 'install'
    xcodebuild_archive(scheme: 'cling', workspace: 'cling.xcworkspace')
  end

  patch :DATA
end

__END__
diff --git a/AddToClingActionExtension/AddToClingActionExtension.entitlements b/AddToClingActionExtension/AddToClingActionExtension.entitlements
index ee6b1c8..0c67376 100644
--- a/AddToClingActionExtension/AddToClingActionExtension.entitlements
+++ b/AddToClingActionExtension/AddToClingActionExtension.entitlements
@@ -1,10 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.codefirst.ClingExtension</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/cling.xcodeproj/project.pbxproj b/cling.xcodeproj/project.pbxproj
index e645289..c9ccfe9 100644
--- a/cling.xcodeproj/project.pbxproj
+++ b/cling.xcodeproj/project.pbxproj
@@ -382,7 +382,7 @@
 						CreatedOnToolsVersion = 6.0;
 						SystemCapabilities = {
 							com.apple.ApplicationGroups.iOS = {
-								enabled = 1;
+								enabled = 0;
 							};
 						};
 					};
@@ -390,7 +390,7 @@
 						CreatedOnToolsVersion = 6.0;
 						SystemCapabilities = {
 							com.apple.ApplicationGroups.iOS = {
-								enabled = 1;
+								enabled = 0;
 							};
 						};
 					};
@@ -580,7 +580,6 @@
 			buildSettings = {
 				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
 				ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME = LaunchImage;
-				CODE_SIGN_ENTITLEMENTS = AddToClingActionExtension/AddToClingActionExtension.entitlements;
 				CODE_SIGN_IDENTITY = "iPhone Developer";
 				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
 				GCC_PREPROCESSOR_DEFINITIONS = (
@@ -600,7 +599,6 @@
 			buildSettings = {
 				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
 				ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME = LaunchImage;
-				CODE_SIGN_ENTITLEMENTS = AddToClingActionExtension/AddToClingActionExtension.entitlements;
 				CODE_SIGN_IDENTITY = "iPhone Developer";
 				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
 				INFOPLIST_FILE = AddToClingActionExtension/Info.plist;
@@ -697,7 +695,6 @@
 				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
 				ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME = LaunchImage;
 				CLANG_ENABLE_MODULES = YES;
-				CODE_SIGN_ENTITLEMENTS = cling/cling.entitlements;
 				CODE_SIGN_IDENTITY = "iPhone Developer";
 				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
 				INFOPLIST_FILE = cling/Info.plist;
@@ -717,7 +714,6 @@
 				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
 				ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME = LaunchImage;
 				CLANG_ENABLE_MODULES = YES;
-				CODE_SIGN_ENTITLEMENTS = cling/cling.entitlements;
 				CODE_SIGN_IDENTITY = "iPhone Developer";
 				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
 				INFOPLIST_FILE = cling/Info.plist;
diff --git a/cling/cling.entitlements b/cling/cling.entitlements
index ee6b1c8..0c67376 100644
--- a/cling/cling.entitlements
+++ b/cling/cling.entitlements
@@ -1,10 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.codefirst.ClingExtension</string>
-	</array>
-</dict>
+<dict/>
 </plist>
