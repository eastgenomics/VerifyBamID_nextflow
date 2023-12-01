nextflow.enable.dsl=2

params.vcf_file = ""
params.bam_file = ""
params.bam_bai = ""
params.outdir = "./verifybamid_output" //name of output folder

include { VERIFYBAMID } from './modules/VERFIYBAMID'
include { HELLOWORLD } from './modules/HELLOWORLD'

// run workflow

workflow{

  HELLOWORLD()
  VERIFYBAMID(params.vcf_file, params.bam_file, params.bam_bai)
}


// dx run applet-GbZyx5j4F1B4VQj45j6xp59j \
// -inextflow_pipeline_params="--vcf_file=dx://project-Fkb6Gkj433GVVvj73J7x8KbV:file-GFz0Y3Q41BZyz1j44xYvx2zP --bam_file=dx://project-GZgkB004F1B5G56VK7K1bvYZ:file-GZjXYvj4F1B3J1vf87p63bGp --bam_bai
// =dx://project-GZgkB004F1B5G56VK7K1bvYZ:file-GZjXYz04F1BB1YGZQ6fFv490 --tool_path=dx://"