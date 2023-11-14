#Namada Install Script

ONLY TESTED ON UBUNTU 22.04

Remember to run "chmod +x ./namada-installer.sh" to make the file executable, then just run ./namada-installer.sh to run the script and let it finish. You may need to reboot or click through some errors as detailed below. The install does complete and work.

Remember to "cd" into the same folder you download the installer file to before running the command.

The final result when the script ends will be a working node, you can "cd namada" then "namada --version" to check your install. 

I welcome pull requests, I am still learning my way around. I would ideally like to deploy this as a gist but I am having issue with making the script non-interactive. I could probably create a gist that would work on many machines, but it would fail a lot of the time with the issues I am having.

***Known Bugs***

I chose to "sudo apt upgrade" as part of the script, this is to allow you to install the latest packages and complete the install as I do not know whats on your server, but it may cuase alerts asking you to restart your computer to update your kernel or other file. You can skip these interactively or reboot your machine and continue the install afterwards if the alert bothers you.
