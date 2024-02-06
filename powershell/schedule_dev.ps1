function isRunning{
    if(get-process | Where-Object{$_.path -eq "C:\Users\user\Desktop\ANPR-8-Working\app.py"}){
        "Is Running"
    }else{
        "Is Not Running"
        Set-Location C:\Users\user\Desktop\ANPR-8-Working
        Start-Process C:\Users\user\anaconda3\envs\torch\python.exe app.py
    }
}

function Weekday{
    $hour = Get-Date -Format "HH"
    if (($hour -ge 12) -and ($hour -lt 18)){
        isRunning
    }
    elseif(($hour -eq 18)){
        Write-Output "Monday-Thursday Stop"
        Set-Location C:\Users\user\Desktop\ANPR-8-Working
        Stop-Process -Name "Python"
    }
}


function Friday{
    $hour = Get-Date -Format "HH"
    $minute = Get-Date -Format "mm"
    if (($hour -ge 12) -and ($hour -lt 15)){
        isRunning
    }
    elseif(($hour -eq 14) -and ($minute -eq 59)){
        Write-Output "Friday Stop"
        Set-Location C:\Users\user\Desktop\ANPR-8-Working
        Stop-Process -Name "Python"
    }
}


while ($true){
    $localtime = Get-Date -Format "dddd HH:mm"
    Write-Output $localtime
    $day = Get-Date -Format "dddd"
    if (($day -eq "Sunday") -or ($day -eq "Saturday")){Start-Sleep -Seconds 86400}
    elseif ($day -eq "Friday") {Friday}
    else {Weekday}
    Start-Sleep -Seconds 60
}



#if(get-process | Where-Object{$_.path -eq "C:\Users\user\Desktop\ANPR-8-Working\app.py"})
#check if running

#Set-Location C:\Users\user\Desktop\ANPR-8-Working
#Start-Process C:\Users\user\anaconda3\envs\torch\python.exe app.py
