#!/bin/bash
set -e

exec  $GERRIT_SITE/bin/gerrit.sh ${GERRIT_START_ACTION:-daemon}


