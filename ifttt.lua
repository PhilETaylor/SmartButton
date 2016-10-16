--ifttt.lua

print("Sending to IFTTT")


 http.get("https://www.phil-taylor.com/button.php", nil,
    function(code, data)
        print("Second response: " .. code .. ", data: " .. data)
         --Shutdown!
    print("zzz")
        gpio.write(3, gpio.LOW) 

    --If esp is enabled that means the button is still pushed!
    tmr.alarm(0, 2000, 1, function()
        reset()
    end)

    end)

     

function reset()
    print("Reseting Wifi..")
    wifi.sta.disconnect()
    wifi.sta.config("","")
    dofile("setwifi.lua")
end