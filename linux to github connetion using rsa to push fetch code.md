# SSH Connection linux to github using RSA to push and fetch code

- Connected wsl kali distro with github ssh  using generated id_rsa.pub

### RSA key generation
`ssh-keygen -t rsa -b 4096 -C 'mail@asd.com'
Generating public/private rsa key pair.
Enter file in which to save the key (/home/kali/.ssh/id_rsa): | Press enter or enter file where you want to save
Enter passphrase (empty for no passphrase): | enter passphrase or enter without any passphrase
Enter same passphrase again: | it'll ask if you enter passphrase

### for RSA:
cat ~/.ssh/id_rsa.pub
Copy the entire output, which starts with ssh-ed25519 or ssh-rsa.

b. Add the Key to GitHub:
    Log in to GitHub and navigate to Settings.
    Go to SSH and GPG keys.
    Click on "New SSH key" or "Add SSH key".
    Provide a Title (e.g., "My Laptop SSH Key").
    Paste the Public Key into the "Key" field.
    Click "Add SSH key".
    Confirm with your GitHub password if prompted.

### Test the ssh connection
`ssh -T git@github.com` # if connection successful, then you'll see successful message

Example of ssh connection with github
After execute - `git remote -v`
if ssh - 
origin  git@github.com:username/repo.git (fetch)
origin  git@github.com:username/repo.git (push)


if HTTPS -
origin  https://github.com/username/repo.git (fetch)
origin  https://github.com/username/repo.git (push)


Now, you can push and fetch code.