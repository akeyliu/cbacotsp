
set FILE_OUTPUT=rat575_mm_contribution_para_4.csv

set TSPFILE= --tsplibfile rat575.tsp
set OPTIMUM= --optimum 6773
set ROUND=21

REM Initialize the Log File.
del /q %FILE_OUTPUT%

REM Begin Run
FOR /L %%i IN (1,1,%ROUND%) do (
	FOR %%j IN (0 1 2 3 4 5 6 7 8 9 10) do (
		acotsp  %TSPFILE% --rho 0.1 --q0 0.9 --time 86400. %OPTIMUM% --ants 50 -C %%j 2>>%FILE_OUTPUT%
	)
)
