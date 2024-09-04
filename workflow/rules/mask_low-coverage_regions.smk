include: "remove_primers.smk"

rule mask_lowCoverage_regions:
    input:
        bamfile = rules.remove_primers.output.out_bam,
        ref_fasta = config["reference"]
    output:
        masked_ref = config["outputdir"] + "masked_low_cov/" + config["R1"] + config["R2"] + "_masked.fasta",
        lowcovmask = config["outputdir"] + "masked_low_cov/" + config["R1"] + config["R2"] + "_lowcovmask.bed"
    message:
        "Masking low coverage regions..."
    shell:
        "bedtools genomecov -ibam {input.bamfile} -bga | "
        "bedtools merge -i - 1>{output.lowcovmask} | "
        "bedtools maskfasta -fi {input.ref_fasta} -bed {output.lowcovmask} -fo {output.masked_ref}"
