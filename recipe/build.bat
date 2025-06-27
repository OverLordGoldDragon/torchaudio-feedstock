@echo on

:: The torchaudio CMake scripts fail to find the torch python library on Windows.
:: We need to set it manually. The path is determined by the conda-build environment.
set "CMAKE_ARGS=%CMAKE_ARGS% -DTORCH_PYTHON_LIBRARY=%PREFIX%\libs\python%CONDA_PY%.lib"

:: Run pip install, but add the --no-build-isolation flag
:: This forces pip to run in the current environment, which allows it to
:: see the CMAKE_ARGS variable we just set.
python -m pip install . --no-build-isolation -vv

:: Exit with the same error code as the pip install
if errorlevel 1 exit 1