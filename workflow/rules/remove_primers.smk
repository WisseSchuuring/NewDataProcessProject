include: "process_SAM_and_BAM_files.smk"

rule remove_primers:
    input:
        in_bam = "../data/output/processed_reads_sorted_fixmate.bam",
        primers = "../data/primers.bed"
    output:
        out_bam = "../data/output/primers_removed_bamfile_ivar.bam"
    shell:
        "ivar trim -i {input.in_bam} -b {input.primers} -p {output.out_bam}"
