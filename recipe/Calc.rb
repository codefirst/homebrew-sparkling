class Calc < BrewSparkling::Recipe::Builder
  github 'noodlewerk/Apple_Watch_Calculator', branch: 'master'
  version '1.0'
  bundle_identifiers %w(com.noodlewerk.Calc com.noodlewerk.Calc.watchapp com.noodlewerk.Calc.watchkitextension)

  def build
    xcodebuild_archive(scheme: 'Calc')
  end

  patch :DATA
end

__END__
diff --git a/Calc.xcodeproj/xcshareddata/xcschemes/Calc.xcscheme b/Calc.xcodeproj/xcshareddata/xcschemes/Calc.xcscheme
new file mode 100644
index 0000000..a284134
--- /dev/null
+++ b/Calc.xcodeproj/xcshareddata/xcschemes/Calc.xcscheme
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
+               BlueprintIdentifier = "AB6D803D1A2CBB980037A227"
+               BuildableName = "Calc.app"
+               BlueprintName = "Calc"
+               ReferencedContainer = "container:Calc.xcodeproj">
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
+               BlueprintIdentifier = "AB6D80521A2CBB980037A227"
+               BuildableName = "CalcTests.xctest"
+               BlueprintName = "CalcTests"
+               ReferencedContainer = "container:Calc.xcodeproj">
+            </BuildableReference>
+         </TestableReference>
+      </Testables>
+      <MacroExpansion>
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "AB6D803D1A2CBB980037A227"
+            BuildableName = "Calc.app"
+            BlueprintName = "Calc"
+            ReferencedContainer = "container:Calc.xcodeproj">
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
+            BlueprintIdentifier = "AB6D803D1A2CBB980037A227"
+            BuildableName = "Calc.app"
+            BlueprintName = "Calc"
+            ReferencedContainer = "container:Calc.xcodeproj">
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
+            BlueprintIdentifier = "AB6D803D1A2CBB980037A227"
+            BuildableName = "Calc.app"
+            BlueprintName = "Calc"
+            ReferencedContainer = "container:Calc.xcodeproj">
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
