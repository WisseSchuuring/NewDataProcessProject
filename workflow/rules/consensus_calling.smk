include: "variant_calling.smk"

rule call_consensus:
    input:
        masked_ref = rules.mask_lowCoverage_regions.output.masked_ref,
        variants = rules.call_variants.output.variants
    output:
        consensus = config["outputdir"] + "consensus/" + config["R1"] + config["R2"] + "_consensus_sequence.fa"
    shell:
        "bcftools consensus -f {input.masked_ref} {input.variants} -o {output.consensus}"
