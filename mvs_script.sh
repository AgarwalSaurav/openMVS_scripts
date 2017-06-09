#! /bin/bash
# ===== PBS OPTIONS =====
### Set the job name
#PBS -N "JobSFM"
### Run in the queue named "copperhead"
#PBS -q copperhead
### Specify the number of cpus for your job.
#PBS -l nodes=1:ppn=16:gpus=1
#PBS -l mem=64GB
#PBS -l walltime=24:00:00
# ==== Main ======
module load intel openmpi
module load cuda
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/users/sagarw10/opt/CGAL-4.9/lib

MVS_DIR="/users/sagarw10/opt/openMVS_updated/openmvs_build/bin"
DATA_DIR="/users/sagarw10/opt/openSFM/OpenSfM/data/dataset1_gdrive/openmvs"

$MVS_DIR/DensifyPointCloud $DATA_DIR/scene.mvs

$MVS_DIR/ReconstructMesh $DATA_DIR/scene_dense.mvs

$MVS_DIR/RefineMesh $DATA_DIR/scene_dense_mesh.mvs

$MVS_DIR/TextureMesh $DATA_DIR/scene_dense_mesh_refine.mvs
