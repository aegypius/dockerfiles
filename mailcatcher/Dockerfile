FROM ruby:2

# Install Mailcatcher
RUN gem install mailcatcher --no-ri --no-rdoc

EXPOSE 1025
EXPOSE 1080

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
