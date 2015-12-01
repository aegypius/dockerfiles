#!/usr/bin/env python
import re
import sys
from getopt import getopt
from threading import Thread, Event
from time import sleep
from subprocess import check_output, call
from datetime import datetime


def log(msg, *args):
  s = msg
  if args is not None:
    s = msg.format(*args)
  print "[{}] UPDATER: {}".format(datetime.now().strftime("%d/%m/%y %H:%M:%S"), s)


class UpdaterThread(Thread):
  """Really naive updater for git based apps managed by supervisord"""
  def __init__(self, app, branch=None):
    super(UpdaterThread, self).__init__()
    self._update = Event()
    self._quit = Event()
    self.app = app
    self.branch = branch
    self.up_to_date = re.compile(r'up.to.date')

  def update(self):
    self._update.set()

  def stop(self):
    self._quit.set()

  def run(self):
    while not self._quit.is_set():
      self._update.wait()
      if self._quit.is_set():
        exit(0)

      if self.branch is not None:
        log("Checking out branch {} of {}", self.branch, self.app)
        log(check_output(["git", "checkout", self.branch]).rstrip('\r\n'))

      if self._quit.is_set():
        exit(0)
      log("Running git pull for {}", self.app)
      out = check_output(["git", "pull", "--progress"])

      if self._quit.is_set():
        exit(0)
      if self.up_to_date.search(out) is not None:
        log(out.rstrip('\r\n'))
        log("Restarting {}", self.app)
        call(["supervisorctl", "restart", self.app])
        log("Update and restart complete")
      else:
        log("Already up to date, nothing to do")

      self._update.clear()


def cleanup(thread):
  thread.stop()


def main(argv):
  app, branch, frequency = None, None, 3600
  opts, args = getopt(argv, "ha:b:f:", ["app=", "branch=", "frequency="])
  for opt, arg in opts:
    if opt == '-h':
      print("updater.py -a <app_name> [ -b <branch> ] [ -f <update_frequency_in_seconds> ]")
      sys.exit(2)
    elif opt in ('-a', '--app'):
      app = arg
    elif opt in ('-b', '--branch'):
      branch = arg
    elif opt in ('-f', '--frequency'):
      frequency = arg

  if app is None:
    print("Must specify an app to update!")
    print("updater.py -a <app_name> [ -b <branch> ] [ -f <update_frequency_in_seconds> ]")
    sys.exit(1)

  if branch is None:
    log("Updater started for {}", app)
  else:
    log("Updater started for {} on branch {}", app, branch)

  log("Will run an update check every {} seconds", frequency)

  updater = UpdaterThread(app, branch=branch)
  updater.start()

  try:
    while True:
      sleep(int(frequency))
      updater.update()
  except (KeyboardInterrupt, SystemExit):
    log("Caught interrupt, quitting")
    updater.stop()
    sys.exit()


if __name__ == "__main__":
  main(sys.argv[1:])
