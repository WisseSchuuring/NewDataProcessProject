rule call_variant:
    input:
        in_fasta = "reference_masked.fasta"
    output:
        varcalled = "variant_called_dummy.fasta"
    # wrapper:
    #     "v2.2.1/bio/lofreq/call"
    shell:
        "lofreq call-parallel --pp-threads $thread_num --call-indels -f $directory/"$label"_reference.fa -o $directory/"$label"_indel.vcf $directory/"$label"_indel.bam"
