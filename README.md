## GSP943 - Using Ruby on Rails with Cloud SQL for PostgreSQL on Cloud Run

Self: https://github.com/palladius/20240809-qwiklab-rails-on-gcp

This is Riccardo walking you through his "Friction Logging" of this great Ruby on Rails resources: [GSP943 - Using Ruby on Rails with Cloud SQL for PostgreSQL on Cloud Run](https://www.cloudskillsboost.google/focuses/20047?parent=catalog).


All missing scripts should be in `palladius/sakura`, most likely under `bin/`.

* Codelab: https://www.cloudskillsboost.google/focuses/20047?parent=catalog
* Article on Medium: https://medium.com/@palladiusbonton/ruby-on-rails-with-postgresql-on-cloud-run-bdaaf0b26e0b
* GitHub repo: https://github.com/palladius/20240809-qwiklab-rails-on-gcp
    * Additional scripts: GitHub repo: https://github.com/palladius/sakura/
* Youtube videos (obsolete):
    * https://www.youtube.com/watch?v=hC9GNqBp4eQ OBSOLETE with no chapter names
    * https://www.youtube.com/watch?v=HOC2Q3eE7dc Youtube video (new but 1 bug)
    * https://www.youtube.com/watch?v=vpPftSHE9kM 3rd one (hopefully good enough)
* FL Doc (private): https://docs.google.com/document/d/1_Jj0d9Sd9l4x7kPWz439u5WMtqJC6av-b35NQkV8s7c/edit

## About this folder

This folder contains the `.envrc` and `00-init.sh` produced by my closed-source `codelabba.rb` script (which just copies files over, so no biggie).

It also contains the shell scripts, `00` to `07`, which perform the actions in the Codelab.

To work, you need to "install" my `palladius/sakura` github repo, and by insalling I mean:

```
cd ~/git/ # or whatever you prefer
git clone https://github.com/palladius/sakura
export PATH=~/git/sakura/bin/:$PATH
```

This will expose you to amazing scripts like `green`, `10times`, and of course `proceed_if_error_matches`. Not to mention `gcloud_auto_import_config`, which changed my life.
