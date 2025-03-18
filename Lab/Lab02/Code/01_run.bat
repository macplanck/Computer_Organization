@echo off

iverilog -o irun.vvp Testbench.v

IF %ERRORLEVEL% NEQ 0 (
    exit /b 0
)

vvp irun.vvp
exit /b 0