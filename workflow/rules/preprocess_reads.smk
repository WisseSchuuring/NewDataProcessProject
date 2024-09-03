rule preprocess_reads:
    input:
        R1 = config["datadir"] + "fastq_files/" + config["R1"] + ".fastq.gz",
        R2 = config["datadir"] + "fastq_files/" + config["R2"] + ".fastq.gz"
    output:
        out_R1 = config["outputdir"] + "preprocess/" + config["R1"] + "_preprocessed.fq.gz",
        out_R2 = config["outputdir"] + "preprocess/" + config["R2"] + "_preprocessed.fq.gz"
    message:
        "Preprocessing reads {input.R1} and {input.R2}..."
    shell:
        "fastp -i {input.R1} -I {input.R2} -o {output.out_R1} -O {output.out_R2}"
