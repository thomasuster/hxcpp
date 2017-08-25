set -e
pushd /Users/thomasuster/hxcpp/tools/hxcpp
haxe compile.hxml
popd
pushd cffi/project
echo BUILD
haxelib run hxcpp build.xml -debug -DHXCPP_M64
echo DONE
popd
#haxe --run RunTests cffi
rm cffi/project/ndll/Mac64/prime.dylib