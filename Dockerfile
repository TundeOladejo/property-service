FROM ruby:latest


# Set the working directory
WORKDIR /app

COPY . /app

# Install dependencies
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the port your Rails app runs on
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
