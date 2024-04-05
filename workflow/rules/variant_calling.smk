include: "indelqual_bamfile.smk"

rule call_variants:
    input:
        indel_bam = "../data/output.indel.bam",
        ref= "../data/output/reference_masked.fasta"
    output:
        variants = "../data/output/vars.vcf.gz"
    shell:
        "lofreq call --call-indels -f {input.ref} -o {output.variants} {input.indel_bam}"
