## Brad's random Dockerfiles.

Use at your own risk. May eat your pets or small children.

### Examples ###

Build container for Android development with Android Studio and
connect to it with Xpra:

    make android-dev
    ./android-dev/run.sh

    xpra attach ssh/dev@localhost:$PORT/100  # per output of run.sh above

Backport collectd 5.4.1 to Debian Wheezy and dump packages into
`collectd_debs.tar.gz`:

    make wheezy-collectd
