# This is a comment
FROM ubuntu:14.04
RUN apt-get update 
RUN apt-get install -y emacs
RUN apt-get install -y curl
RUN apt-get install -y python
RUN sudo apt-get install -y python-pygame
