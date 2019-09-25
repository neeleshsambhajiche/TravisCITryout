#!/bin/bash -e

# Print the complete execution command for this scripts
myInvocation="$(printf %q "$BASH_SOURCE")$((($#)) && printf ' %q' "$@")"
echo "** Executing: $myInvocation"
echo ""

# Set up the classpath
testJar=$1
alljars="/Travis/scalatest_2.11-3.0.5.jar:/Travis/scalactic_2.11-3.0.5.jar"

echo "** Starting all tests"
testList=(\
  HelloWorldTest \
  ByeWorldTest \
)
error=false
for testClass in "${testList[@]}"
do
  scala -J-Xmx2g -cp "$alljars" org.scalatest.tools.Runner -o -R /Travis/"$testJar" -s $testClass || error=true
done

#Fail the build if there was an error
if [ $error == true ]
then
    exit -1
fi