nextflow.enable.dsl=2

// get params

params.vcf_file
params.bam_file
params.bam_bai

// build process


process VERIFYBAMID {
    input:
      path vcf
      path bam
      path bam_bai

    script:
    """
    echo $vcf
    echo $bam
    echo $bam_bai
    bash ${baseDir}/src/nextflow_code.sh $vcf $bam $bam_bai
    """


}

// run

workflow{

vcf_channel = channel.fromPath(params.vcf_file)
bam_channel = channel.fromPath(params.bam_file)
bam_bai_channel = channel.fromPath(params.bam_bai)
    VERIFYBAMID(vcf_channel, bam_channel, bam_bai_channel)
}
