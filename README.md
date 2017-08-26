# Git » scripts for version control

Most popular:

  * <code>[git-branch-current](bin/git-branch-current)</code>: print the current git branch, suitable for using in other scripts.
  * <code>[git-keep-empty-directories](bin/git-keep-empty-directories)</code>: touch a .gitkeep file in each empty directory.
  * <code>[git-meld](bin/git-meld)</code>: use meld to compare git diffs.

Setup:

  * <code>[git-init-add-commit](bin/git-init-add-commit)</code>: shortcut to init && add -A && commit saying "publish".
  * <code>[git-config-typical](bin/git-config-typical)</code>: set the typical master branch with push default.

Multiple directory commands:

  * <code>[git-dirs](bin/git-dirs)</code>: find git directories, and optionally use them to run git commands.
  * <code>[git-repo-summaries](bin/git-repo-summaries)</code>: accumulate a TSV output of git repo summaries for our projects.


Submodules:

  * <code>[git-rm-vendor-plugins-module](bin/git-rm-vendor-plugins-module)</code>: remove a rails git submodule from vendor/plugins and cache.

Hooks:

  * <code>[git-hook-pre-commit-delete-trailing-whitespace](bin/git-hook-pre-commit-delete-trailing-whitespace)</code>: find and fix trailing whitespace in commits.

Documentation and how to:

  * <code>[git-branch-tips-for-iteration-and-story.txt](doc/git-branch-tips-for-iteration-and-story.txt)</code>: tips for git workflow for managing projects.
  * <code>[git-clone-mirror-fetch-to-deploy-new-release.txt](doc/git-clone-mirror-fetch-to-deploy-new-release.txt)</code>: tips to speed up git deployments.
  * <code>[git-flatten.txt](doc/git-flatten.txt)</code>: how to flatten a repo to depth 1.
  * <code>[git-remove-submodule.txt](doc/git-remove-submodule.txt)</code>: how to delete a submodule from the project, cache, and plugins.
