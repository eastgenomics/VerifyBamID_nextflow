process VERIFYBAMID
{

  debug true
  publishDir params.outdir, mode:'copy'

  input:
    file vcf_file
    file bam_file
    file bam_bai

  output:
    path "*_testoutput.txt"
  script:
    """
    echo $vcf_file
    echo $bam_file
    echo $bam_bai
    bash nextflow-bin/nextflow_code.sh $vcf_file $bam_file $bam_bai
    """
}
