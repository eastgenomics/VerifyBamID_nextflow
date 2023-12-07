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
// dx run applet-Gbjp6p84F1B1VkP35y8Bg20B \
//-inextflow_pipeline_params="--file_path=dx://project-GZgkB004F1B5G56VK7K1bvYZ:/input_data/1701389_S77_L007_markdup"