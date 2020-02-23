This shows how to run our example without disrupting the Java setup on your system.
Of course, it requires Docker and administrative rights.

We don't cover installing Docker, but it's easy to setup.


Start by building a docker image for `consoleapp-java`. You actually can name it anything you like. We just chose the name based on our GitHub project name. This command must be run in the checkout directory, since files will be copied into the container to do the build. 

```
sudo docker image build -t consoleapp-java . 
```

Now you can fire up the container and open an interactive shell:

```
sudo docker run -it consoleapp-java bash 
```

This drops you to a root shell in the container (yes, you need to be careful, but there are ways to run without root, not covered here for now).


```
$ sudo docker run -it consoleapp-java bash                           
```

For testing, use the output of ls (we chose the /etc folder as input) to add words to the circular queue.


```
root@c8fdc1c6e04d:/usr/src/consoleapp-java# ls /etc | java -jar build/libs/consoleapp-0.1-SNAPSHOT.jar 
[X11]
[X11, adduser]
[X11, adduser, conf]
[X11, adduser, conf, alternatives]
[X11, adduser, conf, alternatives, apt]
[X11, adduser, conf, alternatives, apt, bash]
[X11, adduser, conf, alternatives, apt, bash, bashrc]
[X11, adduser, conf, alternatives, apt, bash, bashrc, bash]
[X11, adduser, conf, alternatives, apt, bash, bashrc, bash, completion]
[X11, adduser, conf, alternatives, apt, bash, bashrc, bash, completion, d]
[adduser, conf, alternatives, apt, bash, bashrc, bash, completion, d, bindresvport]
[conf, alternatives, apt, bash, bashrc, bash, completion, d, bindresvport, blacklist]
[alternatives, apt, bash, bashrc, bash, completion, d, bindresvport, blacklist, ca]
[apt, bash, bashrc, bash, completion, d, bindresvport, blacklist, ca, certificates]
[bash, bashrc, bash, completion, d, bindresvport, blacklist, ca, certificates, ca]
[bashrc, bash, completion, d, bindresvport, blacklist, ca, certificates, ca, certificates]
[bash, completion, d, bindresvport, blacklist, ca, certificates, ca, certificates, conf]
[completion, d, bindresvport, blacklist, ca, certificates, ca, certificates, conf, cron]
[d, bindresvport, blacklist, ca, certificates, ca, certificates, conf, cron, daily]
[bindresvport, blacklist, ca, certificates, ca, certificates, conf, cron, daily, debconf]
[blacklist, ca, certificates, ca, certificates, conf, cron, daily, debconf, conf]
[ca, certificates, ca, certificates, conf, cron, daily, debconf, conf, debian]
[certificates, ca, certificates, conf, cron, daily, debconf, conf, debian, version]
[ca, certificates, conf, cron, daily, debconf, conf, debian, version, default]
[certificates, conf, cron, daily, debconf, conf, debian, version, default, deluser]
...

root@c8fdc1c6e04d:/usr/src/consoleapp-java# exit
```

The last command, exit, leaves the container's bash session and drops you back to the host.
