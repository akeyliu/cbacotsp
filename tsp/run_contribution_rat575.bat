
set FILE_OUTPUT=u574_contribution.csv

set TSPFILE= --tsplibfile u574.tsp
set OPTIMUM= --optimum 36905
set ROUND=101

REM Initialize the Log File.
del /q %FILE_OUTPUT%

REM Begin Run
FOR /L %%i IN (1,1,%ROUND%) do (
	acotsp  %TSPFILE% --rho 0.1 --q0 0.9 --time 86400. %OPTIMUM% --ants 50 --as -C 2 2>>%FILE_OUTPUT%
)
