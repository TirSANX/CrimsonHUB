getgenv()['MyName'] = game.Players.LocalPlayer.Name
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
    if not isfile('SaveSetting/'..Name..'_'..'Setting.json') then
        writefile('SaveSetting/'..Name..'_'..'Setting.json',JsonEncode(getgenv().Setting))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if isfolder('SaveSetting') and isfile('SaveSetting/'..Name..'_'..'Setting.json') then
        getgenv().Setting = JsonDecode(readfile('SaveSetting/'..Name..'_'..'Setting.json'))
        return getgenv().Setting
    else
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if isfolder('SaveSetting') and isfile('SaveSetting/'..Name..'_'..'Setting.json') then
        writefile('SaveSetting/'..Name..'_'..'Setting.json',JsonEncode(getgenv().Setting))
    else
        Check_Setting(Name)
    end
end
