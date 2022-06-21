FROM ruby:3.0.0

COPY . /app
RUN cd /app \
  bundle install
ENV PATH /usr/bin:$PATH
ENTRYPOINT ["ruby", "app/cli.rb"]