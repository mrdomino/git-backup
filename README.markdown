## Installation

    ./install.sh

## Example Usage

    writingme    # mkdir /tmp/writing.adf
                 # Dropbox/Documents/writing.git.tar.gz.gpg
                 #   -> /tmp/writing.adf/writing
                 # pushd /tmp/writing.adf/writing
    
    # scribble squiggle squiggle
    
    git commit -am 'scribbles and squiggles'
    
    git backup   # write an updated writing.git.tar.gz to Dropbox
    
    unwritingme  # popd
                 # rmdir /tmp/writing.adf
