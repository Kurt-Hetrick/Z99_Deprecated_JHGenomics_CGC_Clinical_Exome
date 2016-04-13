# ---qsub parameter settings---
# --these can be overrode at qsub invocation--

# tell sge to execute in bash
#$ -S /bin/bash


# tell sge to submit any of these queue when available
#$ -q rnd.q,prod.q,test.q

# tell sge that you are in the users current working directory
#$ -cwd

# tell sge to export the users environment variables
#$ -V

# tell sge to submit at this priority setting
#$ -p -10

# tell sge to output both stderr and stdout to the same file
#$ -j y

# export all variables, useful to find out what compute node the program was executed on
# redirecting stderr/stdout to file as a log.

set

JAVA_1_7=$1
GATK_DIR=$2
CORE_PATH=$3

PROJECT=$4
FAMILY=$5
REF_GENOME=$6

START_APPLY_RECALIBRATION_INDEL=`date '+%s'`

$JAVA_1_7/java -jar $GATK_DIR/GenomeAnalysisTK.jar \
-T ApplyRecalibration \
-R $REF_GENOME \
--disable_auto_index_creation_and_locking_when_reading_rods \
--input:VCF $CORE_PATH/$PROJECT/TEMP/$FAMILY".VQSR.SNP.vcf" \
--ts_filter_level 99.9 \
-recalFile $CORE_PATH/$PROJECT/$FAMILY/VCF/VQSR/$FAMILY".HC.INDEL.recal" \
-tranchesFile $CORE_PATH/$PROJECT/$FAMILY/VCF/VQSR/$FAMILY".HC.INDEL.tranches" \
-mode INDEL \
-o $CORE_PATH/$PROJECT/$FAMILY/VCF/VQSR/$FAMILY".VQSR.vcf"

END_APPLY_RECALIBRATION_INDEL=`date '+%s'`

HOSTNAME=`hostname`

echo $FAMILY"_"$PROJECT",K.001,APPLY_RECALIBRATION_SNP,"$HOSTNAME","$START_APPLY_RECALIBRATION_INDEL","$END_APPLY_RECALIBRATION_INDEL \
>> $CORE_PATH/$PROJECT/REPORTS/$PROJECT".WALL.CLOCK.TIMES.csv"

echo $JAVA_1_7/java -jar $GATK_DIR/GenomeAnalysisTK.jar \
-T ApplyRecalibration \
-R $REF_GENOME \
--disable_auto_index_creation_and_locking_when_reading_rods \
--input:VCF $CORE_PATH/$PROJECT/TEMP/$FAMILY".VQSR.SNP.vcf" \
--ts_filter_level 99.9 \
-recalFile $CORE_PATH/$PROJECT/$FAMILY/VCF/VQSR/$FAMILY".HC.INDEL.recal" \
-tranchesFile $CORE_PATH/$PROJECT/$FAMILY/VCF/VQSR/$FAMILY".HC.INDEL.tranches" \
-mode INDEL \
-o $CORE_PATH/$PROJECT/$FAMILY/VCF/VQSR/$FAMILY".VQSR.vcf"
>> $CORE_PATH/$PROJECT/$FAMILY/$FAMILY".COMMAND.LINES.txt"

echo >> $CORE_PATH/$PROJECT/$FAMILY/$FAMILY".COMMAND.LINES.txt"

md5sum $CORE_PATH/$PROJECT/VCF/VQSR/$FAMILY".VQSR.vcf" \
>> $CORE_PATH/$PROJECT/REPORTS/$PROJECT".CIDR.Analysis.MD5.txt"

md5sum $CORE_PATH/$PROJECT/VCF/VQSR/$FAMILY".VQSR.vcf.idx" \
>> $CORE_PATH/$PROJECT/REPORTS/$PROJECT".CIDR.Analysis.MD5.txt"
