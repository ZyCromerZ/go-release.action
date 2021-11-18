FROM golang:1.15.10
MAINTAINER Atsushi Nagase <a@ngs.io> (https://ngs.io)

LABEL "com.github.actions.name"="Go Release Binary"
LABEL "com.github.actions.description"="Automate publishing Go build artifacts for GitHub releases"
LABEL "com.github.actions.icon"="cpu"
LABEL "com.github.actions.color"="orange"

LABEL "name"="Automate publishing Go build artifacts for GitHub releases through GitHub Actions"
LABEL "version"="1.0.3"
LABEL "repository"="http://github.com/ngs/go-release.action"
LABEL "homepage"="http://ngs.io/t/actions/"

LABEL "maintainer"="Atsushi Nagase <a@ngs.io> (https://ngs.io)"

ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -qq && \
    apt-get upgrade -y && apt-get -y install curl jq git build-essential bash zip

ADD entrypoint.sh /entrypoint.sh
ADD build.sh /build.sh
ENTRYPOINT ["/entrypoint.sh"]
