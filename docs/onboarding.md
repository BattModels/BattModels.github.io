# On-Boarding

Welcome to the team! As a quick order of business, let's get you added to the website!

> All references to John Doe are for illustration. Please use
> a more descriptive branch name. Like `add_your_name` instead of `add_john_doe`

1) Install [git], create a [GitHub] account and request to join [BattModels]
    - [Setting up Git](https://docs.github.com/en/get-started/quickstart/set-up-git)
    - [Connecting to GitHub from git](https://docs.github.com/en/get-started/quickstart/set-up-git#authenticating-with-github-from-git)
3) Clone the website: `git clone https://github.com/BattModels/group-website.git`
4) Open `_data/people.yml` in the newly created `group-website` folder
5) Add a small (<100 Kb) headshot here: `img/people/uniqname.png`
    - If your headshot is too large, try compressing it with an [online tool](https://imagecompressor.com/)
    - Aspect ratio should be 1:1 with the head centered in the image ([Example](https://github.com/BattModels/group-website/blob/main/img/people/venkvis.png))

5) Add an entry to the end of the appropriate section:
    - i.e. if you're a master's student, add your entry under `# masters`
    - Refer to [Entry Format](#entry-format) for the desired format

5) Commit and push your changes:
    - Create a new branch: `git checkout -b add_john_doe`
    - Add files to the staging area with `git add`
        - `git add _data/people.yml`
        - `git add img/people/uniqname.png`
    - Commit the staged changes: `git commit -m "Adding John Doe's Info"`
    - Push the commit to Githib with `git push -u origin add_john_doe`

6) Open a [pull request on Github][pr]
    - If this is your first commit, slack @awadell1 to approve running CI ([GitHub will ask if needed](https://docs.github.com/en/actions/managing-workflow-runs/approving-workflow-runs-from-public-forks))
    - If all [checks pass](https://github.com/BattModels/group-website/actions/workflows/CI.yml), [merge your pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/merging-a-pull-request)
    - Otherwise, try to [fix the issues](1) or [ask for help](2)

7) Congrats on making your first pull request in the group!

[1]: https://github.com/BattModels/group-website/blob/main/docs/making_changes.md#status-checks
[2]: https://github.com/BattModels/group-website/issues

## Entry Format

```yaml
your_uniqname:
    display_name: "John Doe"
    role: staff
    image: img/people/your_uniqname.png
    webpage: "www.john_doe_awesome_site.com"
    email: "jdoe [at] umich [dot] edu"
    bio: Current Position
```


### Roles

We define several roles (Full List is in `_config.yml`), but you probably want
one of the following:

- `phd`
- `masters`
- `ugrad`
- `postdoc`
- `staff`

[git]: https://git-scm.com/
[GitHub]: https://github.com
[BattModels]: https://github.com/BattModels
[pr]: https://github.com/BattModels/group-website/pulls

### Personal Website

Common websites to link to:

- [Linkedin](https://www.linkedin.com)
- [Google Scholar](https://scholar.google.com/)
- Personal Blog

If you do not have a website, please omit this entry. You are always welcome to add one later.

### Bio

For your bio enter your current title, omitting your educational level. For
example, a P.h.D student in Mechanical Engineering, would put "Mechanical
Engineer".

If you have already graduated, you may include your educational level if desired.
