
# Create a new AMI using the latest ECS AMI
# https://aws.amazon.com/blogs/compute/building-high-throughput-genomic-batch-workflows-on-aws-batch-layer-part-3-of-4/

sudo su -

yum -y update
mkfs -t ext4 /dev/xvdb
mkdir /docker_scratch
echo -e '/dev/xvdb\t/docker_scratch\text4\tdefaults,nofail\t0\t0' | tee -a /etc/fstab
mount -a
stop ecs
rm -rf /var/lib/ecs/data/ecs_agent_data.json



# Fusioncatcher database.
yum -y install wget

# Create bash script with the commands below called 'install-fusioncatcher-db.sh'.
# Run using "nohup ./install-fusioncatcher-db.sh >outfile.txt &"

#!/bin/bash

mkdir -p /docker_scratch/fusioncatcher/v1.00/data
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v90.tar.gz.aa -O /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz.aa
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v90.tar.gz.ab -O /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz.ab
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v90.tar.gz.ac -O /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz.ac
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v90.tar.gz.ad -O /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz.ad
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/checksums.md5 -O /docker_scratch/fusioncatcher/v1.00/data/checksums.md5
cd /docker_scratch/fusioncatcher/v1.00/data
md5sum -c /docker_scratch/fusioncatcher/v1.00/data/checksums.md5
if [ "$?" -ne "0" ]; then
    echo -e "\n\n\n\033[33;7m ERROR: The downloaded files from above have errors! MD5 checksums do not match! Please, download them again or re-run this script again! \033[0m\n"
    exit 1
fi
cat /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz.* > /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz
rm -f /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz.*
if ! tar -xzf /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz -C /docker_scratch/fusioncatcher/v1.00/data; then
    echo -e "\n\n\n\033[33;7m ERROR: The downloaded files are corrupted! \033[0m\n"
    exit 1
fi
rm -f /docker_scratch/fusioncatcher/v1.00/data/human_v90.tar.gz
rm -f /docker_scratch/fusioncatcher/v1.00/data/checksums.md5
