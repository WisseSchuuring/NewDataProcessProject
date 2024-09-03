include: "indelqual_bamfile.smk"

rule call_variants:
    input:
        indel_bam = rules.lofreq_dindel_indelqual.output.indel_bam,
        ref = rules.mask_lowCoverage_regions.output.masked_ref
    output:
        variants = config["outputdir"] + "variants/" + config["R1"] + config["R2"] + "_vars.vcf.gz"
    shell:
        "lofreq call --call-indels -f {input.ref} -o {output.variants} {input.indel_bam}"
