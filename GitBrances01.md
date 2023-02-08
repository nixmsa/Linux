
<pre>

[mahsan@jenkins my-docker]$ git log
commit 994096b4104023b2e56177e25a8915360d8b5b57 (HEAD -> main, origin/main, origin/HEAD)
Author: 4mahsan User <root@redhat8.example.com>
Date:   Wed Jan 4 22:11:21 2023 -0800

    modified README.me

commit b23e65eeb2899999afb3674ce871e73516574987
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:35:34 2022 +0000

    add output.txt

commit 8707d485408f79fc15cc3d32412e17d5325f328f
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:12:13 2022 +0000

    add docker compose

commit a6033637d166303d36d094e0217c1eaa3f8e18fb
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:04:27 2022 +0000

    add Docker file

commit 049e448643e4262f1b153b45d3da6f196a8f84f6
Author: mahsan User <mahsan@hotmail.com>
Date:   Sun Aug 21 18:44:11 2022 +0000

    Docker-compose installation on Ubuntu 22

commit 59408a629d3c67dedb9a3fbd1f61d7160ce9f45f
Author: mahsan User <mahsan@hotmail.com>
:

[mahsan@jenkins my-docker]$ git branch
* main


[mahsan@jenkins my-docker]$ git branch test
[mahsan@jenkins my-docker]$ git branch
* main
  test
[mahsan@jenkins my-docker]$


[mahsan@jenkins my-docker]$ git log
commit 994096b4104023b2e56177e25a8915360d8b5b57 (HEAD -> main, origin/main, origin/HEAD,<b> test</b>)
Author: 4mahsan User <root@redhat8.example.com>
Date:   Wed Jan 4 22:11:21 2023 -0800

    modified README.me

commit b23e65eeb2899999afb3674ce871e73516574987
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:35:34 2022 +0000

    add output.txt

commit 8707d485408f79fc15cc3d32412e17d5325f328f
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:12:13 2022 +0000

    add docker compose

commit a6033637d166303d36d094e0217c1eaa3f8e18fb
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:04:27 2022 +0000

    add Docker file

commit 049e448643e4262f1b153b45d3da6f196a8f84f6
Author: mahsan User <mahsan@hotmail.com>
Date:   Sun Aug 21 18:44:11 2022 +0000

    Docker-compose installation on Ubuntu 22

commit 59408a629d3c67dedb9a3fbd1f61d7160ce9f45f
Author: mahsan User <mahsan@hotmail.com>
:
***

ommit 59408a629d3c67dedb9a3fbd1f61d7160ce9f45f
Author: mahsan User <mahsan@hotmail.com>
[mahsan@jenkins my-docker]$ git checkout 049e448643e4262f1b153b45d3da6f196a8f84f6
Note: switching to '049e448643e4262f1b153b45d3da6f196a8f84f6'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:



****
[mahsan@jenkins my-docker]$ git log
commit 049e448643e4262f1b153b45d3da6f196a8f84f6 (HEAD)
Author: mahsan User <mahsan@hotmail.com>
Date:   Sun Aug 21 18:44:11 2022 +0000

    Docker-compose installation on Ubuntu 22

commit 59408a629d3c67dedb9a3fbd1f61d7160ce9f45f
Author: mahsan User <mahsan@hotmail.com>
Date:   Sun Aug 21 18:38:58 2022 +0000

    Docker installation on Ubuntu 22

commit 535fbacf5abd5c8f1e81d246363e6a61a6a3baf9
Author: mahsan User <mahsan@hotmail.com>
Date:   Sun Aug 21 18:11:23 2022 +0000

    Updated ReadMe and added Authors

commit bdc6b9d094c40afba0225451965386a47b4e6f02
Author: A H S A N <43077400+4msahsan@users.noreply.github.com>
Date:   Sun Aug 21 10:56:23 2022 -0700

    Initial commit
[mahsan@jenkins my-docker]$

[mahsan@jenkins my-docker]$ ls -ltr
total 8
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
-rw-rw-r-- 1 mahsan mahsan 36 Feb  5 06:12 README.md
[mahsan@jenkins my-docker]$


[mahsan@jenkins my-docker]$ git switch -
Previous HEAD position was 049e448 Docker-compose installation on Ubuntu 22
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
[mahsan@jenkins my-docker]$ ls -ltr
total 8
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
[mahsan@jenkins my-docker]$

[mahsan@jenkins my-docker]$ git log
commit 994096b4104023b2e56177e25a8915360d8b5b57 (HEAD -> main, origin/main, origin/HEAD, test)
Author: 4mahsan User <root@redhat8.example.com>
Date:   Wed Jan 4 22:11:21 2023 -0800

    modified README.me

commit b23e65eeb2899999afb3674ce871e73516574987
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:35:34 2022 +0000

    add output.txt

commit 8707d485408f79fc15cc3d32412e17d5325f328f
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:12:13 2022 +0000

    add docker compose

commit a6033637d166303d36d094e0217c1eaa3f8e18fb
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:04:27 2022 +0000

    add Docker file

commit 049e448643e4262f1b153b45d3da6f196a8f84f6
Author: mahsan User <mahsan@hotmail.com>
Date:   Sun Aug 21 18:44:11 2022 +0000

    Docker-compose installation on Ubuntu 22

***
[mahsan@jenkins my-docker]$ git switch test
Switched to branch 'test'
[mahsan@jenkins my-docker]$ ls
AUTHORS  httpd  Install  README  README.md
[mahsan@jenkins my-docker]$ ls -ltr
total 8
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
[mahsan@jenkins my-docker]$

[mahsan@jenkins my-docker]$ git log
commit 994096b4104023b2e56177e25a8915360d8b5b57 (HEAD -> test, origin/main, origin/HEAD, main)
Author: 4mahsan User <root@redhat8.example.com>
Date:   Wed Jan 4 22:11:21 2023 -0800

    modified README.me

commit b23e65eeb2899999afb3674ce871e73516574987
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:35:34 2022 +0000


***
[mahsan@jenkins my-docker]$ git branch
  main
* test
[mahsan@jenkins my-docker]$

[mahsan@jenkins my-docker]$ echo "This is new File1 File" >> file1
[mahsan@jenkins my-docker]$ ll
total 12
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
-rw-rw-r-- 1 mahsan mahsan 23 Feb  5 06:21 file1
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
[mahsan@jenkins my-docker]$


[mahsan@jenkins my-docker]$ git add .
[mahsan@jenkins my-docker]$ git commit -m "Add file1 on test branch"
[test 589f53b] Add file1 on test branch
 1 file changed, 1 insertion(+)
 create mode 100644 file1
[mahsan@jenkins my-docker]$


[mahsan@jenkins my-docker]$ clear
[mahsan@jenkins my-docker]$ git branch
  main
* test
[mahsan@jenkins my-docker]$ git log
commit 589f53b5ad393e19a60652e0c98c6d52a2a521a6 (HEAD -> test)
Author: 4mahsan <msahsan@hotmail.com>
Date:   Sun Feb 5 06:23:07 2023 -0800

    Add file1 on test branch

commit 994096b4104023b2e56177e25a8915360d8b5b57 (origin/main, origin/HEAD, main)
Author: 4mahsan User <root@redhat8.example.com>
Date:   Wed Jan 4 22:11:21 2023 -0800

    modified README.me

commit b23e65eeb2899999afb3674ce871e73516574987
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:35:34 2022 +0000

    add output.txt

commit 8707d485408f79fc15cc3d32412e17d5325f328f
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:12:13 2022 +0000

    add docker compose

commit a6033637d166303d36d094e0217c1eaa3f8e18fb
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:04:27 2022 +0000

[mahsan@jenkins my-docker]$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
[mahsan@jenkins my-docker]$ ll
total 8
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
[mahsan@jenkins my-docker]$


[mahsan@jenkins my-docker]$ git log
commit 994096b4104023b2e56177e25a8915360d8b5b57 (HEAD -> main, origin/main, origin/HEAD)
Author: 4mahsan User <root@redhat8.example.com>
Date:   Wed Jan 4 22:11:21 2023 -0800

    modified README.me

commit b23e65eeb2899999afb3674ce871e73516574987
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:35:34 2022 +0000

    add output.txt

commit 8707d485408f79fc15cc3d32412e17d5325f328f
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:12:13 2022 +0000

    add docker compose

commit a6033637d166303d36d094e0217c1eaa3f8e18fb
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:04:27 2022 +0000

    add Docker file

commit 049e448643e4262f1b153b45d3da6f196a8f84f6
Author: mahsan User <mahsan@hotmail.com>
Date:   Sun Aug 21 18:44:11 2022 +0000

    Docker-compose installation on Ubuntu 22


****
[mahsan@jenkins my-docker]$ ll
total 8
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
[mahsan@jenkins my-docker]$ git branch
* main
  test
[mahsan@jenkins my-docker]$ echo "Adding file5 on Main Branch" >> file5
[mahsan@jenkins my-docker]$ git add .
[mahsan@jenkins my-docker]$ git commit -m "add file5 on master"
[main a92b333] add file5 on master
 1 file changed, 1 insertion(+)
 create mode 100644 file5
[mahsan@jenkins my-docker]$ ll
total 12
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
-rw-rw-r-- 1 mahsan mahsan 28 Feb  5 06:29 file5
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
[mahsan@jenkins my-docker]$


[mahsan@jenkins my-docker]$ git log
commit a92b333aef5a2b1bfbde18af75046d96b999ffa6 (HEAD -> main)
Author: 4mahsan <msahsan@hotmail.com>
Date:   Sun Feb 5 06:29:27 2023 -0800

    add file5 on master

commit 994096b4104023b2e56177e25a8915360d8b5b57 (origin/main, origin/HEAD)
Author: 4mahsan User <root@redhat8.example.com>
Date:   Wed Jan 4 22:11:21 2023 -0800

    modified README.me

commit b23e65eeb2899999afb3674ce871e73516574987
Author: Shahid Ahsan <msahsan@hotmail.com>
Date:   Tue Aug 23 23:35:34 2022 +0000

[mahsan@jenkins my-docker]$ git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
[mahsan@jenkins my-docker]$


[mahsan@jenkins my-docker]$ git push origin main
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 297 bytes | 297.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:4msahsan/my-docker.git
   994096b..a92b333  main -> main
[mahsan@jenkins my-docker]$

[mahsan@jenkins my-docker]$ git push origin test
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 291 bytes | 291.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
remote:
remote: Create a pull request for 'test' on GitHub by visiting:
remote:      https://github.com/4msahsan/my-docker/pull/new/test
remote:
To github.com:4msahsan/my-docker.git
 * [new branch]      test -> test
[mahsan@jenkin
*** merge branch ***

[mahsan@jenkins my-docker]$ git checkout test
Switched to branch 'test'
[mahsan@jenkins my-docker]$ git branch
  main
* test
[mahsan@jenkins my-docker]$ ll
total 12
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
-rw-rw-r-- 1 mahsan mahsan 23 Feb  5 06:39 file1
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
[mahsan@jenkins my-docker]$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
[mahsan@jenkins my-docker]$ git branch
* main
  test
[mahsan@jenkins my-docker]$ ll
total 12
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
-rw-rw-r-- 1 mahsan mahsan 28 Feb  5 06:40 file5
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
[mahsan@jenkins my-docker]$ git merge test
Merge made by the 'recursive' strategy.
 file1 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 file1
[mahsan@jenkins my-docker]$



Merge branch 'test'
# Please enter a commit message to explain why this merge is necessary,
# especially if it merges an updated upstream into a topic branch.
#
# Lines starting with '#' will be ignored, and an empty message aborts
# the commit.
~
~
~
~

[mahsan@jenkins my-docker]$ git branch
* main
  test
[mahsan@jenkins my-docker]$ ll
total 16
-rw-rw-r-- 1 mahsan mahsan  0 Feb  5 06:06 AUTHORS
-rw-rw-r-- 1 mahsan mahsan 23 Feb  5 06:40 file1
-rw-rw-r-- 1 mahsan mahsan 28 Feb  5 06:40 file5
drwxrwxr-x 2 mahsan mahsan 69 Feb  5 06:16 httpd
drwxrwxr-x 2 mahsan mahsan 80 Feb  5 06:06 Install
-rw-rw-r-- 1 mahsan mahsan 13 Feb  5 06:06 README
-rw-rw-r-- 1 mahsan mahsan 40 Feb  5 06:16 README.md
[mahsan@jenkins my-docker]$

[mahsan@jenkins my-docker]$ git log
commit 7304ddbaff534cf2470cd20bc2fe5beba0fb3903 (HEAD -> main)
Merge: a92b333 589f53b
Author: 4mahsan <msahsan@hotmail.com>
Date:   Sun Feb 5 06:40:25 2023 -0800

    Merge branch 'test'

commit a92b333aef5a2b1bfbde18af75046d96b999ffa6 (origin/main, origin/HEAD)
Author: 4mahsan <msahsan@hotmail.com>
Date:   Sun Feb 5 06:29:27 2023 -0800

    add file5 on master

commit 589f53b5ad393e19a60652e0c98c6d52a2a521a6 (origin/test, test)
Author: 4mahsan <msahsan@hotmail.com>
Date:   Sun Feb 5 06:23:07 2023 -0800

    Add file1 on test branch

commit 994096b4104023b2e56177e25a8915360d8b5b57
Author: 4mahsan User <root@redhat8.example.com>
Date:   Wed Jan 4 22:11:21 2023 -0800

    modified README.me


[mahsan@jenkins my-docker]$ git status
On branch main
Your branch is ahead of 'origin/main' by 2 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
[mahsan@jenkins my-docker]$

[mahsan@jenkins my-docker]$ git branch
* main
  test
[mahsan@jenkins my-docker]$ git push origin main
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 278 bytes | 278.00 KiB/s, done.
Total 2 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:4msahsan/my-docker.git
   a92b333..7304ddb  main -> main
[mahsan@jenkins my-docker]$

[mahsan@jenkins my-docker]$ git log
commit 7304ddbaff534cf2470cd20bc2fe5beba0fb3903 (HEAD -> main, origin/main, origin/HEAD)
Merge: a92b333 589f53b
Author: 4mahsan <msahsan@hotmail.com>
Date:   Sun Feb 5 06:40:25 2023 -0800

    Merge branch 'test'

commit a92b333aef5a2b1bfbde18af75046d96b999ffa6
Author: 4mahsan <msahsan@hotmail.com>
Date:   Sun Feb 5 06:29:27 2023 -0800

    add file5 on master

commit 589f53b5ad393e19a60652e0c98c6d52a2a521a6 (origin/test, test)
Author: 4mahsan <msahsan@hotmail.com>
Date:   Sun Feb 5 06:23:07 2023 -0800

    Add file1 on test branch



</pre>











