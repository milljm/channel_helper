#!/bin/bash
set -eu

mkdir -p $SP_DIR/channel_helper
cp -R channel_helper.py $SP_DIR/channel_helper
chmod 755 $SP_DIR/channel_helper/channel_helper.py

cat > $SP_DIR/channel_helper/__init__.py <<EOF
from . import channel_helper
EOF

cat > $SP_DIR/channelhelper-$PKG_VERSION.egg-info <<FAKE_EGG
Metadata-Version: 2.1
Name: Channel Helper
Version: $PKG_VERSION
Summary: A simple tool which spits back information about packages contained in Conda channels.
Platform: UNKNOWN
FAKE_EGG

ln -s $SP_DIR/channel_helper/channel_helper.py $PREFIX/bin/channel_helper
