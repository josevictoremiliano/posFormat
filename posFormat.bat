@echo off
color 06
echo Iniciando a instalacao de apps de desenvolvimento e gamers...
echo.
echo Instalando Vscode / 7zip / git 
winget install --id=Microsoft.VisualStudioCode -e && winget install --id=7zip.7zip -e && winget install --id=Git.Git -e 

echo.
echo 1 - Deseja instalar o Composer e o PHP? (S/N)
set /p phpok=

if /i "%phpok%"=="S" (
    echo Continuando...
    echo.
    echo Isto pode demorar um pouco...
    winget install --id=ApacheFriends.Xampp.8.2 -e

    echo Instalando o Composer
    setx path "%path%;C:\xampp\php" /M
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    php composer-setup.php --install-dir=bin

    echo Baixando o Laravel
    composer global require "laravel/installer"

    echo Adicionando o Laravel ao PATH
    setx path "%path%;%USERPROFILE%\AppData\Roaming\Composer\vendor\bin" /M

) else (
    echo Composer e PHP nao serao instalados!
)

echo.
echo 2 - Deseja instalar o Android Studio? (S/N)
set /p androidOk=

if /i "%androidOk%"=="S" (
    echo Instalando...
    winget install --id=Google.AndroidStudio -e
) else (
    echo Android Studio nao instalado!
)

echo.
echo 3 - Deseja instalar o Node.js? (S/N)
set /p nodeOk=

if /i "%nodeOk%"=="S" (
    echo Instalando...
    winget install --id=OpenJS.NodeJS -e
    npm install -g expo-cli
) else (
    echo Node.js não instalado!
)

echo.
echo 4 - Deseja instalar o Python? (S/N)
set /p pythonOk=

if /i "%pythonOk%"=="S" (
    echo Instalando...
    winget install --id=Python.Python -e
) else (
    echo Python nao instalado!
)

echo.
echo 5 - Deseja instalar CurseForge / Valorant / GeForceNow / Discord / Steam? (S/N)
set /p gameOk=

if /i "%gameOk%"=="S" (
    echo Instalando...
    winget install --id=Overwolf.CurseForge -e  && winget install --id=RiotGames.Valorant.BR -e && winget install --id=Nvidia.GeForceNow -e  && winget install --id=Discord.Discord -e && winget install --id=Valve.Steam -e
) else (
    echo CurseForge / Valorant / GeForceNow / Discord / Steam nao instalados!
    exit
)

echo Finalizado
exit


