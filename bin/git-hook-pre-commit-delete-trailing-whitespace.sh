#!/bin/sh

# A git hook script to find and fix trailing whitespace in your commits:
#
#   * trailing whitespace characters at the end of a line
#   * trailing whitespace lines at the end of a file
#
# Bypass it with the --no-verify option.
#
# This script tries ubuntu sed syntax first,
# and (if that fails) afterwards tries the osx sed syntax.
#
#
# == Set config
#
# We also configure our project space by editing ./.git/config (as opposed to ~/.gitconfig)
# because it's nice to keep our settings consistent among all project members:
#
#     git config core.whitespace "trailing-space,space-before-tab"
#     git config apply.whitespace "trailing-space,space-before-tab"
#
#
# == Set editor
#
# Also, we can set a command in our editors to remove trailing spaces when saving.
#
# To delete trailing whitespace in vim:
#
#     autocmd BufWritePre .cpp,.c,*.h :%s/\s\+$//e 
#
# To delete trailing whitespace in emacs:
#
#     M-x delete-trailing-whitespace
#
# Credit: StackOverflow users sdepold, bojo,rjack, 
# Mauvis Ledford, Robert Massaioli, Seth Johnson, etc.
#
# See http://stackoverflow.com/questions/591923/make-git-automatically-remove-trailing-whitespace-before-committing
# See vim.wikia.com/wiki/Remove_unwanted_spaces


if git-rev-parse --verify HEAD >/dev/null 2>&1 ; then
  against=HEAD
else
  # Initial commit: diff against an empty tree object
  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi
# Find files with trailing whitespace
for FILE in `exec git diff-index --check --cached $against -- | sed '/^[+-]/d' | (sed -r 's/:[0-9]+:.*//' > /dev/null 2>&1 || sed -E 's/:[0-9]+:.*//') | uniq` ; do

  # Delete trailing whitespace characters from the end of a line.
  # First try Ubuntu/Debian sed syntax, then try MacOSX/BSD syntax.
  (sed -i 's/[[:space:]]*$//' "$FILE" > /dev/null 2>&1 || sed -i '' -E 's/[[:space:]]*$//' "$FILE")

  # Delete trailing whitespace lines from the end of a file.
  (sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$FILE") > /dev/null 2>&1 || echo "Need BSD equivalent: delete trailing whitespace lines"

  # Add the fixed file
  git add "$FILE"
done

# Now we can commit
exit


