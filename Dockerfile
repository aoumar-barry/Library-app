# syntax = docker/dockerfile:1

# Development Dockerfile for local development with Docker Compose

ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION-slim

# Install dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    git \
    libpq-dev \
    libvips \
    libyaml-dev \
    pkg-config \
    postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set working directory
WORKDIR /rails

# Install gems (will be run again via docker-compose command for live updates)
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start server (overridden by docker-compose)
CMD ["rails", "server", "-b", "0.0.0.0"]
