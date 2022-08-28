getgenv()['MyName'] = game.Players.LocalPlayer.Name
getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not isfolder('Crimson_Config') then
        makefolder('Crimson_Config')
    end
    if not isfile('Crimson_Config/'..Name..'_Config'..'.json') then
        writefile('Crimson_Config/'..Name..'_Config'..'.json',JsonEncode(getgenv().Setting))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if isfolder('Crimson_Config') and isfile('Crimson_Config/'..Name..'_Config'..'.json') then
        getgenv().Setting = JsonDecode(readfile('Crimson_Config/'..Name..'_Config'..'.json'))
        return getgenv().Setting
    else
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if isfolder('Crimson_Config') and isfile('Crimson_Config/'..Name..'_Config'..'.json') then
        writefile('Crimson_Config/'..Name..'_Config'..'.json',JsonEncode(getgenv().Setting))
    else
        Check_Setting(Name)
    end
end
