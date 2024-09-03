include: "consensus_calling.smk"

rule identify_lineage:
    input:
        consensus = rules.call_consensus.output.consensus
    output:
        csv_file = config["outputdir"] + "pangolin/lineage_report.csv"
    conda:
        "../envs/pangolin.yml"
    shell:
        "pangolin {input.consensus} --outfile {output.csv_file}"
