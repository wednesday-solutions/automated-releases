# Automated Releases

Generate automated release on merge to main branched using git commits as release notes and package.json version a release version.

## Syntax for adding commit messages

To use this module, your commit messages have to be in this format:

```
type(category): description [flags]
```

Where `type` is one of the following:

- `build`
- `docs`
- `feature`
- `fix`
- `others`
- `performance`
- `refactor`
- `revert`
- `style`
- `test`

Where `flags` is an optional comma-separated list of one or more of the following (must be surrounded in square brackets):

- `breaking`: alters `type` to be a breaking change

And `category` can be anything of your choice. If you use a type not found in the list (but it still follows the same format of the message), it'll be grouped under `other`.

## Release commit

- To create an alpha release via Pull Request, the PR Title must have `alpha release` or `release alpha` present.
- To create an alpha release directly via commit, the commit message must have `alpha release` or `release alpha` present.

![](/commits.png)

## Result
![](/release.png)
## Github Actions used

- https://github.com/marketplace/actions/generate-changelog-action
- https://github.com/marketplace/actions/create-a-release
