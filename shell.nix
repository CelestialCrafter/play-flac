with import <nixpkgs> {};
mkShell {
  packages = [
	flac
	alsa-utils
  ];
}

