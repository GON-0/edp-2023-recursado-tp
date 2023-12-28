FROM ubuntu:22.04
LABEL maintainer="Gonzalo Longo; longogonzalo.g@gmail.com; EDP - TUIA"

RUN apt -y update
RUN apt -y install ffmpeg
RUN apt install -y graphicsmagick-imagemagick-compat 
RUN apt -y install cron
RUN apt -y install systemctl

WORKDIR /app
ADD scripts/ .
RUN chmod +x *

ENTRYPOINT [ "./cronDocker.sh" ]