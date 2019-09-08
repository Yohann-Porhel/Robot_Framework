set ROBOT_HOME=C:\Users\yodur\OneDrive\Documents\GitHub\Robot_Framework

set ROBOT_DEPLOY=%ROBOT_HOME%\deploy
set WORKSPACE=%ROBOT_HOME%\run\workspace
set ROBOT_APP=%ROBOT_HOME%\app
set ROBOT_RUN=%ROBOT_HOME%\run

set MY_TAAP_BASE_URL_SETTINGS=%WORKSPACE%\taapBaseUrlSettings.robot
set MY_TAAP_DEVICE_SETTINGS=%WORKSPACE%\taapDeviceSettings.robot
set MY_DEVICE=PC
set MY_BROWSER=firefox

py -m robot C:\Users\yodur\OneDrive\Documents\GitHub\Robot_Framework\deploy\SNCF\suites\reserverUnBilletDeTrain.robot

