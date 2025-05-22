#!/bin/bash
# Update & install basic packages
yum update -y
yum install -y java-1.8.0-openjdk git httpd

# Start and enable Apache2
systemctl start httpd
systemctl enable httpd

# Jenkins installation
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y jenkins
systemctl start jenkins
systemctl enable jenkins

# MongoDB installation
cat <<EOF > /etc/yum.repos.d/mongodb-org-6.0.repo
[mongodb-org-6.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/6.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
EOF

yum install -y mongodb-org
systemctl start mongod
systemctl enable mongod