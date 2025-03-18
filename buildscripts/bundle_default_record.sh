# --------------------------------------------------

if [ ! -f "deps" ]; then
  sudo rm -r deps
fi
if [ ! -f "prefix" ]; then
  sudo rm -r prefix
fi

./download.sh
./patch.sh

# --------------------------------------------------

if [ ! -f "scripts/ffmpeg" ]; then
  rm scripts/ffmpeg.sh
fi
cp flavors/default_record.sh scripts/ffmpeg.sh

# --------------------------------------------------

./build.sh

# --------------------------------------------------

cd deps/media-kit-android-helper

#sudo chmod +x gradlew
#./gradlew assembleRelease

#unzip -o app/build/outputs/apk/release/app-release.apk -d app/build/outputs/apk/release

#cp app/build/outputs/apk/release/lib/arm64-v8a/libmediakitandroidhelper.so      ../../prefix/arm64-v8a/usr/local/lib
#cp app/build/outputs/apk/release/lib/armeabi-v7a/libmediakitandroidhelper.so    ../../prefix/armeabi-v7a/usr/local/lib

mkdir -p ../../prefix/outputs/lib/arm64-v8a/
mkdir -p ../../prefix/outputs/lib/armeabi-v7a/

cp ../../prefix/arm64-v8a/usr/local/lib/*.so ../../prefix/outputs/lib/arm64-v8a/
cp ../../prefix/armeabi-v7a/usr/local/lib/*.so ../../prefix/outputs/lib/armeabi-v7a/

cd ../../prefix/outputs

zip -r default-record.jar lib/*
mv default-record.jar ../../
cd ../../
md5sum *.jar