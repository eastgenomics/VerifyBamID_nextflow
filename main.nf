nextflow.enable.dsl=2


include { VERIFYBAMID } from './modules/VERFIYBAMID'

// run workflow

workflow{
  // create bam and bam bam.bai file pairs channel
  read_pairs_ch = channel.fromFilePairs(params.bam_files)
  VERIFYBAMID(read_pairs_ch, params.vcf_file)
}

