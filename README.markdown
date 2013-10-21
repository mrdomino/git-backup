# GPG-based Git Encryption

Maybe you want to store a private git repository in a public store like
dropbox, and you don't want dropbox employees or people who subpoena dropbox to
be able to access the contents. Then you might be interested in this tool.

This is like
[shadowhand/git-encrypt](https://github.com/shadowhand/git-encrypt) except it
encrypts all at once rather than every commit. This results in drastically
smaller file sizes since it doesn't break git's delta algorithm. It's also
slightly less integrated: you need to run an extra command, and it's stubbornly
unconfigurable.

## Requirements

`gpg` should be on your path. `/bin/bash` should be sane.

`tar` should be on your path and should accept arguments like GNU tar does.

This should go without saying, but you also need `git`.

If your system is slightly off from this, you might be able to get it working
without much hassle. Send me a pull request.

## Usage

Run `git backup` within a repository to store an encrypted copy to Dropbox.

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

Edit `git-backup` and `git-restore`. They're pretty readable. You can probably
do it even if you've never written a shell script.

Alternatively, set some environment variables:

- `BACKUP_DIR` to the base directory where you want to store backups,
- `REPO_NAME` to the name of the repo you want to back up,
- `REPO_PATH` to the directory containing your repo,
- and `BACKUP_FILENAME` to the full actual backup filename,

listed in order of your likelihood of wanting to touch them.

## See also

This tool was extracted from
[mrdomino/writing-scripts](https://github.com/mrdomino/writing-scripts). You
may be interested in the latter for fully ephemeral repositories that never
touch the disk in unencrypted form.
