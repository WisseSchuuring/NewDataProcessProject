rule process_BAM_and_SAM_files:
    input:
        in_read = "aligned_reads.sam"
    output:
        out_sorted = "processed_reads_sorted.bam",
        out_fixmate = "processed_reads_fixmate.bam"
    message:
        "Processing aligned file(s)..."
    shell:
        "samtools sort -n -O bam -o {output.out_read}.bam {input.in_read} |"
        
        "samtools fixmate -m {output.out_read} {output.out_fixmate} | "
        
        "samtools sort -O bam -o {output.out_sorted} -T "
        "{input.in_read}_temp.txt {output.out_fixmate}"
