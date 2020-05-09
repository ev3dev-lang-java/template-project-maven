echo "#####################"
echo "# MAVEN EV3 SCRIPTS #"
echo "#####################"
echo

EV3_HOST=$1
EV3_USER=$2
EV3_PASSWORD=$3

ARTIFACT=$4

#echo $EV3_HOST
#echo $EV3_USER
#echo $EV3_PASSWORD
#echo $ARTIFACT

function deploy() {

    echo "Deploy artifact to EV3"
    echo "sshpass -p $EV3_PASSWORD scp -P 22 ./target/$ARTIFACT-jar-with-dependencies.jar $EV3_USER@$EV3_HOST:/home/robot/"
    sshpass -p $EV3_PASSWORD \
        scp -P 22 \
        ./target/$ARTIFACT-jar-with-dependencies.jar $EV3_USER@$EV3_HOST:/home/robot/
}

function run() {

    echo "Run artifact"
    echo "sshpass -p $EV3_PASSWORD ssh -p 22 $EV3_USER@$EV3_HOST java -jar $ARTIFACT-jar-with-dependencies.jar"
    sshpass -p $EV3_PASSWORD \
        ssh -p 22 \
        $EV3_USER@$EV3_HOST "java -jar $ARTIFACT-jar-with-dependencies.jar"
}

deploy
run
