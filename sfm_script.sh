#! /bin/bash
cd /opt/openSFM/OpenSfM/
./bin/run_all data/dataset
./bin/opensfm undistort path_to_data
./bin/opensfm compute_depthmaps path_to_data
./bin/opensfm export_openmvs path_to_data
