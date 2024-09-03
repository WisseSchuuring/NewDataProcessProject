include: "remove_primers.smk"

rule mask_lowCoverage_regions:
    input:
        bamfile = rules.remove_primers.output.out_bam,
        ref_fasta = config["reference"]
    output:
        masked_ref = config["outputdir"] + "masked_low_cov/" + config["R1"] + config["R2"] + "_masked.fasta"
    shell:
        "bedtools genomecov -ibam {input.bamfile} -bga | "
        "bedtools merge -i - 1>{input.bamfile}_lowcovmask.bed | "
        "bedtools maskfasta -fi {input.ref_fasta} -bed {input.bamfile}_lowcovmask.bed -fo {output.masked_ref}"