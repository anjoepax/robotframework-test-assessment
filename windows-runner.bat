set parentDir=%cd%
robot --outputdir Results Tests\TestAssessment.robot
start Results\log.html
pause