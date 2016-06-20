# ---qsub parameter settings---
# --these can be overrode at qsub invocation--

# tell sge to execute in bash
#$ -S /bin/bash


# tell sge to submit any of these queue when available
#$ -q prod.q,rnd.q,test.q

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

START_VARIANT_TO_TABLE_FAMILY=`date '+%s'`

# not doing --splitMultiallelic here...maybe do one as an example and discuss with Molly
# do an example of molten output to look at/show molly

( cat $CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.1.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.2.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.3.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.4.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.5.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.6.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.7.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.8.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.9.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.10.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.11.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.12.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.13.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.14.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.15.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.16.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.17.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.18.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.19.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.20.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.21.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.22.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.X.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.Y.txt \
| grep "^CHROM" ; \
cat $CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.1.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.2.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.3.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.4.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.5.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.6.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.7.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.8.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.9.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.10.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.11.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.12.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.13.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.14.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.15.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.16.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.17.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.18.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.19.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.20.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.21.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.22.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.X.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.Y.txt \
| grep -v "^CHROM" ) \
>| $CORE_PATH/$PROJECT/TEMP/$FAMILY".VQSR.ANNOTATED.JUST_FAMILY.txt"

END_VARIANT_TO_TABLE_FAMILY=`date '+%s'`

HOSTNAME=`hostname`

echo $FAMILY"_"$PROJECT",T.01,GATHER_VARIANT_TO_TABLE_"$FAMILY"_ALL_SITES,"$HOSTNAME","$START_VARIANT_TO_TABLE_FAMILY","$END_VARIANT_TO_TABLE_FAMILY \
>> $CORE_PATH/$PROJECT/REPORTS/$PROJECT".WALL.CLOCK.TIMES.csv"

echo ( cat $CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.1.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.2.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.3.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.4.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.5.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.6.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.7.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.8.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.9.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.10.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.11.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.12.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.13.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.14.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.15.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.16.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.17.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.18.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.19.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.20.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.21.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.22.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.X.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.Y.txt \
\| grep "^CHROM" ; \
cat $CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.1.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.2.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.3.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.4.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.5.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.6.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.7.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.8.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.9.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.10.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.11.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.12.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.13.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.14.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.15.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.16.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.17.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.18.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.19.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.20.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.21.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.22.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.X.txt \
$CORE_PATH/$PROJECT/TEMP/$FAMILY.VQSR.ANNOTATED.JUST_FAMILY.Y.txt \
\| grep -v "^CHROM" ) \
\>\| $CORE_PATH/$PROJECT/TEMP/$FAMILY".VQSR.ANNOTATED.JUST_FAMILY.txt" \
>> $CORE_PATH/$PROJECT/$FAMILY/$FAMILY".COMMAND.LINES.txt"

echo >> $CORE_PATH/$PROJECT/$FAMILY/$FAMILY".COMMAND.LINES.txt"