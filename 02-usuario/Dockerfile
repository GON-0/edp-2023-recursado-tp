FROM ubuntu:22.04
LABEL maintainer="Gonzalo Longo; longogonzalo.g@gmail.com; EDP - TUIA"

WORKDIR /app
ADD scripts/ .

RUN chmod +x *

ENTRYPOINT ["./menu.sh"]
