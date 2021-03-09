Viswanathan Research Group
==========================

Website built using (and grateful to) [this template](https://github.com/uwsampa/research-group-web), of which this is no longer a fork so that we can have our own issues and pull requests. See bottom of this file for licensing info, etc.

This README is a slightly modified, compressed, and reorganized version of the original from the template.


Quick Setup
-----------

1. Install the dependencies. You will need Python, bibble (`pip install bibble`), [Ruby][], and Jekyll (`gem install jekyll`). NOTE that you need Ruby 2.4 or higher and Jekyll 4.0 or higher. You can check these with `ruby -v` and `jekyll -v` respectively.
2. Clone the repo to your local machine. MAKE A BRANCH, DO NOT COMMIT TO MASTER! (Or, fork it first and then commit to master all you want on your own fork)
3. Type `make` to build the site and then run `make serve` to view the site locally.
4. Make edits (see below for guidelines/gotchas for particular sections). Continue to preview locally to make sure things work as you want.
5. Once you're happy with your changes, make a PR from your branch to master.

[Ruby]: https://www.ruby-lang.org/en/

Personnel
---------

People are listed in a [YAML][] file in `_data/people.yml`. You can list the name, link, bio, and role of each person. Roles (e.g., "Faculty", "Staff", and "Students") are defined in `_config.yml`.

[YAML]: https://en.wikipedia.org/wiki/YAML

Publication List
----------------

The list of publications is in `bib/pubs.bib`. Typing `make` will generate `pubs.html`, which contains a pretty, sorted HTML-formatted list of papers. The public page, `publications.html`, also has a link to download the original BibTeX.


News Items and Blog Posts
-------------------------

For both long-form blog posts and short news updates, we use Jekyll's blogging system. To post a new item of either type, you create a file in the `_posts` directory using the naming convention `YYYY-MM-DD-title-for-url.md`. The date part of the filename always matters; the title part is currently only used for full blog posts (but is still required for news updates).

The file must begin with [YAML front matter][yfm]. For news updates, use this:

    ---
    layout: post
    shortnews: true
    ---

For full blog posts, use this format:

    ---
    layout: post
    title:  "Some Great Title Here"
    ---

And concoct a page title for your post. The body of the post goes after the `---` in either case.

You can also customize the icon that is displayed on the news feed. By default it's `newspaper-o`. We use icons from the [FontAwesome][fa] icon set.

[yfm]: http://jekyllrb.com/docs/frontmatter/
[fa]: http://fontawesome.io/icons/

Miscellaneous Troubleshooting Notes
-----------------------------------

* If you add/remove personnel and one of the entries gets cut off, tweak the numbers in the `.person` section of `css/group.css` and eventually you'll figure out a combination that works


Credit Where Credit is Due
--------------------------
This project originated at the University of Washington.  You can see the machinery working live at [our site][sampa].

This work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License][license].

[sampa]: http://sampa.cs.washington.edu/
[license]: https://creativecommons.org/licenses/by-nc/4.0/
