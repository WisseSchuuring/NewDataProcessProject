include: "mask_low-coverage_regions.smk"

rule lofreq_dindel_indelqual:
    input:
        bamfile = rules.remove_primers.output.out_bam,
        ref = rules.mask_lowCoverage_regions.output.masked_ref
    output:
        indel_bam = config["outputdir"] + "indelqual/" + config["R1"] + config["R2"] + "_output.indel.bam"
    message:
        "Checking quality of insertions and deletions..."
    shell:
        "lofreq indelqual {input.bamfile} --dindel -f {input.ref} -o {output.indel_bam}"

