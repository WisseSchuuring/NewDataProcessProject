rule remove_primers:
    input:
        "BAMSAM_processed_dummy",
        "primers_file"
    output:
        "primers_removed_dummy"
