class Bridges2 < BrewSparkling::Recipe::Builder
  github 'zgrossbart/bridges', branch: 'master'
  version '1.2'
  bundle_identifier 'com.zackgrossbart.--Bridges'
  executable_name '7 Bridges.app'

  def build
    xcodebuild_archive(scheme: 'bridges2')
  end

  patch :DATA
end

__END__
diff --git a/bridges2.xcodeproj/xcshareddata/xcschemes/bridges2.xcscheme b/bridges2.xcodeproj/xcshareddata/xcschemes/bridges2.xcscheme
new file mode 100644
index 0000000..3ffd728
--- /dev/null
+++ b/bridges2.xcodeproj/xcshareddata/xcschemes/bridges2.xcscheme
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
+               BlueprintIdentifier = "CE6D65D015EAC5FB00C7EDD7"
+               BuildableName = "7 Bridges.app"
+               BlueprintName = "bridges2"
+               ReferencedContainer = "container:bridges2.xcodeproj">
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
+      </Testables>
+      <MacroExpansion>
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "CE6D65D015EAC5FB00C7EDD7"
+            BuildableName = "7 Bridges.app"
+            BlueprintName = "bridges2"
+            ReferencedContainer = "container:bridges2.xcodeproj">
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
+            BlueprintIdentifier = "CE6D65D015EAC5FB00C7EDD7"
+            BuildableName = "7 Bridges.app"
+            BlueprintName = "bridges2"
+            ReferencedContainer = "container:bridges2.xcodeproj">
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
+            BlueprintIdentifier = "CE6D65D015EAC5FB00C7EDD7"
+            BuildableName = "7 Bridges.app"
+            BlueprintName = "bridges2"
+            ReferencedContainer = "container:bridges2.xcodeproj">
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
diff --git a/bridges2/MainMenuViewController.mm b/bridges2/MainMenuViewController.mm
index 93142ac..8b52369 100644
--- a/bridges2/MainMenuViewController.mm
+++ b/bridges2/MainMenuViewController.mm
@@ -88,7 +88,7 @@
 -(void)viewDidLoad {
     [super viewDidLoad];
     if (_checkImage == nil) {
-        _checkImage = [UIImage imageNamed:@"green_check.png"];
+        _checkImage = [[UIImage imageNamed:@"green_check.png"] retain];
     }

     [self preloadSounds];
