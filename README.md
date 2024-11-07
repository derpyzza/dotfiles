just a bunch of config files for various software i've used before or am using currently. feel free to take whatever you like :)

the way that i like to set this up is to keep all the files in this repo, but then symlink them to their proper destinations in the filesystem.
this makes it easy to push changes to the repo.

also for my zsh config, i store the base config in the `.zshrc` file, and then on my machine i have a `.export.sh` file that stores machine-specific configs that the `.zshrc` file then sources.
the `.export.sh` file stays on my local machine, but the `.zshrc` file goes in the repo and is symlinked to the machine's home directory
