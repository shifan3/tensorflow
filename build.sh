#use ./configure to configure the build or skip it to use ./.tf_configure.bazelrc as preset build config

bazel build -c opt --cxxopt=--std=c++17 --config=android_arm64   --fat_apk_cpu=x86,x86_64,arm64-v8a,armeabi-v7a   --define=android_dexmerger_tool=d8_dexmerger   --define=android_incremental_dexing_tool=d8_dexbuilder   //tensorflow/lite/java:tensorflow-lite-gpu
bazel build -c opt --cxxopt=--std=c++17 --config=android_arm64   --fat_apk_cpu=x86,x86_64,arm64-v8a,armeabi-v7a   --define=android_dexmerger_tool=d8_dexmerger   --define=android_incremental_dexing_tool=d8_dexbuilder   //tensorflow/lite/java:tensorflow-lite


