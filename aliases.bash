# stick these in e.g. ~/.bashrc

writingme() {
  tmpdir=$(mktemp -d -t writing.XXX)
  gpg -d "$HOME/Dropbox/Documents/writing.git.tar.gz.gpg" |
    tar xz -C "$tmpdir"
  git clone -- "$tmpdir/writing.git" "$tmpdir/writing"
  pushd "$tmpdir/writing"
}

unwritingme() {
  basename=$(basename "$PWD")
  [[ writing == "$basename" ]] ||
    { echo "$basename is not writing!" >&2
      return 1
    }
  tmpdir=$(dirname "$PWD")
  popd &&
    rm -rf "$tmpdir"
}
