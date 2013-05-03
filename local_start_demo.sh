#!/bin/sh
## ---- BEGIN COPYRIGHT -------------------------------------------------------
##
## Copyright © 2012 Feuerlabs, Inc. All rights reserved.
##
## This Source Code Form is subject to the terms of the Mozilla Public
## License, v. 2.0. If a copy of the MPL was not distributed with this
## file, You can obtain one at http://mozilla.org/MPL/2.0/.
##
## ---- END COPYRIGHT ---------------------------------------------------------

# Boot script for the exodemo system.


##
export KVDB_BACKENDS=ets

# Make sure that these values match the device id and keys setup
# in the exosense server.
export exo_host=test.feuerlabs.com
export exo_device_id=[add device-id here]
export exo_account=[add account (not user) here]
export exo_server_key=[add server key here]
export exo_device_key=[add device key here]

erl -boot $PWD/setup/start -config $PWD/setup/sys
