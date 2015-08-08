class Swifteroid < BrewSparkling::Recipe::Builder
  github 'eugenpirogoff/swifteroid', branch: '6522b3480e3e96950a890fbd4cb31f9c1be9add0'
  version '1.0'
  bundle_identifier 'me.pirogoff.Swifteroid'

  def build
    Dir.chdir('Swifteroid') do
      xcodebuild_archive(scheme: 'Swifteroid')
    end
  end

  patch :DATA
end

__END__
diff --git a/Swifteroid/Swifteroid.xcodeproj/project.pbxproj b/Swifteroid/Swifteroid.xcodeproj/project.pbxproj
index 205aeb1..ed6f068 100644
--- a/Swifteroid/Swifteroid.xcodeproj/project.pbxproj
+++ b/Swifteroid/Swifteroid.xcodeproj/project.pbxproj
@@ -165,7 +165,6 @@
 				TargetAttributes = {
 					4CCD55AF1B27159F0068FFE9 = {
 						CreatedOnToolsVersion = 6.3.2;
-						DevelopmentTeam = 6E5RVX7ELK;
 					};
 					4CCD55C41B27159F0068FFE9 = {
 						CreatedOnToolsVersion = 6.3.2;
diff --git a/Swifteroid/Swifteroid.xcodeproj/xcshareddata/xcschemes/Swifteroid.xcscheme b/Swifteroid/Swifteroid.xcodeproj/xcshareddata/xcschemes/Swifteroid.xcscheme
new file mode 100644
index 0000000..78919c0
--- /dev/null
+++ b/Swifteroid/Swifteroid.xcodeproj/xcshareddata/xcschemes/Swifteroid.xcscheme
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
+               BlueprintIdentifier = "4CCD55AF1B27159F0068FFE9"
+               BuildableName = "Swifteroid.app"
+               BlueprintName = "Swifteroid"
+               ReferencedContainer = "container:Swifteroid.xcodeproj">
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
+               BlueprintIdentifier = "4CCD55C41B27159F0068FFE9"
+               BuildableName = "SwifteroidTests.xctest"
+               BlueprintName = "SwifteroidTests"
+               ReferencedContainer = "container:Swifteroid.xcodeproj">
+            </BuildableReference>
+         </TestableReference>
+      </Testables>
+      <MacroExpansion>
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "4CCD55AF1B27159F0068FFE9"
+            BuildableName = "Swifteroid.app"
+            BlueprintName = "Swifteroid"
+            ReferencedContainer = "container:Swifteroid.xcodeproj">
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
+            BlueprintIdentifier = "4CCD55AF1B27159F0068FFE9"
+            BuildableName = "Swifteroid.app"
+            BlueprintName = "Swifteroid"
+            ReferencedContainer = "container:Swifteroid.xcodeproj">
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
+            BlueprintIdentifier = "4CCD55AF1B27159F0068FFE9"
+            BuildableName = "Swifteroid.app"
+            BlueprintName = "Swifteroid"
+            ReferencedContainer = "container:Swifteroid.xcodeproj">
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
diff --git a/Swifteroid/Swifteroid/SwifteroidController.swift b/Swifteroid/Swifteroid/SwifteroidController.swift
index 96352ba..eb10d0c 100644
--- a/Swifteroid/Swifteroid/SwifteroidController.swift
+++ b/Swifteroid/Swifteroid/SwifteroidController.swift
@@ -75,7 +75,7 @@ class SwifteroidController {
                 if error == nil {
                     let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)

-                    let metadata:NSDictionary = CMCopyDictionaryOfAttachments(nil, sampleBuffer, CMAttachmentMode(kCMAttachmentMode_ShouldPropagate))!.takeUnretainedValue()
+                    let metadata:NSDictionary = CMCopyDictionaryOfAttachments(nil, sampleBuffer, CMAttachmentMode(kCMAttachmentMode_ShouldPropagate))!

                     if let image = UIImage(data: imageData) {
                         dispatch_async(dispatch_get_main_queue()) { () -> Void in
