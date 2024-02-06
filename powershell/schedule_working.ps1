while ($true){
    $localtime = Get-Date -Format "dddd HH:mm"
    Write-Output $localtime
    $day = Get-Date -Format "dddd"
    $hour = Get-Date -Format "HH"
    $minute = Get-Date -Format "mm"
    if (($day -eq "Saturday") -or ($day -eq "Sunday")){
        Start-Sleep -Seconds 86400
    }
    elseif (($hour -eq 11) -and ($minute -eq 50)){
        Write-Output "Weekday Start"
        Set-Location C:\Users\user\Desktop\ANPR-8-Working
        Start-Process C:\Users\user\anaconda3\envs\torch\python.exe app.py
    }
    elseif (($day -eq "Friday") -and ($hour -eq 14) -and ($minute -eq 59)){
        Write-Output "Friday Stop"
        Set-Location C:\Users\user\Desktop\ANPR-8-Working
        Stop-Process -Name "Python"
    }
    elseif (($hour -eq 17) -and ($minute -eq 30)){
        Write-Output "Monday - Thursday Stop"
        Set-Location C:\Users\user\Desktop\ANPR-8-Working
        Stop-Process -Name "Python"
    }
    Start-Sleep -Seconds 60
}

#Set-Location C:\Users\user\Desktop\ANPR-8-Working
#Start-Process C:\Users\user\anaconda3\envs\torch\python.exe app.py

