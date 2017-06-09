#! /bin/bash
# ===== PBS OPTIONS =====
### Set the job name
#PBS -N "JobSFM"
### Run in the queue named "copperhead"
#PBS -q copperhead
### Specify the number of cpus for your job.
#PBS -l nodes=1:ppn=8:gpus=1
#PBS -l mem=64GB
#PBS -l walltime=24:00:00
# ==== Main ======
module load intel openmpi
module load cuda
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/users/sagarw10/opt/CGAL-4.9/lib

/users/sagarw10/opt/openMVS/openMVS_build/bin/DensifyPointCloud /users/sagarw10/opt/openSFM/OpenSfM/data/dataset1_gdrive/openmvs/scene.mvs
