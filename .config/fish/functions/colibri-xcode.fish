function colibri-xcode -d "Create XCode project files for Colibri"
    rm -rf build-osx ; and mkdir build-osx ; and cd build-osx ; and cmake -DBUILD_TESTING=OFF -DENABLE_CODECOVERAGE=OFF -DCMAKE_BUILD_TYPE=Debug -DDEBUG_ENABLED=ON -GXcode /Users/bryan/data/colibri
end
