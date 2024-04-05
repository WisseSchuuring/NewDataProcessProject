include: "remove_primers.smk"

rule mask_lowCoverage_regions:
    input:
        bamfile = "../data/output/primers_removed_bamfile_ivar.bam",
        ref_fasta = "../data/reference.fa"
    output:
        masked_ref = "../data/output/reference_masked.fasta"
    shell:
        "bedtools genomecov -ibam {input.bamfile} -bga | "
        "bedtools merge -i - 1>{input.bamfile}_lowcovmask.bed | "
        "bedtools maskfasta -fi {input.ref_fasta} -bed {input.bamfile}_lowcovmask.bed -fo {output.masked_ref}"