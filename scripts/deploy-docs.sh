#!/usr/bin/env bash

if [ $TRAVIS_BRANCH != "^(v[0-9].[0-9]+)" ]; then
    echo "This branch is not allowed; deployment skipped."
    exit
else
    exec publish-container-docs-to-prod containers $TRAVIS_BRANCH
fi
