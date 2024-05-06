FROM ruby:3-slim
run apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    binutils \
    gcc \
    git \
    make \
    g++ \
    curl

# Setup environment
RUN mkdir -p /opt/env
ADD Gemfile /opt/env
ADD Gemfile.lock /opt/env
ADD requirements.txt /opt/env
WORKDIR /opt/env
RUN python3 -m pip install --break-system-packages -r requirements.txt
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
RUN bundle install

VOLUME ["/opt/site"]
WORKDIR /opt/site
