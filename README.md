## Brad's random Dockerfiles.

Use at your own risk. May eat your pets or small children.

### Examples ###

Build container for Android development with Android Studio and
connect to it with Xpra:

    make android-dev
    ./android-dev/run.sh

    xpra attach ssh/dev@localhost:$PORT/100  # per output of run.sh above
