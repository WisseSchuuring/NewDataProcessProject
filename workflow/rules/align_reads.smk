rule align_reads:
    input:
        "preprocessed_dummy"
    output:
        "aligned_dummy"
    wrapper:
        "v2.2.1/bio/bowtie2/align"