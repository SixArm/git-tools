# SixArm.com » Git » scripts for version control

Most frequent commands:

  * <code>git-branch-current: print the current git branch, suitable for using in other scripts.
  * <code>git-keep-empty-directories</code>: touch a .gitkeep file in each empty directory.
  * <code>git-meld</code>: use meld to compare git diffs.

Setup:

  * <code>git-init-add-commit</code>: shortcut to init && add -A && commit saying "publish".
  * <code>git-config-typical</code>: set the typical master branch with push default.

Management:

  * <code>git-repo-summaries.sh</code>: accumulate a TSV output of git repo summaries for our projects.
  * <code>git-rm-vendor-plugins-module</code>: remove a rails git submodule from vendor/plugins and cache.

Find all git directories within the current directory and iterate:

  * <code>git-gc-all</code>: garbage collect
  * <code>git-get-all</code>: pull and submodule init and update recursively
  * <code>git-pull-all</code>: pull
  * <code>git-push-all</code>: push
  * <code>git-status-all</code>: status

How to:

  * <code>git-branch-tips-for-iteration-and-story.txt</code>: tips for git workflow for managing projects.
  * <code>git-clone-mirror-fetch-to-deploy-new-release.txt</code>: tips to speed up git deployments.
  * <code>git-flatten.txt</code>: how to flatten a repo to depth 1.
  * <code>git-remove-submodule.txt</code>: how to delete a submodule from the project, cache, and plugins.

Hooks:

  * <code>hooks/pre-commit-delete-trailing-whitespace.sh</code>: find and fix trailing whitespace in commits.




