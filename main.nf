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



// run with dx run applet-GbQzgG04F1BBg569237JJx0z \
// -inextflow_pipeline_params="--vcf_file=dx://project-Fkb6Gkj433GVVvj73J7x8KbV:file-GFz0Y3Q41BZyz1j44xYvx2zP --bam_file ./input_data/mapt.NA12156.altex.bam --bam_bai ./input_data/mapt.NA12156.altex.bam.csi"