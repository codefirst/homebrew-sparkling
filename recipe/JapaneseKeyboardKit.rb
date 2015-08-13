class JapaneseKeyboardKit < BrewSparkling::Recipe::Builder
  github 'kishikawakatsumi/JapaneseKeyboardKit', branch: '2f1b0348433412079899df0dcaada9059b19151e'
  description 'Sample implementation for iOS Custom Keyboard Extension with Mozc (Google Japanese Input)'
  version '1.0'
  bundle_identifiers %w(com.kishikawakatsumi.JapaneseKeyboardKit com.kishikawakatsumi.JapaneseKeyboardKit.JPKB)

  def build
    system 'git clone https://github.com/kishikawakatsumi/Mozc-for-iOS.git'

    Dir.chdir('Mozc-for-iOS/src') do
      system 'python', 'build_mozc.py', 'gyp'
      system 'python', 'build_mozc_ios.py'
    end

    xcodebuild_archive(scheme: 'JapaneseKeyboardKit')
  end

  patch :DATA
end

__END__
diff --git a/JapaneseKeyboardKit.xcodeproj/xcshareddata/xcschemes/JPKB.xcscheme b/JapaneseKeyboardKit.xcodeproj/xcshareddata/xcschemes/JPKB.xcscheme
new file mode 100644
index 0000000..ff0dcc5
--- /dev/null
+++ b/JapaneseKeyboardKit.xcodeproj/xcshareddata/xcschemes/JPKB.xcscheme
@@ -0,0 +1,108 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<Scheme
+   LastUpgradeVersion = "0700"
+   wasCreatedForAppExtension = "YES"
+   version = "2.0">
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
+               BlueprintIdentifier = "14E6570519D823FD00A74B85"
+               BuildableName = "JPKB.appex"
+               BlueprintName = "JPKB"
+               ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
+            </BuildableReference>
+         </BuildActionEntry>
+         <BuildActionEntry
+            buildForTesting = "YES"
+            buildForRunning = "YES"
+            buildForProfiling = "YES"
+            buildForArchiving = "YES"
+            buildForAnalyzing = "YES">
+            <BuildableReference
+               BuildableIdentifier = "primary"
+               BlueprintIdentifier = "14E656D819D8239100A74B85"
+               BuildableName = "JapaneseKeyboardKit.app"
+               BlueprintName = "JapaneseKeyboardKit"
+               ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
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
+            BlueprintIdentifier = "14E6570519D823FD00A74B85"
+            BuildableName = "JPKB.appex"
+            BlueprintName = "JPKB"
+            ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
+         </BuildableReference>
+      </MacroExpansion>
+      <AdditionalOptions>
+      </AdditionalOptions>
+   </TestAction>
+   <LaunchAction
+      buildConfiguration = "Debug"
+      selectedDebuggerIdentifier = ""
+      selectedLauncherIdentifier = "Xcode.IDEFoundation.Launcher.PosixSpawn"
+      launchStyle = "0"
+      useCustomWorkingDirectory = "NO"
+      ignoresPersistentStateOnLaunch = "NO"
+      debugDocumentVersioning = "YES"
+      debugServiceExtension = "internal"
+      allowLocationSimulation = "YES"
+      launchAutomaticallySubstyle = "2">
+      <BuildableProductRunnable
+         runnableDebuggingMode = "0">
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "14E656D819D8239100A74B85"
+            BuildableName = "JapaneseKeyboardKit.app"
+            BlueprintName = "JapaneseKeyboardKit"
+            ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
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
+      debugDocumentVersioning = "YES"
+      launchAutomaticallySubstyle = "2">
+      <BuildableProductRunnable
+         runnableDebuggingMode = "0">
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "14E656D819D8239100A74B85"
+            BuildableName = "JapaneseKeyboardKit.app"
+            BlueprintName = "JapaneseKeyboardKit"
+            ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
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
diff --git a/JapaneseKeyboardKit.xcodeproj/xcshareddata/xcschemes/JapaneseKeyboardKit.xcscheme b/JapaneseKeyboardKit.xcodeproj/xcshareddata/xcschemes/JapaneseKeyboardKit.xcscheme
new file mode 100644
index 0000000..f31a3ca
--- /dev/null
+++ b/JapaneseKeyboardKit.xcodeproj/xcshareddata/xcschemes/JapaneseKeyboardKit.xcscheme
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
+               BlueprintIdentifier = "14E656D819D8239100A74B85"
+               BuildableName = "JapaneseKeyboardKit.app"
+               BlueprintName = "JapaneseKeyboardKit"
+               ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
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
+            BlueprintIdentifier = "14E656D819D8239100A74B85"
+            BuildableName = "JapaneseKeyboardKit.app"
+            BlueprintName = "JapaneseKeyboardKit"
+            ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
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
+            BlueprintIdentifier = "14E656D819D8239100A74B85"
+            BuildableName = "JapaneseKeyboardKit.app"
+            BlueprintName = "JapaneseKeyboardKit"
+            ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
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
+            BlueprintIdentifier = "14E656D819D8239100A74B85"
+            BuildableName = "JapaneseKeyboardKit.app"
+            BlueprintName = "JapaneseKeyboardKit"
+            ReferencedContainer = "container:JapaneseKeyboardKit.xcodeproj">
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
