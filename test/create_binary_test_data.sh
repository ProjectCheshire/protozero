#!/bin/sh
#
#  create_binary_test_data.sh
#
#  Create the serialized test data in protobuf format using the testcase.proto
#  description and the testcase.cpp code.
#

set -e

for dir in t/*; do
    cd $dir
    protoc --cpp_out=. testcase.proto
    $CXX -std=c++11 -o testcase testcase.cpp testcase.pb.cc -lprotobuf-lite -pthreads
    ./testcase
    cd ../..
done

