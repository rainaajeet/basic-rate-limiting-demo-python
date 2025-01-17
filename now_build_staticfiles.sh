# now_build_staticfiles.sh

# Install Python 3.6 since it is missing in the Now build environment
yum install -y https://centos6.iuscommunity.org/ius-release.rpm
yum install -y python36u

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.6 get-pip.py

python3 -m pip install --upgrade pip
python -m pip install django
python3 -m venv venv
source ./venv/bin/activate
pip3 install -r requirements.txt
python3 manage.py collectstatic
python3 manage.py runserver

# Install project requirements
pip3 install -r google-cloud-run/requirements.txt

# Build staticfiles
python3.6 server/manage.py collectstatic
