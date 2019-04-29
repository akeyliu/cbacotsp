
set FILE_OUTPUT=gil262_contribution.csv

set TSPFILE= --tsplibfile gil262.tsp
set OPTIMUM= --optimum 2378 
set ROUND=101

REM Initialize the Log File.
del /q %FILE_OUTPUT%

REM Begin Run
FOR /L %%i IN (1,1,%ROUND%) do (
	acotsp  %TSPFILE% --rho 0.1 --q0 0.9 --time 86400. %OPTIMUM% --ants 50 --as -C 4 2>>%FILE_OUTPUT%
)
