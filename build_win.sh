rm -rf build
mkdir build
cd build
cmake .. -G "Visual Studio 15 Win64"
cmake --build .
Debug/main.exe