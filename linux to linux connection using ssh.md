# Linux to Linux connection using SSH | VScode to linux
- This connection workded fine between ubuntu and kali linux both in my wsl.
- Also kali/ubunto to Dedicated Kali Linux machine.
- in local network, it worked fine. Local machine access from the internet.
    - I will work with this type of setup later.


Here, one linux will be client and another will be server.
Think ubuntu as a server and kali as a client.
Also, usename and pass are the 'ubuntu' and 'kali' respectively.

## Server side
Install the SSH server on the server side.
```bash
sudo apt-get install openssh-server
```

Check the status of the SSH server.
```bash
sudo systemctl status ssh
```

If it's not running, then start the service.
```bash
sudo systemctl start ssh
```

Check the host IP
```bash
hostname -I
```
Also, note the username of the server.


## Client side
# By default, openssh-client is installed in linux distros. But, if it's not installed, then install it.
```bash
sudo apt-get install openssh-client
```

Now, connect to the server using the following command.
```bash
ssh username@server_ip
```

Done. You are connected to the server.

