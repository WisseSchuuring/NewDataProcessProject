rule mask_lowCoverage_regions:
    input:
        bamfile = "primers_removed_bamfile_ivar",
        ref_fasta = "reference.fa"
    output:
        masked_ref = "reference_masked.fasta"
    shell:
        "bedtools genomecov -ibam {input.bamfile}.bam -bga | "
        "bedtools merge -i - 1>{input.bamfile}_lowcovmask.bed"
        
        "bedtools maskfasta -fi {input.ref_fasta} -bed {input.bamfile}_lowcovmask.bed -fo {output.masked_ref}"