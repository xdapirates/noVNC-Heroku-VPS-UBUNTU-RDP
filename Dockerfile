FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install sudo bash novnc x11vnc xvfb supervisor python3 python3-pip python-is-python3 iputils-ping wget
RUN wget https://www.google.com/chrome/thank-you.html?platform=linux&statcb=0&installdataindex=empty&defaultbrowser=0#
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN google-chrome
RUN su --

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/assets/configs/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
