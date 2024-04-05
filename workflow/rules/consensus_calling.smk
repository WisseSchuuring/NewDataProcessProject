include: "variant_calling.smk"

rule call_consensus:
    input:
        ref = "../data/output/reference_masked.fasta",
        variants = "../data/output/vars.vcf.gz"
    output:
        consensus = "../data/output/consensus_sequence.fa"
    shell:
        " bcftools consensus -f {input.ref} {input.variants} -o {output.consensus}"
