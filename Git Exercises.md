## 1- master
Followed instructions, note to run the configure via the gitbash
## 2- commit-one-file
I git add `A.txt`, i git commit it, then add a commit message, to exit the commit message i need to click escape and do some command line editor things to save the changes

## 3- commit-one-file-staged
use git reset to remove one file then commit

## 4- ignore-them
had to learn how to use `.gitignore` then made the error of not properly defining the library directory and not a file named library

## 5- chase-branch
as you want the chase-branch to move to the escaped you can merge the escaped into chase as you want chase to be the primary

## 6- merge-conflict
two files contain different parts of the same line, was fixing the issue inappropriately, In the end in the "merge" mode i had to edit the file such that it was in the form i wanted in the end

## 7- save-your-work 
unclear in what they want me to do, I can see they want me to stash the current state of system, edit the bug file(remove the bug), commit that, pop the stash then edit the bug file(adding new line) then commit that
edit- worked afterwards as i was not popping the stash, i was making another stash instead of popping it

## 8- change-branch-history
had to make sure what is the order of rebasing, you MOVE the branch you are currently on to the other branch where you want to rebase to(becomes the new primary kinda)

## 9- remove-ignored
to remove a file from tracking only had to look up rm --cached which removes it from tracking only whereas rm would delete the file

## 10- case-sensitive-filename
normal renaming(mv) might have required me to add that file in the staging zone again but using git mv i think realized that it will stage itself

## 11- fix-typo
using git commit --amend makes a new commit discarding the previous commit, so make the changes you want to make on the old commit then do amend

## 12- forge-date
in the command line editor changing the date didnt work so had to shift to using --date="1987" argument 

## 13- fix-old-typo
Have to use the head interactive mode while rebasing, and then change the line to edit on the part where i want to start changing commits from. After choosing the initial commit then fix the hello world then continue in rebase and then I will have fix the merge conflict in file.txt. 