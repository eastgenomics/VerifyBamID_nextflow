nextflow.enable.dsl=2


include { VERIFYBAMID } from './modules/VERFIYBAMID'

// run workflow
// TO DO: make file pair channel for bam, bai
      // so files for same sample processed together

workflow{
  // create bam and bam bam.bai file pairs channel
  read_pairs_ch = channel.fromFilePairs(params.bam_files)
  VERIFYBAMID(read_pairs_ch, params.vcf_file)
}

// current run command example
// dx run applet-Gbj8GV84F1B0Yk8PXgQj00xf -inextflow_pipeline_params="--vcf_file=dx://project-Fkb6Gkj433GVVvj73J7x8KbV:file-GFz0Y3Q41BZyz1j44xYvx2zP
// --bam_file=dx://project-GZgkB004F1B5G56VK7K1bvYZ:file-GZjXYvj4F1B3J1vf87p63bGp --bam_bai=dx://project-GZgkB004F1B5G56VK7K1bvYZ:file-GZjXYz04F1BB1YGZQ6fFv490"