# GPG-based Git Encryption

Maybe you want to store a private git repository in a public store like
dropbox, and you don't want dropbox employees or people who subpoena dropbox to
be able to access the contents. Then you might be interested in this tool.

This is like
[shadowhand/git-encrypt](https://github.com/shadowhand/git-encrypt) except it
encrypts all at once rather than every commit. This results in drastically
smaller file sizes since it doesn't break git's delta algorithm. It's also
slightly less integrated: you need to run an extra command, and it's stubbornly
unconfigurable. Sorry.

## Requirements

`gpg` should be on your path. `/bin/bash` should be sane.

## Usage

Run `git backup` within a repository to store an encrypted copy to Dropbox.

    git init myprivaterepo
    cd myprivaterepo
    git backup

Whenever you make some changes, run `git backup` to push a new copy to Dropbox.

    cd myprivaterepo
    echo "some changes" > afile
    git commit -am "some changes"
    git backup

Run `git restore` to decrypt and check out the copy from Dropbox to your
current working dir.

    git restore myprivaterepo
    cd myprivaterepo
    cat afile  # ==> "some changes"

## Configuration

Edit `git-backup`. It's pretty readable. You can probably do it even if you've
never written a shell script.

## See also

This tool was extracted from
[mrdomino/writing-scripts](https://github.com/mrdomino/writing-scripts). You
may be interested in the latter for fully ephemeral repositories that never
touch the disk in unencrypted form.
