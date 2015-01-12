#!/bin/bash
echo
echo Multibeam Converter

echo - macdeployqt 

cd ~/Development/GitHub/MultibeamConverter

rm -R '../../Distribution/MultibeamConverter/MultibeamConverter.app'
cp -R './MultibeamConverter-build-Desktop_Qt_5_4_0_clang_64bit-Release/MultibeamConverter.app' '../../Distribution/MultibeamConverter/MultibeamConverter.app'
cp './trunk/Resources/Info.plist' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/Info.plist'

/Developer/Qt/5.4/clang_64/bin/macdeployqt '../../Distribution/MultibeamConverter/MultibeamConverter.app'

echo - code signing

codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/Frameworks/QtCore.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/Frameworks/QtGui.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/Frameworks/QtNetwork.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/Frameworks/QtPrintSupport.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/Frameworks/QtWidgets.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/Frameworks/libz.1.dylib'

codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/bearer/libqcorewlanbearer.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/bearer/libqgenericbearer.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqdds.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqgif.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqicns.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqico.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqjp2.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqjpeg.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqmng.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqtga.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqtiff.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqwbmp.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/imageformats/libqwebp.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/platforms/libqcocoa.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app/Contents/PlugIns/printsupport/libcocoaprintersupport.dylib'

codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/MultibeamConverter/MultibeamConverter.app' # --entitlements './trunk/Resources/PanGet.entitlements'

echo - mount package

cd ~/Development/Distribution/MultibeamConverter
hdiutil attach ~/Development/Distribution/MultibeamConverter_OSX.dmg

rm -R '/Volumes/Multibeam Converter/MultibeamConverter.app'
cp -R MultibeamConverter.app '/Volumes/Multibeam Converter'

cd '/Volumes/Multibeam Converter'
rm -rf .fseventsd
mkdir .fseventsd
touch .fseventsd/no_log
cd ~/Development/Distribution

echo - verify package

codesign -d '/Volumes/Multibeam Converter/MultibeamConverter.app'

echo
hdiutil detach '/Volumes/Multibeam Converter'
