@echo off
echo ==========================================
echo  Step 1/5: Cleaning Flutter Cache...
echo ==========================================
call flutter clean

echo.
echo ==========================================
echo  Step 2/5: Fetching New Dependencies...
echo ==========================================
call flutter pub get

echo.
echo ==========================================
echo  Step 3/5: Upgrading Packages Safely...
echo ==========================================
call flutter pub upgrade

echo.
echo ==========================================
echo  Step 4/5: Triggering Code Generation...
echo ==========================================
call dart run build_runner build --delete-conflicting-outputs

echo.
echo ==========================================
echo  Step 5/5: Booting Application in Edge...
echo ==========================================
call flutter run -d edge

echo.
echo Done! Pipeline execution completed.
pause
