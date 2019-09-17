#!/bin/bash -e

# Print the complete execution command for this scripts
myInvocation="$(printf %q "$BASH_SOURCE")$((($#)) && printf ' %q' "$@")"
echo "** Executing: $myInvocation"
echo ""

# Set up the classpath
testJar=$1
alljars="/Travis/scalatest_2.11-3.0.5.jar:/Travis/scalactic_2.11-3.0.5.jar"


echo "** Starting all tests"
echo "scala -J-Xmx2g -cp $alljars org.scalatest.tools.Runner -o -R /Travis/$testJar -s HelloWorldTest"
scala -J-Xmx2g -cp "$alljars" org.scalatest.tools.Runner -o -R /Travis/"$testJar" -s HelloWorldTest
