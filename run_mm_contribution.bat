set FILE_OUTPUT="runtest_mm_contribution.csv"

set TSPFILE= --tsplibfile lin318.tsp 
set OPTIMUM= --optimum 42029 
set ROUND=101

REM Initialize the Log File.
del /q %FILE_OUTPUT%

REM Begin Run
FOR /L %%i IN (1,1,%ROUND%) do (
	FOR %%j IN (0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1) do (
		acotsp %TSPFILE% --rho 0.1 --q0 0.95 --time 86400. %OPTIMUM% --ants 50 --mmas -C %%j 2>>%FILE_OUTPUT%
	)
)
