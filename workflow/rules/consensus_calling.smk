rule call_consensus:
    input:
        "variant_called_dummy"
    output:
        "consensus_sequence"
    wrapper:
        "v2.2.1/bio/bcftools/call"