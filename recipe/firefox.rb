class Firefox < BrewSparkling::Recipe::Builder
  description 'Firefox for iOS'
  github 'mozilla/firefox-ios', branch: '2fafdf5dff'
  version '1.1'
  bundle_identifiers %w(
    org.mozilla.ios.Fennec
    org.mozilla.ios.Fennec.SendTo
    org.mozilla.ios.Fennec.ShareTo
    org.mozilla.ios.Fennec.ViewLater
  )

  executable_name 'Client.app'

  def build
    system './checkout.sh'
    xcodebuild_archive(scheme: 'Client')
  end

  def plist?(path)
    %w(
      Client/Info.plist
      Extensions/ShareTo/Info.plist
      Extensions/SendTo/Info.plist
      Extensions/ViewLater/Info.plist
    ).any? do |name|
      path.fnmatch? "**/#{name}"
    end
  end

  patch :DATA
end

__END__
diff --git a/Client.xcodeproj/project.pbxproj b/Client.xcodeproj/project.pbxproj
index 439e541..6fa1fd6 100644
--- a/Client.xcodeproj/project.pbxproj
+++ b/Client.xcodeproj/project.pbxproj
@@ -71,6 +71,7 @@
 		0BF648111A9C54E900BA963C /* TopSitesPanel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0BF648101A9C54E900BA963C /* TopSitesPanel.swift */; };
 		0BF8F8DA1AEFF1C900E90BC2 /* noTitle.html in Resources */ = {isa = PBXBuildFile; fileRef = 0BF8F8D91AEFF1C900E90BC2 /* noTitle.html */; };
 		0BF9F8BC1A3A82CA0049A0FA /* Images.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = F84B21EF1A0910F600AAB793 /* Images.xcassets */; };
+		13C64E591B9323070024C621 /* SQLite.framework in Copy Frameworks */ = {isa = PBXBuildFile; fileRef = 7B7692B61B7CCBD100188277 /* SQLite.framework */; settings = {ATTRIBUTES = (CodeSignOnCopy, RemoveHeadersOnCopy, ); }; };
 		2805F5A61B8BCA7A00268FD1 /* ReadingList.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = E4D567181ADECE2700F1EFE7 /* ReadingList.framework */; };
 		28078A471B1507EF0053B46A /* ReadingList.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = E4D567181ADECE2700F1EFE7 /* ReadingList.framework */; };
 		28158BAC1ABC7C0E00C56FC8 /* Bytes.swift in Sources */ = {isa = PBXBuildFile; fileRef = 2FCAE2401ABB531100877008 /* Bytes.swift */; };
@@ -658,6 +659,13 @@
 			remoteGlobalIDString = EEBCC9D719CC627D0083B827;
 			remoteInfo = "SnapKit iOS";
 		};
+		13C64E2D1B92E0E50024C621 /* PBXContainerItemProxy */ = {
+			isa = PBXContainerItemProxy;
+			containerPortal = F84B21B61A090F8100AAB793 /* Project object */;
+			proxyType = 1;
+			remoteGlobalIDString = 2FCAE2191ABB51F800877008;
+			remoteInfo = Storage;
+		};
 		2827316A1ABC9BE700AA1954 /* PBXContainerItemProxy */ = {
 			isa = PBXContainerItemProxy;
 			containerPortal = F84B21B61A090F8100AAB793 /* Project object */;
@@ -1223,6 +1231,7 @@
 			dstPath = "";
 			dstSubfolderSpec = 10;
 			files = (
+				13C64E591B9323070024C621 /* SQLite.framework in Copy Frameworks */,
 				E4D567301ADECE2800F1EFE7 /* ReadingList.framework in Copy Frameworks */,
 				2F44FA161A9D41A200FD20CC /* Base32.framework in Copy Frameworks */,
 				0BA84AE41AE57147009C4D0C /* SnapKit.framework in Copy Frameworks */,
@@ -3028,6 +3037,7 @@
 			buildRules = (
 			);
 			dependencies = (
+				13C64E2E1B92E0E50024C621 /* PBXTargetDependency */,
 				2F77F6B91ABCAF0700484F3A /* PBXTargetDependency */,
 				2F77F69D1ABCAEFE00484F3A /* PBXTargetDependency */,
 				2F11EE501ABCAE910083902D /* PBXTargetDependency */,
@@ -3381,6 +3391,14 @@
 					};
 					E4BA8A2A1B4B0A1600BC2E95 = {
 						CreatedOnToolsVersion = 6.4;
+						SystemCapabilities = {
+							com.apple.ApplicationGroups.iOS = {
+								enabled = 0;
+							};
+							com.apple.Keychain = {
+								enabled = 0;
+							};
+						};
 					};
 					E4D567171ADECE2700F1EFE7 = {
 						CreatedOnToolsVersion = 6.3;
@@ -3396,10 +3414,10 @@
 						CreatedOnToolsVersion = 6.1;
 						SystemCapabilities = {
 							com.apple.ApplicationGroups.iOS = {
-								enabled = 1;
+								enabled = 0;
 							};
 							com.apple.Keychain = {
-								enabled = 1;
+								enabled = 0;
 							};
 						};
 					};
@@ -3411,10 +3429,10 @@
 						CreatedOnToolsVersion = 6.1;
 						SystemCapabilities = {
 							com.apple.ApplicationGroups.iOS = {
-								enabled = 1;
+								enabled = 0;
 							};
 							com.apple.Keychain = {
-								enabled = 1;
+								enabled = 0;
 							};
 						};
 					};
@@ -3422,10 +3440,10 @@
 						CreatedOnToolsVersion = 6.1;
 						SystemCapabilities = {
 							com.apple.ApplicationGroups.iOS = {
-								enabled = 1;
+								enabled = 0;
 							};
 							com.apple.Keychain = {
-								enabled = 1;
+								enabled = 0;
 							};
 						};
 					};
@@ -4568,6 +4586,11 @@
 			name = "SnapKit iOS";
 			targetProxy = 0BA84AE51AE57147009C4D0C /* PBXContainerItemProxy */;
 		};
+		13C64E2E1B92E0E50024C621 /* PBXTargetDependency */ = {
+			isa = PBXTargetDependency;
+			target = 2FCAE2191ABB51F800877008 /* Storage */;
+			targetProxy = 13C64E2D1B92E0E50024C621 /* PBXContainerItemProxy */;
+		};
 		2827316B1ABC9BE700AA1954 /* PBXTargetDependency */ = {
 			isa = PBXTargetDependency;
 			target = 2827315D1ABC9BE600AA1954 /* Sync */;
diff --git a/Client.xcodeproj/xcshareddata/xcschemes/Client.xcscheme b/Client.xcodeproj/xcshareddata/xcschemes/Client.xcscheme
index 9ada3a8..fc50efc 100644
--- a/Client.xcodeproj/xcshareddata/xcschemes/Client.xcscheme
+++ b/Client.xcodeproj/xcshareddata/xcschemes/Client.xcscheme
@@ -1,7 +1,7 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <Scheme
    LastUpgradeVersion = "0700"
-   version = "1.7">
+   version = "1.3">
    <BuildAction
       parallelizeBuildables = "YES"
       buildImplicitDependencies = "YES">
diff --git a/Client.xcodeproj/xcshareddata/xcschemes/FennecAurora.xcscheme b/Client.xcodeproj/xcshareddata/xcschemes/FennecAurora.xcscheme
index d097772..9d3c855 100644
--- a/Client.xcodeproj/xcshareddata/xcschemes/FennecAurora.xcscheme
+++ b/Client.xcodeproj/xcshareddata/xcschemes/FennecAurora.xcscheme
@@ -1,7 +1,7 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <Scheme
    LastUpgradeVersion = "0700"
-   version = "1.7">
+   version = "1.3">
    <BuildAction
       parallelizeBuildables = "YES"
       buildImplicitDependencies = "YES">
diff --git a/Client/Fennec.entitlements b/Client/Fennec.entitlements
index d899e1b..0c67376 100644
--- a/Client/Fennec.entitlements
+++ b/Client/Fennec.entitlements
@@ -1,16 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>application-identifier</key>
-	<string>$(AppIdentifierPrefix)org.mozilla.ios.Fennec</string>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.Fennec</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.Fennec</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Client/FennecAurora.entitlements b/Client/FennecAurora.entitlements
index 11f264e..0c67376 100644
--- a/Client/FennecAurora.entitlements
+++ b/Client/FennecAurora.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.FennecAurora</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.FennecAurora</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Client/FennecNightly.entitlements b/Client/FennecNightly.entitlements
index 3d7c69b..0c67376 100644
--- a/Client/FennecNightly.entitlements
+++ b/Client/FennecNightly.entitlements
@@ -1,16 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>application-identifier</key>
-	<string>$(AppIdentifierPrefix)org.mozilla.ios.FennecNightly</string>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.FennecNightly</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.FennecNightly</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Client/Firefox.entitlements b/Client/Firefox.entitlements
index c273634..0c67376 100644
--- a/Client/Firefox.entitlements
+++ b/Client/Firefox.entitlements
@@ -1,16 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>application-identifier</key>
-	<string>$(AppIdentifierPrefix)org.mozilla.ios.Firefox</string>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.Firefox</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.Firefox</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/SendTo/Fennec.entitlements b/Extensions/SendTo/Fennec.entitlements
index d3294be..0c67376 100644
--- a/Extensions/SendTo/Fennec.entitlements
+++ b/Extensions/SendTo/Fennec.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.Fennec</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.Fennec</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/SendTo/FennecNightly.entitlements b/Extensions/SendTo/FennecNightly.entitlements
index c79d811..0c67376 100644
--- a/Extensions/SendTo/FennecNightly.entitlements
+++ b/Extensions/SendTo/FennecNightly.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.FennecNightly</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.FennecNightly</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/SendTo/Firefox.entitlements b/Extensions/SendTo/Firefox.entitlements
index 3e056af..0c67376 100644
--- a/Extensions/SendTo/Firefox.entitlements
+++ b/Extensions/SendTo/Firefox.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.Firefox</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.Firefox</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/ShareTo/Fennec.entitlements b/Extensions/ShareTo/Fennec.entitlements
index d3294be..0c67376 100644
--- a/Extensions/ShareTo/Fennec.entitlements
+++ b/Extensions/ShareTo/Fennec.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.Fennec</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.Fennec</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/ShareTo/FennecNightly.entitlements b/Extensions/ShareTo/FennecNightly.entitlements
index c79d811..0c67376 100644
--- a/Extensions/ShareTo/FennecNightly.entitlements
+++ b/Extensions/ShareTo/FennecNightly.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.FennecNightly</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.FennecNightly</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/ShareTo/Firefox.entitlements b/Extensions/ShareTo/Firefox.entitlements
index 3e056af..0c67376 100644
--- a/Extensions/ShareTo/Firefox.entitlements
+++ b/Extensions/ShareTo/Firefox.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.Firefox</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.Firefox</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/ViewLater/Fennec.entitlements b/Extensions/ViewLater/Fennec.entitlements
index d3294be..0c67376 100644
--- a/Extensions/ViewLater/Fennec.entitlements
+++ b/Extensions/ViewLater/Fennec.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.Fennec</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.Fennec</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/ViewLater/FennecAurora.entitlements b/Extensions/ViewLater/FennecAurora.entitlements
index 11f264e..0c67376 100644
--- a/Extensions/ViewLater/FennecAurora.entitlements
+++ b/Extensions/ViewLater/FennecAurora.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.FennecAurora</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.FennecAurora</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/ViewLater/FennecNightly.entitlements b/Extensions/ViewLater/FennecNightly.entitlements
index c79d811..0c67376 100644
--- a/Extensions/ViewLater/FennecNightly.entitlements
+++ b/Extensions/ViewLater/FennecNightly.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.FennecNightly</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.FennecNightly</string>
-	</array>
-</dict>
+<dict/>
 </plist>
diff --git a/Extensions/ViewLater/Firefox.entitlements b/Extensions/ViewLater/Firefox.entitlements
index 3e056af..0c67376 100644
--- a/Extensions/ViewLater/Firefox.entitlements
+++ b/Extensions/ViewLater/Firefox.entitlements
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
-<dict>
-	<key>com.apple.security.application-groups</key>
-	<array>
-		<string>group.org.mozilla.ios.Firefox</string>
-	</array>
-	<key>keychain-access-groups</key>
-	<array>
-		<string>$(AppIdentifierPrefix)org.mozilla.ios.Firefox</string>
-	</array>
-</dict>
+<dict/>
 </plist>
