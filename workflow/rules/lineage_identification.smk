include: "consensus_calling.smk"

rule identify_lineage:
    input:
        consensus = "../data/output/consensus_sequence.fa"
    output:
        csv_file = "pangolin_lineage.csv"
    shell:
        "pangolin {input.consensus} -o ../data/finished --outfile {output.csv_file}"
