class Provenance < BrewSparkling::Recipe::Builder
  github 'jasarien/Provenance', branch: '1.1.5'
  description <<END
An iOS Frontend for multiple emulators, currently supporting Sega Genesis, Game Gear/Master System, Sega CD, SNES, NES, GB/GBC and GBA.

http://jamesaddyman.com/provenance
END

  version '1.1.5'
  bundle_identifier 'com.jamsoftonline.Provenance'

  def build
    xcodebuild_archive(workspace: 'Provenance.xcworkspace', scheme: 'Provenance-Release')
  end

  patch <<END
diff --git a/Provenance.xcodeproj/project.pbxproj b/Provenance.xcodeproj/project.pbxproj
index 9f9d918..69e60a1 100644
--- a/Provenance.xcodeproj/project.pbxproj
+++ b/Provenance.xcodeproj/project.pbxproj
@@ -825,7 +825,6 @@
 				ORGANIZATIONNAME = "James Addyman";
 				TargetAttributes = {
 					1A3D409317B2DCE4004DFFFC = {
-						DevelopmentTeam = 63497P68S6;
 					};
 					1AD9AA341ACC988F00EC87A0 = {
 						CreatedOnToolsVersion = 6.2;
END
end
