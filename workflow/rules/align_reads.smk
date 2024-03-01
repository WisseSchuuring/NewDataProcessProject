rule align_reads:
    input:
        in_R1 = "preprocessed_R1.fq.gz",
        in_R2 = "preprocessed_R2.fq.gz"
    output:
        "aligned_reads.sam"
    shell:
        "bowtie2 -p 2 -x reference.fa -1 {input.in_R1} -2 {input.in_R2} aligned_reads.sam"