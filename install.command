#!/bin/bash

BASEDIR=$(dirname "$0");

cd $BASEDIR; cd mathflow.app/Contents/MacOS/src;

command -v wolframscript>/dev/null 2>&1 || open WolframScript.pkg;

make;

make clean;

rm ../mathbox;
mv mathbox ../mathbox;

cd $BASEDIR; mv mathflow.app /Applications;