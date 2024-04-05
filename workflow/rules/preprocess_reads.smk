rule preprocess_reads:
    input:
        R1 = "../data/fastq_files/S-Africa-variant-1_S123_L001_R1_001.fastq.gz",
        R2 = "../data/fastq_files/S-Africa-variant-1_S123_L001_R2_001.fastq.gz"
    output:
        out_R1 = "../data/output/preprocessed_R1.fq.gz",
        out_R2 = "../data/output/preprocessed_R2.fq.gz"
    message:
        "Preprocessing reads {input.R1} and {input.R2}..."
    shell:
        "fastp -i {input.R1} -I {input.R2} -o {output.out_R1} -O {output.out_R2}"
