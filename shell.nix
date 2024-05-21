with import <nixpkgs> {};
mkShell {
  packages = [
	flac
	gum
	fd
	alsa-utils
  ];
}

