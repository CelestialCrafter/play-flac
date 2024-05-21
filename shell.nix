with import <nixpkgs> {};
mkShell {
  packages = [
	flac
	gum
	alsa-utils
  ];
}

