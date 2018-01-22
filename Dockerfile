# Runner for nodejs project
FROM ubuntu:latest

COPY go.sh go.sh

RUN chmod +x go.sh

# Install gitlab-runner and nodejs v7
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash  && \
    apt-get install -y gitlab-runner && \
    curl -sL https://deb.nodesource.com/setup_7.x | bash  && \
    apt-get -y install nodejs

CMD [ "/go.sh" ]
