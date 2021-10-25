FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 sudo bash net-tools novnc x11vnc xvfb supervisor Cinnamon lxde gnome-shell ubuntu-gnome-desktop gnome-session gdm3 tasksel ssh terminator git nano curl wget zip unzip python3 python3-pip python-is-python3 iputils-ping docker.io falkon firefox
RUN apt install qemu qemu-kvm docker docker.io
RUN wget https://download2391.mediafire.com/8gm2qfu4t98g/9bg8p55zgfkzd4n/macOS+12-+21A5248p.iso
RUN sudo su
RUN add-apt-repository ppa:embrosyn/cinnamon

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/assets/configs/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
