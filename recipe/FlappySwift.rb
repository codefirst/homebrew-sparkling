class FlappySwift < BrewSparkling::Recipe::Builder
  github 'fullstackio/FlappySwift', branch: 'master'
  version '1.0'
  bundle_identifier 'io.fullstack.FlappyBird'
  executable_name 'FlappyBird.app'

  def build
    xcodebuild_archive(scheme: 'FlappyBird')
  end

  patch :DATA
end

__END__
diff --git a/FlappyBird.xcodeproj/project.pbxproj b/FlappyBird.xcodeproj/project.pbxproj
index da9f0ab..9540d70 100644
--- a/FlappyBird.xcodeproj/project.pbxproj
+++ b/FlappyBird.xcodeproj/project.pbxproj
@@ -162,6 +162,7 @@
 		437451F2193D163700654986 /* Project object */ = {
 			isa = PBXProject;
 			attributes = {
+				LastSwiftUpdateCheck = 0700;
 				LastUpgradeCheck = 0600;
 				ORGANIZATIONNAME = Fullstack.io;
 				TargetAttributes = {
diff --git a/FlappyBird.xcodeproj/xcshareddata/xcschemes/FlappyBird.xcscheme b/FlappyBird.xcodeproj/xcshareddata/xcschemes/FlappyBird.xcscheme
new file mode 100644
index 0000000..7917410
--- /dev/null
+++ b/FlappyBird.xcodeproj/xcshareddata/xcschemes/FlappyBird.xcscheme
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
+               BlueprintIdentifier = "437451F9193D163700654986"
+               BuildableName = "FlappyBird.app"
+               BlueprintName = "FlappyBird"
+               ReferencedContainer = "container:FlappyBird.xcodeproj">
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
+               BlueprintIdentifier = "4374520F193D163800654986"
+               BuildableName = "FlappyBirdTests.xctest"
+               BlueprintName = "FlappyBirdTests"
+               ReferencedContainer = "container:FlappyBird.xcodeproj">
+            </BuildableReference>
+         </TestableReference>
+      </Testables>
+      <MacroExpansion>
+         <BuildableReference
+            BuildableIdentifier = "primary"
+            BlueprintIdentifier = "437451F9193D163700654986"
+            BuildableName = "FlappyBird.app"
+            BlueprintName = "FlappyBird"
+            ReferencedContainer = "container:FlappyBird.xcodeproj">
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
+            BlueprintIdentifier = "437451F9193D163700654986"
+            BuildableName = "FlappyBird.app"
+            BlueprintName = "FlappyBird"
+            ReferencedContainer = "container:FlappyBird.xcodeproj">
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
+            BlueprintIdentifier = "437451F9193D163700654986"
+            BuildableName = "FlappyBird.app"
+            BlueprintName = "FlappyBird"
+            ReferencedContainer = "container:FlappyBird.xcodeproj">
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
diff --git a/FlappyBird/AppDelegate.swift b/FlappyBird/AppDelegate.swift
index 22837cf..12b7c9d 100644
--- a/FlappyBird/AppDelegate.swift
+++ b/FlappyBird/AppDelegate.swift
@@ -13,8 +13,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?

-
-    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
+    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
         // Override point for customization after application launch.
         return true
     }
diff --git a/FlappyBird/GameScene.swift b/FlappyBird/GameScene.swift
index 5148543..09dc885 100644
--- a/FlappyBird/GameScene.swift
+++ b/FlappyBird/GameScene.swift
@@ -122,7 +122,7 @@ class GameScene: SKScene, SKPhysicsContactDelegate{
         self.addChild(bird)

         // create the ground
-        var ground = SKNode()
+        let ground = SKNode()
         ground.position = CGPointMake(0, groundTexture.size().height)
         ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, groundTexture.size().height * 2.0))
         ground.physicsBody?.dynamic = false
@@ -168,7 +168,7 @@ class GameScene: SKScene, SKPhysicsContactDelegate{
         pipeUp.physicsBody?.contactTestBitMask = birdCategory
         pipePair.addChild(pipeUp)

-        var contactNode = SKNode()
+        let contactNode = SKNode()
         contactNode.position = CGPointMake( pipeDown.size.width + bird.size.width / 2, CGRectGetMidY( self.frame ) )
         contactNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake( pipeUp.size.width, self.frame.size.height ))
         contactNode.physicsBody?.dynamic = false
@@ -202,8 +202,8 @@ class GameScene: SKScene, SKPhysicsContactDelegate{
         // Restart animation
         moving.speed = 1
     }
-
-    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
+
+    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
         /* Called when a touch begins */
         if moving.speed > 0  {
             for touch: AnyObject in touches {
diff --git a/FlappyBird/GameViewController.swift b/FlappyBird/GameViewController.swift
index 0bbe0ae..0c07dca 100644
--- a/FlappyBird/GameViewController.swift
+++ b/FlappyBird/GameViewController.swift
@@ -12,13 +12,13 @@ import SpriteKit
 extension SKNode {
     class func unarchiveFromFile(file : NSString) -> SKNode? {

-        let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks")
-
-        let sceneData = NSData(contentsOfFile: path!, options: .DataReadingMappedIfSafe, error: nil)
-        let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData!)
+        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks")
+
+        let sceneData = try! NSData(contentsOfFile: path!, options: NSDataReadingOptions.DataReadingMappedIfSafe)
+        let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)

         archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
-        let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
+        let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
         archiver.finishDecoding()
         return scene
     }
@@ -31,7 +31,7 @@ class GameViewController: UIViewController {

         if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
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
-            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
+            return UIInterfaceOrientationMask.AllButUpsideDown
         } else {
-            return Int(UIInterfaceOrientationMask.All.rawValue)
+            return UIInterfaceOrientationMask.All
         }
     }

diff --git a/FlappyBird/Images.xcassets/AppIcon.appiconset/Contents.json b/FlappyBird/Images.xcassets/AppIcon.appiconset/Contents.json
index 91bf9c1..b7f3352 100644
--- a/FlappyBird/Images.xcassets/AppIcon.appiconset/Contents.json
+++ b/FlappyBird/Images.xcassets/AppIcon.appiconset/Contents.json
@@ -16,6 +16,11 @@
       "scale" : "2x"
     },
     {
+      "idiom" : "iphone",
+      "size" : "60x60",
+      "scale" : "3x"
+    },
+    {
       "idiom" : "ipad",
       "size" : "29x29",
       "scale" : "1x"
diff --git a/FlappyBird/Images.xcassets/Contents.json b/FlappyBird/Images.xcassets/Contents.json
new file mode 100644
index 0000000..da4a164
--- /dev/null
+++ b/FlappyBird/Images.xcassets/Contents.json
@@ -0,0 +1,6 @@
+{
+  "info" : {
+    "version" : 1,
+    "author" : "xcode"
+  }
+}
\ No newline at end of file
diff --git a/FlappyBird/Images.xcassets/PipeDown.imageset/Contents.json b/FlappyBird/Images.xcassets/PipeDown.imageset/Contents.json
index 9231d08..43e7808 100644
--- a/FlappyBird/Images.xcassets/PipeDown.imageset/Contents.json
+++ b/FlappyBird/Images.xcassets/PipeDown.imageset/Contents.json
@@ -1,14 +1,21 @@
- {
+{
   "images" : [
     {
       "idiom" : "universal",
-	  "scale" : "1x",
-
-      "filename" : "PipeDown.png"
+      "filename" : "PipeDown.png",
+      "scale" : "1x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "2x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "3x"
     }
   ],
   "info" : {
     "version" : 1,
     "author" : "xcode"
   }
-}
\ No newline at end of file
+}
\ No newline at end of file
diff --git a/FlappyBird/Images.xcassets/PipeUp.imageset/Contents.json b/FlappyBird/Images.xcassets/PipeUp.imageset/Contents.json
index 858f025..c546114 100644
--- a/FlappyBird/Images.xcassets/PipeUp.imageset/Contents.json
+++ b/FlappyBird/Images.xcassets/PipeUp.imageset/Contents.json
@@ -2,8 +2,16 @@
   "images" : [
     {
       "idiom" : "universal",
-	  "scale" : "1x",
-      "filename" : "PipeUp.png"
+      "filename" : "PipeUp.png",
+      "scale" : "1x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "2x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "3x"
     }
   ],
   "info" : {
diff --git a/FlappyBird/Images.xcassets/Spaceship.imageset/Contents.json b/FlappyBird/Images.xcassets/Spaceship.imageset/Contents.json
index dd94a76..8b40e00 100644
--- a/FlappyBird/Images.xcassets/Spaceship.imageset/Contents.json
+++ b/FlappyBird/Images.xcassets/Spaceship.imageset/Contents.json
@@ -2,12 +2,16 @@
   "images" : [
     {
       "idiom" : "universal",
-      "scale" : "1x",
-      "filename" : "Spaceship.png"
+      "filename" : "Spaceship.png",
+      "scale" : "1x"
     },
     {
       "idiom" : "universal",
       "scale" : "2x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "3x"
     }
   ],
   "info" : {
diff --git a/FlappyBird/Images.xcassets/land.imageset/Contents.json b/FlappyBird/Images.xcassets/land.imageset/Contents.json
index 18598ed..ea791ee 100644
--- a/FlappyBird/Images.xcassets/land.imageset/Contents.json
+++ b/FlappyBird/Images.xcassets/land.imageset/Contents.json
@@ -2,8 +2,16 @@
   "images" : [
     {
       "idiom" : "universal",
-      "scale" : "1x",
-      "filename" : "land.png"
+      "filename" : "land.png",
+      "scale" : "1x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "2x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "3x"
     }
   ],
   "info" : {
diff --git a/FlappyBird/Images.xcassets/scoreboard.imageset/Contents.json b/FlappyBird/Images.xcassets/scoreboard.imageset/Contents.json
index d842f7e..a15dba1 100644
--- a/FlappyBird/Images.xcassets/scoreboard.imageset/Contents.json
+++ b/FlappyBird/Images.xcassets/scoreboard.imageset/Contents.json
@@ -2,8 +2,16 @@
   "images" : [
     {
       "idiom" : "universal",
-      "scale" : "1x",
-      "filename" : "scoreboard.png"
+      "filename" : "scoreboard.png",
+      "scale" : "1x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "2x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "3x"
     }
   ],
   "info" : {
diff --git a/FlappyBird/Images.xcassets/sky.imageset/Contents.json b/FlappyBird/Images.xcassets/sky.imageset/Contents.json
index 976d0b3..5ced6cb 100644
--- a/FlappyBird/Images.xcassets/sky.imageset/Contents.json
+++ b/FlappyBird/Images.xcassets/sky.imageset/Contents.json
@@ -2,8 +2,16 @@
   "images" : [
     {
       "idiom" : "universal",
-      "scale" : "1x",
-      "filename" : "sky.png"
+      "filename" : "sky.png",
+      "scale" : "1x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "2x"
+    },
+    {
+      "idiom" : "universal",
+      "scale" : "3x"
     }
   ],
   "info" : {
diff --git a/FlappyBird/Info.plist b/FlappyBird/Info.plist
index d36238e..1fcb300 100644
--- a/FlappyBird/Info.plist
+++ b/FlappyBird/Info.plist
@@ -22,6 +22,8 @@
 	<string>1</string>
 	<key>LSRequiresIPhoneOS</key>
 	<true/>
+	<key>UILaunchStoryboardName</key>
+	<string>Main</string>
 	<key>UIMainStoryboardFile</key>
 	<string>Main</string>
 	<key>UIRequiredDeviceCapabilities</key>
