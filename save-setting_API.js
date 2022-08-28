getgenv()['Crimson_Config'] = game.Players.LocalPlayer.Name
getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not isfolder('SaveSetting') then
        makefolder('SaveSetting')
    end
    if not isfile('SaveSetting/'..Name..'_Config'..'.json') then
        writefile('SaveSetting/'..Name..'_Config'..'.json',JsonEncode(getgenv().Setting))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if isfolder('SaveSetting') and isfile('SaveSetting/'..Name..'_Config'..'.json') then
        getgenv().Setting = JsonDecode(readfile('SaveSetting/'..Name..'_Config'..'.json'))
        return getgenv().Setting
    else
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if isfolder('SaveSetting') and isfile('SaveSetting/'..Name..'_Config'..'.json') then
        writefile('SaveSetting/'..Name..'_Config'..'.json',JsonEncode(getgenv().Setting))
    else
        Check_Setting(Name)
    end
end
