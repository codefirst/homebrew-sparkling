class GameOfLife < BrewSparkling::Recipe::Builder
  github 'yonbergman/swift-gameoflife', branch: 'fd31c2cea76d54312b4c4c42cebb3de318223881'
  description 'Conway\'s game of life written in Swift with SpriteKit'
  version '1.0'
  bundle_identifier 'com.yonbergman.gameoflife'
  executable_name 'gameoflife.app'

  def build
    xcodebuild_archive(scheme: 'gameoflife')
  end

  patch :DATA
end

__END__
diff --git a/gameoflife.xcodeproj/project.pbxproj b/gameoflife.xcodeproj/project.pbxproj
index 205973f..fe4c7fd 100644
--- a/gameoflife.xcodeproj/project.pbxproj
+++ b/gameoflife.xcodeproj/project.pbxproj
@@ -176,6 +176,8 @@
 		ED92B6A9193F3C1C00AF5238 /* Project object */ = {
 			isa = PBXProject;
 			attributes = {
+				LastSwiftMigration = 0700;
+				LastSwiftUpdateCheck = 0700;
 				LastUpgradeCheck = 0600;
 				ORGANIZATIONNAME = "Yonatan Bergman";
 				TargetAttributes = {
diff --git a/gameoflife.xcodeproj/xcshareddata/xcschemes/gameoflife.xcscheme b/gameoflife.xcodeproj/xcshareddata/xcschemes/gameoflife.xcscheme
new file mode 100644
index 0000000..e86cc6c
--- /dev/null
+++ b/gameoflife.xcodeproj/xcshareddata/xcschemes/gameoflife.xcscheme
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
+               BlueprintIdentifier = "ED92B6B0193F3C1C00AF5238"
+               BuildableName = "gameoflife.app"
+               BlueprintName = "gameoflife"
+               ReferencedContainer = "container:gameoflife.xcodeproj">
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
+               BlueprintIdentifier = "ED92B6C6193F3C1C00AF5238"
+               BuildableName = "gameoflifeTests.xctest"
+               BlueprintName = "gameoflifeTests"
+               ReferencedContainer = "container:gameoflife.xcodeproj">
+            </BuildableReference>
+         </TestableReference>
+      </Testables>
+      <MacroExpansion>
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "ED92B6B0193F3C1C00AF5238"
+            BuildableName = "gameoflife.app"
+            BlueprintName = "gameoflife"
+            ReferencedContainer = "container:gameoflife.xcodeproj">
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
+            BlueprintIdentifier = "ED92B6B0193F3C1C00AF5238"
+            BuildableName = "gameoflife.app"
+            BlueprintName = "gameoflife"
+            ReferencedContainer = "container:gameoflife.xcodeproj">
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
+            BlueprintIdentifier = "ED92B6B0193F3C1C00AF5238"
+            BuildableName = "gameoflife.app"
+            BlueprintName = "gameoflife"
+            ReferencedContainer = "container:gameoflife.xcodeproj">
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
diff --git a/gameoflife/AppDelegate.swift b/gameoflife/AppDelegate.swift
index 5584fc3..8742957 100644
--- a/gameoflife/AppDelegate.swift
+++ b/gameoflife/AppDelegate.swift
@@ -14,7 +14,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     var window: UIWindow?


-    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
+    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
         // Override point for customization after application launch.
         return true
     }
diff --git a/gameoflife/GameScene.swift b/gameoflife/GameScene.swift
index 1f7c2da..256b242 100644
--- a/gameoflife/GameScene.swift
+++ b/gameoflife/GameScene.swift
@@ -22,8 +22,8 @@ class GameScene: SKScene {

         addExamples()
     }
-
-    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
+
+    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
         for touch: AnyObject in touches {
             let location = touch.locationInNode(self)
             let point = convertPixelsToPoint(location)
@@ -36,8 +36,8 @@ class GameScene: SKScene {
     var timeSinceLastTick:Double = -3 // Initial time to setup

     override func update(currentTime: CFTimeInterval) {
-        if (lastUpdateTimeInterval){
-            var timeSinceLast = currentTime - self.lastUpdateTimeInterval!;
+        if ((lastUpdateTimeInterval) != nil){
+            let timeSinceLast = currentTime - self.lastUpdateTimeInterval!;
             timeSinceLastTick += timeSinceLast
         }
         self.lastUpdateTimeInterval = currentTime;
diff --git a/gameoflife/GameViewController.swift b/gameoflife/GameViewController.swift
index 871f2b5..fa20c1a 100644
--- a/gameoflife/GameViewController.swift
+++ b/gameoflife/GameViewController.swift
@@ -12,13 +12,13 @@ import SpriteKit
 extension SKNode {
     class func unarchiveFromFile(file : NSString) -> SKNode? {

-        let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks")
-
-        var sceneData = NSData.dataWithContentsOfFile(path, options: .DataReadingMappedIfSafe, error: nil)
+        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks")
+
+        var sceneData = try! NSData(contentsOfFile: path!, options: .DataReadingMappedIfSafe)
         var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)

         archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
-        let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
+        let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
         archiver.finishDecoding()
         return scene
     }
@@ -31,7 +31,7 @@ class GameViewController: UIViewController {

         if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene{
             // Configure the view.
-            let skView = self.view as SKView
+            let skView = self.view as! SKView
             skView.showsFPS = true
             skView.showsNodeCount = true

@@ -49,11 +49,11 @@ class GameViewController: UIViewController {
         return true
     }

-    override func supportedInterfaceOrientations() -> Int {
+    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
         if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
-            return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
+            return UIInterfaceOrientationMask.AllButUpsideDown
         } else {
-            return Int(UIInterfaceOrientationMask.All.toRaw())
+            return UIInterfaceOrientationMask.All
         }
     }

diff --git a/gameoflife/Info.plist b/gameoflife/Info.plist
index e45d26d..c825229 100644
--- a/gameoflife/Info.plist
+++ b/gameoflife/Info.plist
@@ -22,6 +22,8 @@
 	<string>1</string>
 	<key>LSRequiresIPhoneOS</key>
 	<true/>
+	<key>UILaunchStoryboardName</key>
+	<string>Main</string>
 	<key>UIMainStoryboardFile</key>
 	<string>Main</string>
 	<key>UIRequiredDeviceCapabilities</key>
diff --git a/gameoflife/World.swift b/gameoflife/World.swift
index e60b1cd..f3c0934 100644
--- a/gameoflife/World.swift
+++ b/gameoflife/World.swift
@@ -22,7 +22,7 @@ class World {

         for cell in aliveCells{
             var count:Int? = cellsWithNeighbours.removeValueForKey(cell)
-            if count && (count == 2 || count == 3){
+            if (count != nil && (count == 2 || count == 3)){
                 newCells.append(cell)
             }
         }
@@ -71,12 +71,12 @@ class World {

     var bounds: Rect {
     let yPoints = aliveCells.map{$0.y}
-        let minY = minElement(yPoints)
-        let maxY = maxElement(yPoints)
+        let minY = yPoints.minElement()!
+        let maxY = yPoints.maxElement()!

         let xPoints = aliveCells.map{$0.x}
-        let minX = minElement(xPoints)
-        let maxX = maxElement(xPoints)
+        let minX = xPoints.minElement()!
+        let maxX = xPoints.maxElement()!
         return Rect(top: minY, left: minX, bottom: maxY, right: maxX)
     }

@@ -87,7 +87,7 @@ class World {
             for x in (b.left...b.right){
                 line += self.printCell(Point(x: x, y: y))
             }
-            println(line)
+            print(line)
         }
     }

