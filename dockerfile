FROM amazonlinux
WORKDIR ./etc/
COPY script.sh .
RUN chmod a+x ./script.sh

