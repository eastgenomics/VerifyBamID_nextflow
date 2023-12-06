#!/bin/bash

# The following line causes bash to exit at any point if there is any error
# and to output each line as it is executed -- useful for debugging
set -e -x -o pipefail

### for local testing remove need to download
echo "running script"

vcf_file=$(echo ${1} |sed -e "s/dx:\/\///")
input_bam=$(echo ${2} | sed -e "s/dx:\/\///")
input_bam_bai=$(echo ${3} | sed -e "s/dx:\/\///")
 # tool_path="$4"
pathToBin="nextflow-bin"

# get file names
vcf_file_name=$(dx describe ${vcf_file} --name)
input_bam_name=$(dx describe ${input_bam} --name)
bam_bai_name=$(dx describe ${input_bam_bai} --name)

# download files
dx download "$input_bam" -o "$input_bam_name"
dx download "$input_bam_bai" -o "$bam_bai_name"
dx download "$vcf_file" -o "$vcf_file_name"
# dx download "$tool_path" -o "verifyBamID"

# Create output directory
mkdir ./verifybamid_out

ls $pathToBin
# get verifybamID
# chmod -R ${pathToBin}/*

export VERIFYBAMID_BIN=${pathToBin}/verifyBamID

# Call verifyBamID for contamination check. The following notable options are passed:
# --ignoreRG; to check the contamination for the entire BAM rather than examining individual read groups
# --precise; calculate the likelihood in log-scale for high-depth data (recommended when --maxDepth is greater than 20)
# --maxDepth 1000; For the targeted exome sequencing, --maxDepth 1000 and --precise is recommended.
$VERIFYBAMID_BIN --vcf ${vcf_file_name} --bam ${input_bam_name} --bai ${input_bam_bai} --ignoreRG --precise --maxDepth 1000 --out ./verifybamid_out

echo "print current directory"
pwd
ls .
# move outputs to name of sample

# Upload results to DNAnexus
dx-upload-all-outputs