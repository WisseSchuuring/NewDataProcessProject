include: "align_reads.smk"

rule sort_BAM_and_SAM_files:
    input:
        in_read = "../data/output/aligned_reads.sam"
    output:
        out_sorted = "../data/output/processed_reads_sorted.bam"
    message:
        "sorting aligned file(s)..."
    shell:
        "samtools sort -n -O bam -o {output.out_sorted} {input.in_read}"

rule fixmate_files:
    input:
        out_sorted = "../data/output/processed_reads_sorted.bam"
    output:
        out_fixmate = "../data/output/processed_reads_sorted_fixmate.bam"
    message:
        "utilising fixmate..."
    shell:
        "samtools fixmate -m {input.out_sorted} {output.out_fixmate}"

