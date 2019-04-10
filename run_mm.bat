set FILE_OUTPUT="runtest_mm.csv"

set TSPFILE= --tsplibfile lin318.tsp 
set OPTIMUM= --optimum 42029 
set ROUND=101

REM Initialize the Log File.
del /q %FILE_OUTPUT%

REM Begin Run
FOR /L %%i IN (1,1,%ROUND%) do (
	acotsp %TSPFILE% --rho 0.1 --q0 0.95 --time 86400. %OPTIMUM% --ants 50 --mmas 2>>%FILE_OUTPUT%
)
