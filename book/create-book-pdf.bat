@echo off
REM Get the absolute path of the project root (one level up from this script)
pushd "%~dp0.."
set "PROJECT_ROOT=%CD%"
popd

REM Configuration
SET BOOK_SOURCE=book/index.adoc
SET BUILD_DIR=build

echo Building book from: %PROJECT_ROOT%

REM Ensure build directory exists at the root
if not exist "%PROJECT_ROOT%\%BUILD_DIR%" mkdir "%PROJECT_ROOT%\%BUILD_DIR%"

REM Run Docker
REM We mount the PROJECT_ROOT to /documents/
docker run --rm -v "%PROJECT_ROOT%":/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf -D %BUILD_DIR% %BOOK_SOURCE%

echo.
echo Build complete! Your PDF is in the %BUILD_DIR% folder.
pause