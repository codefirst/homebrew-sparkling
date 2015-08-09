class StickHero < BrewSparkling::Recipe::Builder
  github 'phpmaple/Stick-Hero-Swift', branch: '0935f4924854c84ee97262457b9e975b874846e8'
  description 'a universal iOS Game using Swift and iOS SpriteKit'
  version '1.0'
  bundle_identifier 'koofrank.ios.Stick-Hero'
  executable_name 'Stick-Hero.app'

  def build
    xcodebuild_archive(scheme: 'Stick-Hero')
  end

  patch :DATA
end

__END__
diff --git a/Stick-Hero.xcodeproj/xcshareddata/xcschemes/Stick-Hero.xcscheme b/Stick-Hero.xcodeproj/xcshareddata/xcschemes/Stick-Hero.xcscheme
new file mode 100644
index 0000000..90bf9a8
--- /dev/null
+++ b/Stick-Hero.xcodeproj/xcshareddata/xcschemes/Stick-Hero.xcscheme
@@ -0,0 +1,91 @@
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
+               BlueprintIdentifier = "73B7AD561B33BEC400115CAD"
+               BuildableName = "Stick-Hero.app"
+               BlueprintName = "Stick-Hero"
+               ReferencedContainer = "container:Stick-Hero.xcodeproj">
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
+      </Testables>
+      <MacroExpansion>
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "73B7AD561B33BEC400115CAD"
+            BuildableName = "Stick-Hero.app"
+            BlueprintName = "Stick-Hero"
+            ReferencedContainer = "container:Stick-Hero.xcodeproj">
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
+            BlueprintIdentifier = "73B7AD561B33BEC400115CAD"
+            BuildableName = "Stick-Hero.app"
+            BlueprintName = "Stick-Hero"
+            ReferencedContainer = "container:Stick-Hero.xcodeproj">
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
+            BlueprintIdentifier = "73B7AD561B33BEC400115CAD"
+            BuildableName = "Stick-Hero.app"
+            BlueprintName = "Stick-Hero"
+            ReferencedContainer = "container:Stick-Hero.xcodeproj">
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
