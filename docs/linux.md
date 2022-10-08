# Linux Setup

Apart from developing on my personal macOS machine, I also use a headless Linux server at home
using Ubuntu Server 22.04

## OS Installation

- [Download Ubuntu Server ISO Image](https://ubuntu.com/download/server)
- Install Balena Etcher Bootable Media Tool
    - `brew install balenaetcher && open -a balenaEtcher.app`
- [Create Bootable Media](https://ubuntu.com/tutorials/create-a-usb-stick-on-macos#5-etcher-configuration)

## Server Setup

### Updates and Installs

Install the Latest Updates from APT

```shell
sudo apt update
sudo apt upgrade -y
sudo apt autoremove
```

#### ZSH

Install ZSH

```shell
sudo apt update && sudo apt dist-upgrade -y
sudo apt install build-essential curl file git
sudo apt install zsh
```

Install OhMyZSH

```shell
sudo apt install git-core curl fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Python

### pyenv

Clone `pyenv` locally

```shell
 git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

Set Up pyenv for ZSH

```shell
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zprofile
```

Install Build Dependencies

```shell
sudo apt-get update; sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

See more in the [pyenv section](python.md#pyenv)

##### pipx

```shell
python3 -m pip install --user pipx
python3 -m pipx ensurepath
```

See more in the [pipx section](python.md#pipx)


#### Docker

Install Docker's Dependencies

```shell
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

Add Docker’s official GPG key:

```shell
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Use the following command to set up the repository:

```shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install Docker Engine

```shell
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo chmod 666 /var/run/docker.sock
```

Verify that Docker Engine is installed correctly by running the `hello-world` image.

```shell
sudo docker run --rm hello-world
```

### Storage Drives

Determine Drive UUIDs with `sfdisk` and `blkid`

```shell
sudo sfdisk -l
sudo blkid
```

Edit the `/etc/fstab` file

```text
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
# <device>                                <dir>                <type> <options> <dump> <fsck>
UUID=7935f3ef-0344-4862-9144-1c317324330a /                    ext4   defaults  0      1
UUID=84f0c7d1-a7df-4d68-a8ed-3c7a877f79d5 /boot                ext4   defaults  0      1
UUID=FDD6-3DB4                            /boot/efi            vfat   defaults  0      1
/swap.img                                 none                 swap   sw        0      0
UUID=7e44dc88-cf94-428e-a4fa-e2511041c859 /media/nas           ext4   defaults  0      1
UUID=456cb24d-c6c6-4167-9822-cd722aec6be3 /media/temp          ext4   defaults  0      1
# UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx /media/storage_128   ext4   defaults  0      1
```

