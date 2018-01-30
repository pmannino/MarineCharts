REM cd C:\Users\Dad\Documents\MarineCharts
REM robocopy "C:\Users\Dad\Documents\MarineCharts\ChartKit\BSBCHART" L:\BSBCHART /mir
REM robocopy "C:\Users\Dad\Documents\MarineCharts\ChartKit\ENC_ROOT" L:\ENC_ROOT /mir
REM robocopy "C:\Users\Dad\Documents\MarineCharts\ChartKit\TopoMaps" L:\TopoMaps /mir

REM xcopy "Q:\MaptechDrive\Srn\Routes.*" L:\Srn\*
REM xcopy "Q:\MaptechDrive\Srn\Tracks.*" L:\Srn\*
REM xcopy "Q:\MaptechDrive\Srn\Waypoints.*" L:\Srn\*
REM xcopy "Q:\MaptechDrive\Srn\Tracks" L:\Srn\Tracks\*

xcopy "C:\Srn\Routes.*" D:\Srn\* /Y
xcopy "C:\Srn\Waypoints.*" D:\Srn\* /Y
xcopy "C:\Srn\*.log" D:\Srn\* /Y
xcopy "C:\Srn\Tracks" D:\Srn\Tracks\* /E/Y
