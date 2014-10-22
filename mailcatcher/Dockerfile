FROM ruby:2

# Install Mailcatcher
RUN gem install mailcatcher --no-ri --no-rdoc

# Workaround for i18n beta version crashing
# see: https://github.com/sj26/mailcatcher/issues/164
RUN gem uninstall i18n -Ix --version '>0.6.11'
RUN gem install i18n -v 0.6.11 --no-ri --no-rdoc

EXPOSE 1025
EXPOSE 1080

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
