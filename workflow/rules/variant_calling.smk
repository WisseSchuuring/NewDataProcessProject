include: "indelqual_bamfile.smk"

rule call_variants:
    input:
        indel_bam = config["datadir"] + config["R1"] + config["R2"] + "_output.indel.bam",
        mref = config["datadir"] + config["R1"] + config["R2"] + "_masked.fasta"
    output:
        variants = config["datadir"] + config["R1"] + config["R2"] + "_vars.vcf.gz"
    shell:
        "lofreq call --call-indels -f {input.ref} -o {output.variants} {input.indel_bam}"
