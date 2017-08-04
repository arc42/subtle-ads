# Dockerfile to update subtle-ads on all arc42.org websites
###########################################################

# minimal linux
FROM alpine:3.6

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

LABEL version="0.1"
LABEL description="updates subtle-ads on arc42 websites: \

(1) clone the respective repos and\
(2) update the submodules within.\
(3) commit and push, which\
(4) initiates re-generation of github-pages."

COPY update-subtle-ads.sh /update-subtle-ads.sh
RUN chmod +x /update-subtle-ads.sh

# ensure git actions are attributed
RUN git config --global user.email "gs@gernotstarke.de"
RUN git config --global user.name "Dr. Gernot Starke (via Docker)"

# in case interactive sessions will be used, set decent prompt
RUN export PS1='$(whoami)@$(hostname):$(pwd)'

#CMD ["./update-subtle-ads.sh"]
CMD ["/bin/bash"]
