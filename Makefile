project:
	rm -rf Pods && bundle exec pod install && open CardIO.xcworkspace

reset_project:
	rm -rf CardIO.xcodeproj && xcodegen

carthage_bootstrap:
	carthage bootstrap --use-xcframeworks --no-use-binaries --platform iOS