class Mentio < BrewSparkling::Recipe::Builder
  github 'mhaddl/mentio', branch: 'v2.0.2'
  description 'Mentio for iOS is your personal media wish list, so you never forget a recommendation or a wish. http://mentioapp.com'
  version '2.0.2'
  bundle_identifier 'me.mhaddl.Mentio'

  def build
    Dir.chdir('project') do
      pod('install')
      xcodebuild_archive(scheme: 'Mentio', workspace: 'Mentio.xcworkspace')
    end
  end

  patch :DATA
end

__END__
diff --git a/project/Mentio.xcodeproj/project.pbxproj b/project/Mentio.xcodeproj/project.pbxproj
index d01dbed..ff6a4ef 100644
--- a/project/Mentio.xcodeproj/project.pbxproj
+++ b/project/Mentio.xcodeproj/project.pbxproj
@@ -27,7 +27,6 @@
 		C5B55450190F6EEA00250A9E /* MTItunesClientTests.m in Sources */ = {isa = PBXBuildFile; fileRef = C5B5544F190F6EEA00250A9E /* MTItunesClientTests.m */; };
 		C5B6F9A91AA3091A00CA21A1 /* MTAddViewConstants.swift in Sources */ = {isa = PBXBuildFile; fileRef = C5B6F9A81AA3091A00CA21A1 /* MTAddViewConstants.swift */; };
 		C5BC32DE1AB064D600C9EF93 /* Pods-acknowledgements.plist in Resources */ = {isa = PBXBuildFile; fileRef = C5BC32DD1AB064D600C9EF93 /* Pods-acknowledgements.plist */; };
-		C5CFB77319AF6C3900FCAF2E /* StoreKit.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = C5CFB77219AF6C3900FCAF2E /* StoreKit.framework */; };
 		C5D2AE671906937F00D1FE58 /* UIFont+CustomFontsContentSizes.m in Sources */ = {isa = PBXBuildFile; fileRef = C5D2AE661906937F00D1FE58 /* UIFont+CustomFontsContentSizes.m */; };
 		C5D2AE6A190693A600D1FE58 /* MHAlbumView+RoundCorners.m in Sources */ = {isa = PBXBuildFile; fileRef = C5D2AE69190693A600D1FE58 /* MHAlbumView+RoundCorners.m */; };
 		C5D2AE6D190693F500D1FE58 /* UIAlertView+MTHelpers.m in Sources */ = {isa = PBXBuildFile; fileRef = C5D2AE6C190693F500D1FE58 /* UIAlertView+MTHelpers.m */; };
@@ -140,7 +139,6 @@
 		C5B5544F190F6EEA00250A9E /* MTItunesClientTests.m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; path = MTItunesClientTests.m; sourceTree = "<group>"; };
 		C5B6F9A81AA3091A00CA21A1 /* MTAddViewConstants.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; name = MTAddViewConstants.swift; path = Constants/MTAddViewConstants.swift; sourceTree = "<group>"; };
 		C5BC32DD1AB064D600C9EF93 /* Pods-acknowledgements.plist */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.plist.xml; name = "Pods-acknowledgements.plist"; path = "Pods/Target Support Files/Pods/Pods-acknowledgements.plist"; sourceTree = SOURCE_ROOT; };
-		C5CFB77219AF6C3900FCAF2E /* StoreKit.framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = StoreKit.framework; path = System/Library/Frameworks/StoreKit.framework; sourceTree = SDKROOT; };
 		C5D2AE651906937F00D1FE58 /* UIFont+CustomFontsContentSizes.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; name = "UIFont+CustomFontsContentSizes.h"; path = "Categories/UIFont+CustomFontsContentSizes.h"; sourceTree = "<group>"; };
 		C5D2AE661906937F00D1FE58 /* UIFont+CustomFontsContentSizes.m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; name = "UIFont+CustomFontsContentSizes.m"; path = "Categories/UIFont+CustomFontsContentSizes.m"; sourceTree = "<group>"; };
 		C5D2AE68190693A600D1FE58 /* MHAlbumView+RoundCorners.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; name = "MHAlbumView+RoundCorners.h"; path = "Categories/MHAlbumView+RoundCorners.h"; sourceTree = "<group>"; };
@@ -279,7 +277,6 @@
 			isa = PBXFrameworksBuildPhase;
 			buildActionMask = 2147483647;
 			files = (
-				C5CFB77319AF6C3900FCAF2E /* StoreKit.framework in Frameworks */,
 				C579EC6817FEDE4A00D2C3D7 /* Security.framework in Frameworks */,
 				C579EC6617FEDE4300D2C3D7 /* libsqlite3.dylib in Frameworks */,
 				C579EC3417FEDCFB00D2C3D7 /* UIKit.framework in Frameworks */,
@@ -337,7 +334,6 @@
 		C579EC2E17FEDCFB00D2C3D7 /* Frameworks */ = {
 			isa = PBXGroup;
 			children = (
-				C5CFB77219AF6C3900FCAF2E /* StoreKit.framework */,
 				C54AFAF21808033F0092D9EE /* libPods-FCModel.a */,
 				C533AB4F1808015F00DDF6E5 /* libPods.a */,
 				C579EC6717FEDE4A00D2C3D7 /* Security.framework */,
@@ -703,10 +699,13 @@
 				ORGANIZATIONNAME = "Martin Hartl";
 				TargetAttributes = {
 					C579EC2B17FEDCFB00D2C3D7 = {
-						DevelopmentTeam = 9E8SXF3Y36;
+						DevelopmentTeam = VG2YYSKSHY;
 						SystemCapabilities = {
 							com.apple.BackgroundModes = {
-								enabled = 1;
+								enabled = 0;
+							};
+							com.apple.InAppPurchase = {
+								enabled = 0;
 							};
 						};
 					};
@@ -1104,7 +1103,7 @@
 				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
 				ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME = LaunchImage;
 				CLANG_ENABLE_MODULES = YES;
-				CODE_SIGN_IDENTITY = "iPhone Distribution";
+				CODE_SIGN_IDENTITY = "iPhone Developer";
 				FRAMEWORK_SEARCH_PATHS = (
 					"$(inherited)",
 					"$(PROJECT_DIR)",
diff --git a/project/Mentio.xcodeproj/xcshareddata/xcschemes/Mentio.xcscheme b/project/Mentio.xcodeproj/xcshareddata/xcschemes/Mentio.xcscheme
new file mode 100644
index 0000000..c8d6148
--- /dev/null
+++ b/project/Mentio.xcodeproj/xcshareddata/xcschemes/Mentio.xcscheme
@@ -0,0 +1,101 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<Scheme
+   LastUpgradeVersion = "0700"
+   version = "1.3">
+   <BuildAction
+      parallelizeBuildables = "YES"
+      buildImplicitDependencies = "YES">
+      <BuildActionEntries>
+         <BuildActionEntry
+            buildForTesting = "YES"
+            buildForRunning = "YES"
+            buildForProfiling = "YES"
+            buildForArchiving = "YES"
+            buildForAnalyzing = "YES">
+            <BuildableReference
+               BuildableIdentifier = "primary"
+               BlueprintIdentifier = "C579EC2B17FEDCFB00D2C3D7"
+               BuildableName = "Mentio.app"
+               BlueprintName = "Mentio"
+               ReferencedContainer = "container:Mentio.xcodeproj">
+            </BuildableReference>
+         </BuildActionEntry>
+      </BuildActionEntries>
+   </BuildAction>
+   <TestAction
+      buildConfiguration = "Debug"
+      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
+      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
+      shouldUseLaunchSchemeArgsEnv = "YES">
+      <Testables>
+         <TestableReference
+            skipped = "NO">
+            <BuildableReference
+               BuildableIdentifier = "primary"
+               BlueprintIdentifier = "C579EC4C17FEDCFB00D2C3D7"
+               BuildableName = "MentioTests.xctest"
+               BlueprintName = "MentioTests"
+               ReferencedContainer = "container:Mentio.xcodeproj">
+            </BuildableReference>
+         </TestableReference>
+      </Testables>
+      <MacroExpansion>
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "C579EC2B17FEDCFB00D2C3D7"
+            BuildableName = "Mentio.app"
+            BlueprintName = "Mentio"
+            ReferencedContainer = "container:Mentio.xcodeproj">
+         </BuildableReference>
+      </MacroExpansion>
+      <AdditionalOptions>
+      </AdditionalOptions>
+   </TestAction>
+   <LaunchAction
+      buildConfiguration = "Debug"
+      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
+      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
+      launchStyle = "0"
+      useCustomWorkingDirectory = "NO"
+      ignoresPersistentStateOnLaunch = "NO"
+      debugDocumentVersioning = "YES"
+      debugServiceExtension = "internal"
+      allowLocationSimulation = "YES">
+      <BuildableProductRunnable
+         runnableDebuggingMode = "0">
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "C579EC2B17FEDCFB00D2C3D7"
+            BuildableName = "Mentio.app"
+            BlueprintName = "Mentio"
+            ReferencedContainer = "container:Mentio.xcodeproj">
+         </BuildableReference>
+      </BuildableProductRunnable>
+      <AdditionalOptions>
+      </AdditionalOptions>
+   </LaunchAction>
+   <ProfileAction
+      buildConfiguration = "Release"
+      shouldUseLaunchSchemeArgsEnv = "YES"
+      savedToolIdentifier = ""
+      useCustomWorkingDirectory = "NO"
+      debugDocumentVersioning = "YES">
+      <BuildableProductRunnable
+         runnableDebuggingMode = "0">
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "C579EC2B17FEDCFB00D2C3D7"
+            BuildableName = "Mentio.app"
+            BlueprintName = "Mentio"
+            ReferencedContainer = "container:Mentio.xcodeproj">
+         </BuildableReference>
+      </BuildableProductRunnable>
+   </ProfileAction>
+   <AnalyzeAction
+      buildConfiguration = "Debug">
+   </AnalyzeAction>
+   <ArchiveAction
+      buildConfiguration = "Release"
+      revealArchiveInOrganizer = "YES">
+   </ArchiveAction>
+</Scheme>
diff --git a/project/Mentio/Classes/ViewControllers/MTExportTableViewController.swift b/project/Mentio/Classes/ViewControllers/MTExportTableViewController.swift
index b86ef6b..16ae330 100644
--- a/project/Mentio/Classes/ViewControllers/MTExportTableViewController.swift
+++ b/project/Mentio/Classes/ViewControllers/MTExportTableViewController.swift
@@ -39,11 +39,9 @@ class MTExportTableViewController: UITableViewController {
     // MARK: - Helper

     func exportDatabase() {
-        if let url = NSURL(fileURLWithPath: MTDatabaseManager.databasePath()) {
-            self.interactionController = UIDocumentInteractionController(URL: url)
-            let success = self.interactionController?.presentOptionsMenuFromRect(self.labelExport.bounds, inView: self.view, animated: true)
-
-        }
+        let url = NSURL(fileURLWithPath: MTDatabaseManager.databasePath())
+        self.interactionController = UIDocumentInteractionController(URL: url)
+        let success = self.interactionController?.presentOptionsMenuFromRect(self.labelExport.bounds, inView: self.view, animated: true)

     }
 }
diff --git a/project/Mentio/Resources/Other-Sources/Mentio-Info.plist b/project/Mentio/Resources/Other-Sources/Mentio-Info.plist
index e4931d1..dd62d14 100644
--- a/project/Mentio/Resources/Other-Sources/Mentio-Info.plist
+++ b/project/Mentio/Resources/Other-Sources/Mentio-Info.plist
@@ -51,17 +51,18 @@
 	<key>CFBundleSignature</key>
 	<string>????</string>
 	<key>CFBundleVersion</key>
-	<string>5777</string>
+	<string>5783</string>
 	<key>LSRequiresIPhoneOS</key>
 	<true/>
+	<key>NSAppTransportSecurity</key>
+	<dict>
+		<key>NSAllowsArbitraryLoads</key>
+		<true/>
+	</dict>
 	<key>UIAppFonts</key>
 	<array>
 		<string>ABeeZee-Regular.ttf</string>
 	</array>
-	<key>UIBackgroundModes</key>
-	<array>
-		<string>fetch</string>
-	</array>
 	<key>UIFileSharingEnabled</key>
 	<true/>
 	<key>UIMainStoryboardFile</key>
