process VERIFYBAMID
{

  debug true
  publishDir params.outdir, mode:'copy'

  input:
    val vcf_file
    val bam_file
    val bam_bai
    val tool_path

  output:
    path "*_testoutput.txt"
  script:
    """
    echo $vcf_file
    echo $bam_file
    echo $bam_bai
    bash nextflow-bin/nextflow_code.sh $vcf_file $bam_file $bam_bai $tool_path
    """
}
