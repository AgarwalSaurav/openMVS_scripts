#! /bin/bash
export SFM_DIR="/opt/openSFM/OpenSfM"
export DATASET_DIR="$SFM_DIR/data/dataset1_gdrive"
cd $SFM_DIR
./bin/run_all $DATASET_DIR
./bin/opensfm undistort $DATASET_DIR
./bin/opensfm compute_depthmaps $DATASET_DIR
./bin/opensfm export_openmvs $DATASET_DIR
