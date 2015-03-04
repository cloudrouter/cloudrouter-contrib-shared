# Contributor cient-side git-hooks

These [client-side git-hooks](http://git-scm.com/book/en/v2/Customizing-Git-An-Example-Git-Enforced-Policy#Client-Side-Hooks) are provided as a convenience for developers. They are also used for verifying commits before merge.

These hooks need to be kept as executables and moved to `${REPO_ROOT}/.git/hooks` directory. For example you would enable the auto-signoff by copying over `commit-msg.signoff-auto` to `${REPO_ROOT}/.git/hooks/commit-msg`.

```sh
cp contrib/hooks/commit-msg.signoff-auto .git/hooks/commit-msg
```
**Note** that these are not enabled automatically when cloning.

## Commit Message Hooks
These hooks are prefixed with `commit-msg`.

#### commit-msg.signoff-auto
This adds `Signed-off-by: AUTHOR` to all commits if one does not already exist.

#### commit-msg.signoff-verify
This checks if `Signed-off-by:` is present in your commit message. If it is not, the commit will be aborted.

## One-off bypass of enabled hooks
You can; if required bypass the local hooks by using the `--no-verify` option when committing.
