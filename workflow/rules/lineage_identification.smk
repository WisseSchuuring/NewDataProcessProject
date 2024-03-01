rule identify_lineage:
    input:
        "consensus_sequence"
    output:
        "dummy_file",
        "lineage_report"