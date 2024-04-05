include: "variant_calling.smk"

rule call_consensus:
    input:
        ref = config["datadir"] + config["R1"] + config["R2"] + "_masked.fasta",
        variants = config["datadir"] + config["R1"] + config["R2"] + "_vars.vcf.gz"
    output:
        consensus = config["datadir"] + config["R1"] + config["R2"] + "_consensus_sequence.fa"
    shell:
        "bcftools consensus -f {input.ref} {input.variants} -o {output.consensus}"
