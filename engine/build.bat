REM Build script for engine
@Echo off
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.
FOR /r %%f in (*.c) do (
    SET cFilenames=!cFilenames! %%f
)

REM echo Files

SET assembly=engine
SET compilerFlags=-g -shared -Wvarargs -Wall -Werror

SET includeFlags=-Isrc -I%VULKAN_SDK%/Include
SET linkerFlags=-luser32 -lvulkan-1 -L%VULKAN_SDK%/Lib
SET defines=-D_DEBUG -DKEXPORT -D_CRT_SECURE_NO_WARNINGS

ECHO "bUILDING %ASSEMBLY%%..."
clang %cFilenames% %compilerFlags% -o ../bin/%assembly.dll %defines% %includeFlags% %linkerFlags%