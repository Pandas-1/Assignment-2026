#### Level 0
had to figure out what SSH is and how to use it
```
password - **bandit0**
```
#### Level 1
just open read me
```
password - ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
```

#### Level 2
files names `-` pose a problem, so specify location while referencing them i.e ./-
```
password - 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
```
#### Level 3
file names with a space can be worked with using `\ ` when referencing them (found this out by clicking tab to autofill the file name)
```
password - MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
```
#### Level 4
I knew for hidden folders you can see by
```
ls -a 
```
I had to look up but how to cd into them. i forgor that ...Hiding-From-You is a file and not a folder, i can just do normal cat for it
```
password - 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
```
#### Level 5
There is probably a fancy way to do this but because i just had to find the file out of 9 i just opened each of them one by one
```
password - 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
```
#### Level 6
```
ls -laR | grep 1033
```
cuz -R is for recursive subdirectory listing, then pull up a grep and check manually
```
password - HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
```
#### Level 7
ran a global search with ls 
```
-laR
```
 and then spotted a range of folders in which it could be, then in the folder with those folders i grep and using the argument of like -B 100 i was able to track exactly which folder it was in.
 ```
password - morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
 ```
##### Level 8
just run 
```
cat data.txt | grep millionth
```

```
password - dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
```
#### Level 9
noting that 
```
uniq -c
``` 
only counts consequtive same line, you first make it sorted using sort then use uniq -c to get the total number of instances of each line and then you can grep for only 1 or better just scroll to find it 
```
password - 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
```
#### Level 10
Just printing the human readable part of the file is sufficient to get the password easily. just did 
```
cat file.txt | strings
```

```
password - FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```
#### Level 11
has to look up what base64 does and it has a convenient decode feature so just decoded the data file
```
password - dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
```
#### Level 12
you can use the tr function which kinda maps one string letters to another, and you just map 
```
tr abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM 
```
and it works
```
password - 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
```
#### Level 13
I really struggled with this one as after unhexing i didnt understand how to find out what type of encryption it was. Google searched to find out like each encryption type has a label at the start of the hexdump and using that i was able to slowly back track
First its gzip bzip gzip. Then hexdumping tells us it must be an archive so i had to use the tar to extract it. You get a bin fine which is again a compressed archive. It continues with a few more layers of compressions identified always by hexdumping.
```
password - FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
```
#### Level 14
i got a rsa private key and had to add the argument of -i to the ssh command
```
password- MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
```
#### Level 15
had to connect to localhost so used netcat to localhost and given port
```
password - 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
```
#### Level 16 
To do a SSL/TLS connection i had use the openssl library for the connection and tell it that i am the client, the server address and port. using 
```
openssl s_client -connect localhost:30001
```

```

password - kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
```
#### Level 17
first you can do nmap with a port argument on localhost to check what ports are open. then connecting to each of them one by one using ssh will confirm which one of them speak ssl and then typing a random message confirms if they are the one we want. Note when you type the password on the final one you get a output KEYUPDATE, this is a incredibly annoying occurrence which happens because for some god-forsaken reason when you give a ssh talking server input starting with k or K it inteprets it as a keyupdate. To fix this bs you have to connect with the following argument 
```
-ign_eof
```
instead of -connect.
```

password -
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----

```
#### Level 18
Just using diff command is sufficient to find the solution
```
diff
```

```
password - x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
```
#### Level 19
In the ssh command you can add the command you want to execute just after connecting and this bypasses the kicking thing in .bashrc(somehow)
```
password - cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
```
#### Level 20
running the file tells me it runs a command as another user, we also know using ls -la that the file is owned by bandit20, and running whoami with the file tells us we are executing the command as bandit20 and with this you can read the password file
```
password - 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
```
#### Level 21
this file wants a port which returns the previous password, checking all active ports using nmap and testing them tells us that there are no ports which return the password. To fix this we need to make a port on localhost which replies the old password, we can do this by using netcat -l and then use -p to define the port its running on, to make it reply the message we want we can use 
```
echo password | netcat -l -p <your port> 
```
we gotta use & as it must run in the background while we interact with the terminal. The alternate solution to this & could be to split the terminal in 2(i was unable to properly do that)
```
password - EeoULMCra2q0dSkYj561DX7s1CpBuOBt
```