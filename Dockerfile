# Use the official Ruby image as the base image
FROM ruby:3.2.2-bullseye

# Set the working directory
WORKDIR /med_api

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start the Rails server
# CMD ["./entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]