@ECHO OFF
BPC PATCHBP
IF NOT EXIST PATCHBP.EXE GOTO ABORT
COPY \BP\BIN\BPC.EXE BPCOS2.EXE
COPY \BP\BIN\BP.EXE  BPOS2.EXE
COPY \BP\BIN\BP.TP
COPY \BIN\TPW.TPL OS2RTL\SYS
COPY \BP\BIN\TURBO.TPL
PATCHBP BPCOS2.EXE C %1
PATCHBP BPOS2.EXE  I %1
IF NOT EXIST \BP\BIN\BP.RES GOTO DONE
COPY \BP\BIN\BP.RES  BP.RES
PATCHBP BP.RES   R %1
GOTO DONE
:ABORT
ECHO YOU MUST COMPILE PATCHBP.PAS BEFORE EXECUTING PATCH.BAT
:DONE