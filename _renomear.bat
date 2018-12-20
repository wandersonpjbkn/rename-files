@echo off
color 1f

:MAIN
echo =============================================================================
echo ========================== Renomeador de Arquivos  ==========================
echo =============================================================================
echo ==                                                                         ==
echo ==                                                                         ==
echo ==              A acao que voce esta prestes a executar, ira               ==
echo ==              alterar o nome de todos os arquivos na pasta               ==
echo ==                                                                         ==
echo ==                       Prossiga com cuidado!                             ==
echo ==                                                                         ==
echo =============================================================================
echo. 
echo.
pause
GOTO COLETA


:COLETA
cls
echo =============================================================================
echo ========================== Renomeador de Arquivos  ==========================
echo =============================================================================
echo. 
echo.
set /P itens= Quantas imagem devem ser editadas? 
set /A v_itens=itens
echo. 
echo.
set v_prefixo=none
set /P v_prefixo= Qual o comeco do nome dos arquivos para editar? 
echo. 
echo.
set v_saida=none
set /P v_saida= Como deve ficar o nome final? 
echo.
echo.
set /P extensao= Qual a extensao dos arquivos que deseja renomear (1: jpg; 2: jpeg; 3: png)? 
set /A v_extensao=extensao
echo. 
echo.
GOTO VALIDATE


:VALIDATE
IF %v_itens% EQU 0 GOTO INVALID_ITEM
IF %v_prefixo% EQU none GOTO INVALID_PREFIXO
IF %v_saida% EQU none GOTO INVALID_SAIDA
IF %v_extensao% NEQ 1 IF %v_extensao% NEQ 2 GOTO INVALID_EXTENSAO
GOTO PROCESS


:INVALID_ITEM
cls
echo =============================================================================
echo ========================== Renomeador de Arquivos  ==========================
echo =============================================================================
echo.
echo.
echo  Erro: Valor de qtde. de imgs. e invalido inserido. Revise e tente novamente!
echo.
echo.
pause
GOTO COLETA


:INVALID_PREFIXO
cls
echo =============================================================================
echo ========================== Renomeador de Arquivos  ==========================
echo =============================================================================
echo.
echo.
echo  Erro: Prefixo nao pode ficar vazio. Revise e tente novamente!
echo.
echo.
pause
GOTO COLETA


:INVALID_EXTENSAO
IF %v_extensao% NEQ 3 (
	cls
    echo =============================================================================
    echo ========================== Renomeador de Arquivos  ==========================
    echo =============================================================================
    echo.
    echo.
    echo  Erro: Extensao invalida. Revise e tente novamente!
    echo.
    echo.
    pause
    GOTO COLETA
) ELSE (
    GOTO PROCESS
)


:INVALID_SAIDA
cls
echo =============================================================================
echo ========================== Renomeador de Arquivos  ==========================
echo =============================================================================
echo.
echo.
echo  Erro: Saida nao pode ficar vazia. Revise e tente novamente!
echo.
echo.
pause
GOTO COLETA


:PROCESS
echo =============================================================================
set /P executar= Voce realmente deseja executar essa acao (y ou n)? 
IF %v_extensao%== 1 set v_extensao=jpg
IF %v_extensao%== 2 set v_extensao=jpeg
IF %v_extensao%== 3 set v_extensao=png
IF %executar% == y (
    FOR /L %%g IN (1, 1, %v_itens%) DO REN %v_prefixo%*.%v_extensao% %v_saida%-%%g.%v_extensao%
    GOTO END1
) ELSE IF %executar%== n (
    GOTO END2
) ELSE (
    GOTO END3
)


:END1
cls
echo =============================================================================
echo ========================== Renomeador de Arquivos  ==========================
echo =============================================================================
echo. 
echo.
echo  Processo de renomear concluido! Pressione Enter para sair
echo. 
echo. 
pause
exit


:END2
cls
echo =============================================================================
echo ========================== Renomeador de Arquivos  ==========================
echo =============================================================================
echo.
echo.
echo  Operacao cancelada. Pressione Enter para sair
echo.
echo.
pause
exit


:END3
cls
echo =============================================================================
echo ========================== Renomeador de Arquivos  ==========================
echo =============================================================================
echo.
echo.
echo  Voce nao digitou informacoes validas. Tente novamente por favor.
echo.
echo.
pause
cls
GOTO COLETA