FROM ubuntu
ENV PATH /bin/bash:$PATH
WORKDIK /opt
RUN touch test && cp /opt/test /tmp
CMD ["/bin/bash"]