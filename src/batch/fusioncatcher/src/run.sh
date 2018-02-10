#!/bin/bash


# Download the database files.  Move them to S3 first.  Then only download if not on the instance volume.  Once per instance.
# See if we can use a shared volume for stuff like this.
CMD /opt/fusioncatcher/v1.00/bin/download.sh
