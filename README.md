# Public generate files demo

Run a script to generates a file `public/mtcars.csv` and publish it on
GitHub pages for download.  The file becomes available at
https://omsai.github.io/publicfilesdemo/

A known issue is you will lose your local generated file
`public/mtcars.csv`.  You can avoid this by committing it to your
current branch before pushing.

```console
$ Rscript generate.R
Wrote public/mtcars.csv with hash 553fc1cc2c673efa3eb4cfc880a9bd83
$ ./push.bash
+ set -e
++ git rev-parse --abbrev-ref HEAD
+ current_branch=master
+ grep -q -Fw gh-pages
+ git branch
+ git branch -D gh-pages
Deleted branch gh-pages (was 6f3bdc1).
+ git checkout --orphan gh-pages
M	README.md
Switched to a new branch 'gh-pages'
+ git add --force public/mtcars.csv
+ git commit -m 'ENH: Publish gh-pages'
[gh-pages (root-commit) 499d860] ENH: Publish gh-pages
 6 files changed, 99 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 README.md
 create mode 100644 generate.R
 create mode 100644 public/index.html
 create mode 100644 public/mtcars.csv
 create mode 100755 push.bash
++ git subtree split --prefix public gh-pages
+ git push origin b4b72746561540bf734a78d264734b7a72984832:gh-pages --force
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 1.28 KiB | 1.28 MiB/s, done.
Total 4 (delta 0), reused 0 (delta 0)
To github.com:omsai/publicfilesdemo.git
 + 116be40...b4b7274 b4b72746561540bf734a78d264734b7a72984832 -> gh-pages (forced update)
+ git checkout master
M	README.md
Switched to branch 'master'
```

The file then becomes available for download under
https://omsai.github.io/publicfilesdemo/ where for your use, you
replace "omsai" with your username or organization, and
"publicfilesdemo" with your repository name.
