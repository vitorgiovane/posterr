FROM ruby:3.1.1

WORKDIR /atmosphere

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

ENV BUNDLE_PATH /box

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN chown -R user:user /box


COPY --chown=user:user . .
# RUN rake db:create RAILS_ENV=test

USER $USER_ID