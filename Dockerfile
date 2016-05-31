# This is a comment
FROM ubuntu:14.04
RUN apt-get update 
RUN apt-get install -y emacs
RUN apt-get install -y curl
RUN apt-get install -y python
RUN sudo apt-get install -y python-pygame

RUN curl https://gist.githubusercontent.com/SravanthiSinha/a889e9b4c5052802fd688e4eb0ea45b3/raw/2902f09f1d7b9152fd7d3841eb286aa8eda7b33d/jumper.py > game.py

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0600 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
