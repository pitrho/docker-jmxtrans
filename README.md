# docker jmxtrans
configuration can be passed overriding cmd or env variables,

## Building the image

Clone the repository

        git clone https://github.com/pitrho/docker-jmxtrans.git
        cd docker-cassandra
        ./build.sh

De default tag for the new image is pitrho/jmxtrans. If you want to specify a
different tag, pass the -t flag along with the tag name:

    ./build.sh -t new/tag

Be default, the image installs version 256. If you want to install
a different version, pass the -v flag along with the version name:

    ./build.sh -v 254

## Environment variables


## available ENV vars for configuration ( see source of runjmxtrans.sh for details):


- FILENAME: JSON file that contains the query configuration for jmxtrans.
Defaults to `empty`.
- JSON_DIR: The location of where to store the JSON files. You can mount a
directory into the container at this location to include any files. Defaults to
`/var/lib/jmxtrans`.
- LOG_DIR: Defaults to `/var/log/jmxtrans`.
- LOG_FILE: Defaults to `/var/log/jmxtrans/jmxtrans.log`.
- SECONDS_BETWEEN_RUNS: Defaults to `60`.
- JAVA_OPTS: Defaults to `-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true`.
- HEAP_SIZE: Defaults to `512`.  
- PERM_SIZE: Defaults to `384`.
- MAX_PERM_SIZE: Defaults to `384`.
- JMX_PORT: Defaults to `empty`. You must always specify this parameter.  
- LOG_LEVEL: Defaults to `info`.
- CONTINUE_ON_ERROR: Defaults to `false`.


## License
See the license file.

## Contributors

* [Alejadnro Mesa](https://github.com/alejom99)
