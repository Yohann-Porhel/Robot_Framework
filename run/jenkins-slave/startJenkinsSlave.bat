set ROBOT_HOME=C:\robot

set ROBOT_APP=%ROBOT_HOME%\app
set ROBOT_RUN=%ROBOT_HOME%\run
set ROBOT_DEPLOY=%ROBOT_HOME%\deploy

java -jar %ROBOT_APP%\Jenkins\agent.jar ^
     -jnlpUrl http://gate6639.enedis.fr:8180/jenkins/computer/EPW92XP1-YPORHEL/slave-agent.jnlp ^
     -secret 9aeb59edb50c3b1999bd41f55ed018e01267fefd033d25a12dcd596fdfa96253 ^
     -workDir "%ROBOT_RUN%\Jenkins-Slave"
