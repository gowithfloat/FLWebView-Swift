#!/bin/sh

xctool \
	-project FLWebViewSwift.xcodeproj \
	-scheme FLWebViewSwift \
	-sdk iphonesimulator \
	build \
	clean test -test-sdk iphonesimulator -resetSimulator -freshInstall