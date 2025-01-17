FROM ubuntu
ARG TOOLS="net-tools unzip curl"
RUN apt-get update && apt-get install -y $TOOLS
CMD ["bash"]