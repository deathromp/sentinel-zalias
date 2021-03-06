# Zalias Sentinel
I got seriously sick of MN in WATCHDOG_EXPIRED status, what you get is mostly copypasta from racecrypto/sentinel, but it seems to work well enough.

If you're happy with this, feel free to donate: ZEJmjuBSSe65jF2JPdV5Vf6QjiSRxVy1RJ

## About 
An all-powerful toolset & watchdog daemon for Zalias.

Sentinel is an autonomous agent for persisting, processing and automating Zalias V12.1 governance objects and tasks, and for expanded functions in the upcoming Zalias releases.

Sentinel is implemented as a Python application that binds to a local version 12.1 zaliasd instance on each Zalias Masternode.

This guide covers installing Sentinel onto an existing 12.1 Masternode in Ubuntu 14.04 / 16.04.

## Installation

### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install virtualenv

### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/deathromp/sentinel-zalias.git && cd sentinel-zalias
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/home/YOURUSERNAME/sentinel' to the path where you cloned sentinel to:

    * * * * * cd /home/YOURUSERNAME/.zaliascore/sentinel-zalias && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1


## Configuration

An alternative (non-default) path to the `zalias.conf` file can be specified in `sentinel.conf`:

    zalias_conf=/path/to/zalias.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py

### License

Released under the MIT license, under the same terms as Zalias itself. See [LICENSE](LICENSE) for more info.
