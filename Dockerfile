FROM ubuntu:18.04

RUN apt-get update;

## install git. moved this to top since it was generating errors when run at the bottom
RUN apt-get install git -y;

RUN apt-get update; \
    apt install -y openssh-client; \
    apt install -y python3-pip

RUN pip3 install --upgrade pip; \
    pip3 install "ansible==2.9.12"

## add the winrm modules
RUN pip3 install pywinrm; \
    pip3 install pywinrm[credssp]

## install azure modules
RUN pip install ansible[azure]

RUN apt-get update;

## install powershell
RUN apt-get install -y wget apt-transport-https; \
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb; \ 
    dpkg -i packages-microsoft-prod.deb; \
    apt-get update; \
    add-apt-repository universe; \
    apt-get install -y powershell; \
    pwsh -c "Set-PackageSource -Name PSGallery -Trusted"; \
    pwsh -c "Install-Module AZ -Scope AllUsers"

## install git
#RUN apt-get install git -y; \
#    git clone https://github.com/Duffney/becomeansible.git

#
#The following packages have unmet dependencies:
#git : Depends: perl but it is not going to be installed
#       Depends: liberror-perl but it is not going to be installed

