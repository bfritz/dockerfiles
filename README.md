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

Build and run a collectd/riemann/influxdb stack:

    make run-cri

`run-cri` starts 4 containers:

* [InfluxDB](http://influxdb.com/) with Admin UI at <http://localhost:8083/>
* [Riemann](http://riemann.io/)
* [riemann-dash](http://riemann.io/dashboard.html) with UI at <http://localhost:4567/>
* [collectd](http://collectd.org/) sending metrics to Riemann via TCP

Time series data is stored in the InfluxDB `riemann` database with the
default credentials `root/root`.
