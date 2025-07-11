# Github using SSH key

After you’ve added your SSH key to your GitHub account, open the terminal and run:

```
ssh -T git@github.com
```

## **Reconfigure existing repositories to use SSH**

The repositories we clone from now on using SSH will continue to use SSH for future Git commands such as git pull and git push. But existing local repositories, previously cloned with HTTPS, will continue to use HTTPS, unless we set them up to use SSH.

  

To do that, open the terminal and change the current directory to a local repository.


List the existing remote repositories and their URLs with:


```
git remote -v
```

That command should output something like:

  
```
origin https://your_server/your_user_name/your_project_name.git (fetch)
```

```
origin https://your_server/your_user_name/your_project_name.git (push)
```


Change your remote repository’s URL with:

  
```
git remote set-url origin git@your_server:your_user_name/your_project_name.git
```

Run git remote -v once more to verify that the remote repository’s URL has changed:


origin git@your_server:your_user_name/your_project_name.git (fetch)

origin git@your_server:your_user_name/your_project_name.git (push)

  
Great. That done, Git will use SSH, instead of HTTPS, to synchronize that local repository with its remote equivalent.