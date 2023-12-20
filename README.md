# VerifyBamID_nextflow #

a repository for testing verifybamid with nextflow, to run on DNAnexus


### To build verifybamid_nextflow on DNAnexus
```
 git clone <repo>
 dx select <DNAnexus project>
 dx build --nextflow (inside the cloned folder)
 ```
### To run verifybamid_nextflow on DNAnexus
 ```
 dx run applet-XXXXX \
-inextflow_pipeline_params="--file_path=<dir/to/bam files>"
```
**example**
```
dx run applet-Gf1JB2j4F1BFx1b2y9gQKJg7  -inextflow_pipeline_params="--file_path=dx://project-GZgkB004F1B5G56VK7K1bvYZ:/input_data/test_inputs/"
```
