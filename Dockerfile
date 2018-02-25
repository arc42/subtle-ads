# Dockerfile to update subtle-ads on all arc42.org websites
###########################################################

# minimal linux
FROM alpine:3.6

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh ncurses

LABEL version="1.0.0"
LABEL description="updates subtle-ads on arc42 websites: \
(1) clone the respective repos and\
(2) update the submodules within.\
(3) commit and push, which\
(4) initiates re-generation of github-pages."

COPY update-submodules-in-container.sh /update-submodules-in-container.sh
RUN chmod +x /update-submodules-in-container.sh

# ensure git actions are attributed
RUN git config --global user.email "gs@gernotstarke.de" && \
    git config --global user.name "arc42 update-ads Docker container"

# in case interactive sessions will be used, set decent prompt
# RUN export PS1='$(whoami)@arc42-docker-container-$(hostname):$(pwd) >'

CMD ["./update-submodules-in-container.sh"]
