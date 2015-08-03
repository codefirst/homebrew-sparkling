class NumberTileGame < BrewSparkling::Recipe::Builder
  github 'austinzheng/iOS-2048', branch: 'master'
  version '1.0'
  bundle_identifier 'f3nghuang.NumberTileGame'

  def build
    Dir.chdir('NumberTileGame') {
      xcodebuild_archive(scheme: 'NumberTileGame')
    }
  end

  patch :DATA
end

__END__
diff --git a/NumberTileGame/NumberTileGame.xcodeproj/project.pbxproj b/NumberTileGame/NumberTileGame.xcodeproj/project.pbxproj
index f90d717..4f156e9 100644
--- a/NumberTileGame/NumberTileGame.xcodeproj/project.pbxproj
+++ b/NumberTileGame/NumberTileGame.xcodeproj/project.pbxproj
@@ -277,9 +277,6 @@
 				CLASSPREFIX = F3H;
 				LastUpgradeCheck = 0510;
 				TargetAttributes = {
-					1A3487AC18DEAD6E00D021C3 = {
-						DevelopmentTeam = GYV39WAN3G;
-					};
 					1A3487D018DEAD6E00D021C3 = {
 						TestTargetID = 1A3487AC18DEAD6E00D021C3;
 					};
diff --git a/NumberTileGame/NumberTileGame.xcodeproj/xcshareddata/xcschemes/NumberTileGame.xcscheme b/NumberTileGame/NumberTileGame.xcodeproj/xcshareddata/xcschemes/NumberTileGame.xcscheme
new file mode 100644
index 0000000..7401354
--- /dev/null
+++ b/NumberTileGame/NumberTileGame.xcodeproj/xcshareddata/xcschemes/NumberTileGame.xcscheme
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
+               BlueprintIdentifier = "1A3487AC18DEAD6E00D021C3"
+               BuildableName = "NumberTileGame.app"
+               BlueprintName = "NumberTileGame"
+               ReferencedContainer = "container:NumberTileGame.xcodeproj">
+            </BuildableReference>
+         </BuildActionEntry>
+      </BuildActionEntries>
+   </BuildAction>
+   <TestAction
+      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
+      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
+      shouldUseLaunchSchemeArgsEnv = "YES"
+      buildConfiguration = "Debug">
+      <Testables>
+         <TestableReference
+            skipped = "NO">
+            <BuildableReference
+               BuildableIdentifier = "primary"
+               BlueprintIdentifier = "1A3487D018DEAD6E00D021C3"
+               BuildableName = "NumberTileGameTests.xctest"
+               BlueprintName = "NumberTileGameTests"
+               ReferencedContainer = "container:NumberTileGame.xcodeproj">
+            </BuildableReference>
+         </TestableReference>
+      </Testables>
+      <MacroExpansion>
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "1A3487AC18DEAD6E00D021C3"
+            BuildableName = "NumberTileGame.app"
+            BlueprintName = "NumberTileGame"
+            ReferencedContainer = "container:NumberTileGame.xcodeproj">
+         </BuildableReference>
+      </MacroExpansion>
+      <AdditionalOptions>
+      </AdditionalOptions>
+   </TestAction>
+   <LaunchAction
+      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
+      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
+      launchStyle = "0"
+      useCustomWorkingDirectory = "NO"
+      buildConfiguration = "Debug"
+      ignoresPersistentStateOnLaunch = "NO"
+      debugDocumentVersioning = "YES"
+      debugServiceExtension = "internal"
+      allowLocationSimulation = "YES">
+      <BuildableProductRunnable
+         runnableDebuggingMode = "0">
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "1A3487AC18DEAD6E00D021C3"
+            BuildableName = "NumberTileGame.app"
+            BlueprintName = "NumberTileGame"
+            ReferencedContainer = "container:NumberTileGame.xcodeproj">
+         </BuildableReference>
+      </BuildableProductRunnable>
+      <AdditionalOptions>
+      </AdditionalOptions>
+   </LaunchAction>
+   <ProfileAction
+      shouldUseLaunchSchemeArgsEnv = "YES"
+      savedToolIdentifier = ""
+      useCustomWorkingDirectory = "NO"
+      buildConfiguration = "Release"
+      debugDocumentVersioning = "YES">
+      <BuildableProductRunnable
+         runnableDebuggingMode = "0">
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "1A3487AC18DEAD6E00D021C3"
+            BuildableName = "NumberTileGame.app"
+            BlueprintName = "NumberTileGame"
+            ReferencedContainer = "container:NumberTileGame.xcodeproj">
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
  PATCH
end
