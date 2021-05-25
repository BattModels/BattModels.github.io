
You're awesome! Thanks for making a submission. Let @awadell1 know if you get
stuck along the way.

## To Do List

- [ ] All status checks are green, if not try fixing them
- [ ] Add peer-reviewers, if needed, to your request
- [ ] All reviewers have approved your pull request

Once the above steps are complete, feel free to merge your pull request into master.

> Once your changes are merged, they will be live on the internet in ~2 minutes

## Peer Review

This helps catch issues before the changes go live (~2 minutes after merging to master),
and gives stakeholders a chance to provide feedback. What follows is a rough guide,
but when in doubt ask for a review.

| Change                                      | Reviewer Needed?                         |
|---------------------------------------------|------------------------------------------|
| Update your profile image, website or email | Nope, your good to go                    |
| News post about someone else?               | Add them as a reviewer                   |
| New project page?                           | Add someone (not just you) as a reviewer |
| Edits to an existing page?                  | Add the prior author                     |
| Docs, testing or code changes?              | Add Alex as a reviewer                   |
| Someone owns the file?                      | Github will add them as a reviewer       |

## Status Checks

In order to prevent broken links, missing images or other mayhem, we run a battery of checks on all submissions.
If you're having trouble passing you can always run the tests locally like this:

```shell
make test
```

This will attempt to install any needed python / ruby dependencies and may fail
if you use an older version of python For reference, the following versions are
used to build the released website:

- Python Latest 3.x version
- Ruby Latest 3.x version

If your getting `pre-commit` errors this will also fix some of them, allowing
you to then commit the corrections.
