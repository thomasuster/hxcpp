#!/bin/bash
  set -ev
  sudo add-apt-repository ppa:haxe/ocaml -y
  sudo add-apt-repository ppa:haxe/snapshots -y
  sudo apt-get update
  sudo apt-get install -y \
      neko \
      ocaml \
      ocaml-native-compilers \
      ocaml-findlib \
      camlp4 \
      awscli
  wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin system
  export OPAMYES=1
  opam install sedlex camlzip xml-light extlib rope ptmap
  eval `opam config env`

  # Build haxe
  git clone --recursive https://github.com/HaxeFoundation/haxe.git ~/haxe --depth 1
  pushd ~/haxe
  make ADD_REVISION=1 && sudo make install INSTALL_DIR=/usr/local
  popd
  haxe -version
  # setup haxelib
  mkdir ~/haxelib && haxelib setup ~/haxelib
  haxelib dev hxcpp $TRAVIS_BUILD_DIR
  haxelib install record-macros
