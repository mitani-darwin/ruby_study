FROM ubuntu

RUN apt update && apt install -y libssl-dev libreadline-dev zlib1g-dev libyaml-dev
RUN apt install -y gcc g++ make git curl

USER ubuntu
WORKDIR /home/ubuntu

# rbenvのインストール
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# rbenvのプラグインをインストール
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# rbenvを使ってRubyをインストール
RUN /bin/bash -c "/home/ubuntu/.rbenv/bin/rbenv install 3.3.5 && /home/ubuntu/.rbenv/bin/rbenv global 3.3.5 && /home/ubuntu/.rbenv/bin/rbenv rehash"

RUN git clone https://github.com/mitani-darwin/ruby_study.git