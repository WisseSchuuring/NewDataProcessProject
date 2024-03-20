rule align_reads:
    input:
        in_R1 = "preprocessed_R1.fq.gz",
        in_R2 = "preprocessed_R2.fq.gz",
        ref_fasta = "reference.fa"
    output:
        "aligned_reads.sam"
    message:
        "Aligning reads {input.in_R1} and {input.in_R2}..."
    shell:
        "bowtie2 -p 2 -x {input.ref_fasta} -1 {input.in_R1} -2 {input.in_R2} aligned_reads.sam"