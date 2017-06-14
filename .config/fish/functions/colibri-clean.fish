function colibri-clean -d "Clear out Colibri build files and mocks"
    rm -rf build ; and find . -name 'Mock*' | xargs rm -rf ; and git checkout test/Driver/Cme/MockCmeOrderSession.hpp test/Driver/Cme/MockCmeOrderSession.cpp ; and ./make.sh
end
