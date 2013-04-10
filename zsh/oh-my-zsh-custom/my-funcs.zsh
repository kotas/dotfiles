#
# Collection of My Zsh Functions
#
# Author:  kotas <kotas at kotas dot jp>
# License: Public domain. Use this at your own risk.
#


# up - Go upwards
#
# USAGE:
#   $ up        = cd ..
#   $ up 2      = cd ../..
#   $ up 3      = cd ../../..
#   $ up foo    = cd to the nearest `foo' directory in the ancestor path.
#       ex) At /foo/bar/baz/      , then cd to /foo/
#       ex) At /foo/bar/foo/baz/  , then cd to /foo/bar/foo/
#       ex) At /bar/baz/          , then shows error
#
function up() {
  $(
    /usr/bin/env perl -e '
        my ($curdir, $target) = @ARGV;
        if ($target eq "") {
            print "cd ..";
        } elsif ((my $moveto = "$curdir/") =~ s|^(.*/$target/).+$|$1|) {
            print "cd ", $moveto;
        } elsif ($target =~ /^\d+$/) {
            print "cd ", ("../" x $target);
        } else {
            print STDERR "No such directory: $target\n";
        }
    ' `pwd` "$1"
  )
}

# upr - Go to the root of the current project
# (Using .svn/.git for detecting the root)
#
function upr() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
  elif [ -d .svn ]; then
    dir=`pwd`
    while [ -d $dir/../.svn ]; do
      dir=$dir/..
    done
    cd $dir
  else
    echo "Not in project directory" >&2
    return 1
  fi
}

# cot - Open in CotEditor
#
function cot() {
  cat <<EOS | osascript
    tell application "CotEditor"
      activate
      $(for n in $*; do echo 'open "'`pwd`'/'$n'"'; done)
    end tell
EOS
}


# fcd - cd to the directory opened by Finder
#
function fcd() {
  cd "`/bin/sh $ZSH_CUSTOM/vendor/fcd.sh`"
}

