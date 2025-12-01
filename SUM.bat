@echo off
set tries=2

:login_screen
echo ------------------------
echo ---- Wellcom to SUM ----
echo ------------------------
set /p loginPassword=Enter Password Login: 
cls
if "%loginPassword%" == "1234" (
    goto Menu
) else (
    set /a tries=%tries%-1 
    echo Invalid password, You have now "%tries%" tries....
    if %tries% EQU 0 (
        echo You have failed to enter the password three times. Try again later!
        goto exit_s
    )
    goto login_screen
)
pause

:Menu
echo -------------------------
echo ------ Menu Screen ------
echo -------------------------
echo [1] Add new user
echo [2] View all users
echo [3] Clear all users
echo [4] Exit
set /p operation=Choose what you want to do?[1-4]?
cls
if %operation% EQU 1 (
    goto add_user
) else if %operation% EQU 2 (
    goto view_all_users
) else if %operation% EQU 3 (
    goto clrear_all
) else if %operation% EQU 4 (
    goto exit_s
) else (
    echo You entered an Invalid number! Choose the correct number [1 - 4]...
    goto Menu
)

:add_user
echo -----------------------------
echo ---- Add New User Screen ----
echo -----------------------------
set /p user_name=Enter UserName : 
set /p Password=Enter Password : 
echo %user_name% : %Password% >> users_data.txt
echo User "%user_name%" was added successfully!
pause
cls
goto Menu

:view_all_users
echo -----------------------------
echo ----- List Users Screen -----
echo -----------------------------
echo *  UserName  ***  Password * 
if not exist users_data.txt (
    echo No data to Show, return to the menu....
) else (
type users_data.txt
)
pause
cls
goto Menu

:clrear_all
echo ----------------------------------------
echo ----- Delete All Users Info Screen -----
echo ----------------------------------------
set /p del= Are you sure you want to permanently delete all user information?[Y/N]? 
if /I "%del%" == "Y" (
    del users_data.txt /q /f
    echo All users was deleted!
) else (
    echo Users have not been deleted! You can return to the main menu.    
)
pause
cls
goto Menu

:exit_s
echo -----------------------------------
echo ---- The application has ended ----
echo -----------------------------------
pause
