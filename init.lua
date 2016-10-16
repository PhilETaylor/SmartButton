 --init.lua
gpio.mode(3, gpio.OUTPUT)
gpio.write(3, gpio.HIGH)
--  print("Reseting Wifi..")
 -- wifi.sta.disconnect()
 --  wifi.sta.config("","")
   -- wifi.setmode(wifi.STATION);
   --                 wifi.sta.config("BFITLTD-2G","cc295426cc");  

--init.lua
cnt = 0

print("Starting SmartButton")

tmr.alarm(1, 1000, 1, function()

--Get current Station configuration
ssid, password, bssid_set, bssid=wifi.sta.getconfig()
print("\nCurrent Station configuration:\nSSID : "..ssid
.."\nPassword  : "..password
.."\nBSSID_set  : "..bssid_set
.."\nBSSID: "..bssid.."\n")

if ssid == "" then
        print("No ssid set - launching web browser")
        tmr.stop(1)
        dofile("setwifi.lua")
else

if wifi.sta.getip()== nil then
    cnt = cnt + 1
    print("(" .. cnt .. ") Waiting for IP...")
    if cnt == 10 then
        tmr.stop(1)
        dofile("setwifi.lua")
    end
else
    tmr.stop(1)
    dofile("ifttt.lua")
end
end
end
)

