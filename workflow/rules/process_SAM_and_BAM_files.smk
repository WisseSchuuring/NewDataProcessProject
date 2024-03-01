rule process_BAM_and_SAM_files:
    input:
        "aligned_dummy"
    output:
        "BAMSAM_processed_dummy"
    wrapper:
        "samtools"