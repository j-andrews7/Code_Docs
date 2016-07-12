#!/bin/sh

# give the job a name to help keep track of running jobs (optional)
#PBS -N COMBINE_VCFs
#PBS -m e
#PBS -l nodes=1:ppn=1,walltime=24:00:00,vmem=16gb

samp = FL120

module load java
java -Xmx1g -jar /scratch/jandrews/bin/GenomeAnalysisTK-3.5/GenomeAnalysisTK.jar \
	-T CombineVariants \
	-R /scratch/jandrews/Ref/hg19.fa \
	--variant:bcftools /scratch/jandrews/Data/Variant_Calling/Coding_Noncoding_Merged/scratch/"$samp"_RNAseq_BCF.sorted.vcf  \
	--variant:varscan /scratch/jandrews/Data/Variant_Calling/Coding_Noncoding_Merged/scratch/"$samp"_RNAseq_VS.sorted.vcf \
	--variant:chip_seq /scratch/jandrews/Data/Variant_Calling/Coding_Noncoding_Merged/scratch/"$samp"_variants_filtered_multimark.sorted.vcf \
	-o /scratch/jandrews/Data/Variant_Calling/Coding_Noncoding_Merged/scratch/"$samp"_Combined.vcf \
	-genotypeMergeOptions UNIQUIFY 

module remove java
	

