include: "variant_calling.smk"

rule call_consensus:
    input:
        masked_ref = rules.mask_lowCoverage_regions.output.masked_ref,
        variants = rules.call_variants.output.variants,
        variants_tbi = rules.call_variants.output.variant_tbi
    output:
        consensus = config["outputdir"] + "consensus/" + config["R1"] + config["R2"] + "_consensus_sequence.fa"
    message:
        "Creating consensus sequence..."
    shell:
        "bcftools consensus -f {input.masked_ref} {input.variants} -o {output.consensus}"
