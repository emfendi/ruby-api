# 1. ubuntu 설치 (패키지 업데이트)
FROM ubuntu:20.04
RUN apt-get -y update

# 2. node 설치
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN npm install -g n
RUN npm install yarn

# 3. ruby 설치
RUN apt-get -y install ruby-full
RUN gem update --system
RUN gem install bundler
# install Rails
RUN gem install rails

# 4. 소스 복사, Gem 패키지 설치 (실행 디렉토리 설정)
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN apt-get install -y libsqlite3-dev
RUN bundle install

COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
