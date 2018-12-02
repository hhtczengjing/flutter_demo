echo "===清理flutter历史编译==="
flutter clean

echo "===重新生成plugin索引==="
flutter packages get

echo "===生成App.framework和flutter_assets==="
flutter build ios --release

echo "===生成各个plugin的二进制库文件==="
cd ios/Pods
for plugin_name in "flutter_hybrid_router" "flutter_webview_plugin"
do
    echo "生成${plugin_name}.framework..."
    /usr/bin/env xcrun xcodebuild build -configuration Release ARCHS='arm64 armv7' -target ${plugin_name} BUILD_DIR=../../build/ios -sdk iphoneos -quiet
    /usr/bin/env xcrun xcodebuild build -configuration Debug ARCHS='x86_64' -target ${plugin_name} BUILD_DIR=../../build/ios -sdk iphonesimulator -quiet
    echo "合并${plugin_name}.framework..."
    lipo -create "../../build/ios/Debug-iphonesimulator/${plugin_name}/${plugin_name}.framework/${plugin_name}" "../../build/ios/Release-iphoneos/${plugin_name}/${plugin_name}.framework/${plugin_name}" -o "../../build/ios/Release-iphoneos/${plugin_name}/${plugin_name}.framework/${plugin_name}"
done