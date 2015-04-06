# Contributing code to CloudRouter repos

The CloudRouter Project welcomes contributions from all members of the community. We ask that when making contributions, you follow these simple guidelines.

## Forks and pull requests

In order to contribute code to any CloudRouter Project repo, please maintain a personal fork and commit your changes there first. Once you are ready to submit your changes for review and merging into a CloudRouter Project repo, create a pull request. The Travis CI system will automatically run some basic tests on your pull request before it is reviewed by a CloudRouter Project committer.

## Sign-off on all commits

The [CloudRouter Developer’s Certificate of Origin](https://cloudrouter.org/developer-certificate/) requires that all commits be signed off. Commits can be signed off by adding the "--signoff" or "-s" flag to your git commit command. A Travis CI test checks that commits are signed off, and all pull requests containing any commits missing sign off will be rejected.

## Merging pull requests

Committers who merge pull requests should **NOT** use the green merge button provided by the github web interface. The merge button adds a merge commit, which is problematic for several reasons. The merge commit will not be signed off by default, violating the rule requiring all commits to be signed off. Furthermore, merge commits add significant noise to logs and complicate the syncing of branches and forks.

To merge a pull request on a local copy of a CloudRouter Project repo, run the following commands. Note that $FORK should be replaced with the namespace of the fork, i.e. the name of the user who created it. $REPO should be replaced with the repo name, e.g. cloudrouter. These commands presume that all changes are on the master branch; if a feature branch is used, adjust the branch name accordingly.

```
$ git checkout -b $FORK-master master
$ git pull https://github.com/$FORK/$REPO.git master
$ git checkout master
$ git merge --no-commit $FORK-master
$ git push origin/master
```
