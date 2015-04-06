# Contributing code to CloudRouter repos

The CloudRouter Project welcomes contributions from all members of the community. We ask that when making contributions, you follow these simple guidelines.

## Forks and pull requests

In order to contribute code to any CloudRouter Project repo, please maintain a personal fork and commit your changes there first. Once you are ready to submit your changes for review and merging into a CloudRouter Project repo, create a pull request. The Travis CI system will automatically run some basic tests on your pull request before it is reviewed by a CloudRouter Project committer. It is encouraged that you use a [feature branch](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow/) when contributing code or fixing a bug.

## Sign-off on all commits

The [CloudRouter Developer’s Certificate of Origin](https://cloudrouter.org/developer-certificate/) requires that all commits be signed off. Commits can be [signed off](http://git-scm.com/docs/git-commit) by adding the "--signoff" or "-s" flag to your git commit command. A Travis CI test checks that commits are signed off, and all pull requests containing any commits missing sign off will be rejected.

Git hooks that automatically sign-off all commits, or reject commits that are not signed-off are [available here](https://github.com/cloudrouter/cloudrouter/tree/master/contrib/hooks).

## Merging pull requests

Committers who merge pull requests should **NOT** use the green merge button provided by the github web interface. The merge button adds a merge commit, which is problematic for several reasons. The merge commit will not be signed off by default, violating the rule requiring all commits to be signed off. Furthermore, merge commits add significant noise to logs and complicate the syncing of branches and forks. Pull requests should also not be merged until the Travis CI jobs successfully run.

There are several possible scenarios when merging pull requests. See below for instructions on merging in each case.

### Master branch

The simplest case is a pull request with changes on the fork's master branch. In this case, run the following commands. Note that $FORK should be replaced with the namespace of the fork, i.e. the name of the user who created it. $REPO should be replaced with the repo name, e.g. cloudrouter. 

```sh
git checkout -b $FORK-master master
git pull https://github.com/$FORK/$REPO.git master
git checkout master
git merge --no-commit $FORK-master
git push origin/master
```

### Feature branch

If the pull request contains changes on a feature branch, run the following commands. Note that $FEATURE_BRANCH should be replaced with the name of the feature branch.

```sh
git checkout -b $FORK-$FEATURE_BRANCH master
git pull https://github.com/$FORK/$REPO.git $FEATURE_BRANCH
git checkout master
git merge --no-commit $FORK-$FEATURE_BRANCH
git push origin/master
```

### Complex merges

In some cases, the merge scenario may be more complex. For example, there may be two pull requests both based on the same commit in the upstream master repo. The first can be merged as noted above, but the second will now be one or more commits behind master. There are two ways of handling this.

#### 1. Cherry-picking commits

This approach is [documented here](http://git-scm.com/docs/git-cherry-pick). Note that this approach can also be used when you only wish to merge part of a pull request.

#### 2. Rebase before merge

This approach is better when you are dealing with a large number of commits.

```sh
git remote add $FORK https://github.com/$FORK/$REPO
git fetch $FORK 
git checkout -b $FORK-$FEATURE_BRANCH $FORK/$FEATURE_BRANCH 
git pull --rebase origin master 
```
