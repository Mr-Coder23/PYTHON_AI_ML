@echo off
title Python AI - Full Library Installer

echo ============================================================
echo        PYTHON + DATA SCIENCE + AI LIBRARY INSTALLER
echo ============================================================
echo.
echo Python detected:
python --version
echo.

echo [1/8] Upgrading pip, setuptools and wheel...
python -m pip install --upgrade pip setuptools wheel
if errorlevel 1 goto :error

echo.
echo [2/8] Installing NumPy, Pandas, SciPy and visualization...
python -m pip install numpy pandas scipy matplotlib seaborn plotly
if errorlevel 1 goto :error

echo.
echo [3/8] Installing Machine Learning libraries...
python -m pip install scikit-learn statsmodels mlxtend joblib
if errorlevel 1 goto :error

echo.
echo [4/8] Installing Web scraping and API libraries...
python -m pip install requests beautifulsoup4 lxml selenium httpx pydantic
if errorlevel 1 goto :error

echo.
echo [5/8] Installing Python Full Stack / Backend libraries...
python -m pip install fastapi uvicorn sqlalchemy pymysql psycopg2-binary
if errorlevel 1 goto :error

echo.
echo [6/8] Installing Jupyter...
python -m pip install jupyter notebook ipykernel
if errorlevel 1 goto :error

echo.
echo [7/8] Installing NLP and Computer Vision libraries...
python -m pip install nltk spacy opencv-python pillow scikit-image
if errorlevel 1 goto :error

echo.
echo Installing spaCy English model...
python -m spacy download en_core_web_sm
if errorlevel 1 goto :error

echo.
echo [8/8] Installing Deep Learning and Transformers...
python -m pip install torch torchvision torchaudio
if errorlevel 1 goto :error

python -m pip install transformers datasets tokenizers accelerate
if errorlevel 1 goto :error

echo.
echo ============================================================
echo                 INSTALLATION COMPLETED
echo ============================================================
echo.
echo Verifying important libraries...
python -c "import numpy, pandas, scipy, matplotlib, sklearn, mlxtend, torch; print('NumPy:', numpy.__version__); print('Pandas:', pandas.__version__); print('SciPy:', scipy.__version__); print('Scikit-learn:', sklearn.__version__); print('MLxtend:', mlxtend.__version__); print('PyTorch:', torch.__version__)"
echo.
echo If no error appeared above, your main Python AI stack is ready.
echo.
pause
exit /b 0

:error
echo.
echo ============================================================
echo                    INSTALLATION FAILED
echo ============================================================
echo.
echo A package installation returned an error.
echo Read the error shown above and send it to ChatGPT.
echo Do NOT close this window before copying the error.
echo.
pause
exit /b 1
