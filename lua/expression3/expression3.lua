Expression3 = {}

Expression3.Version = "Git"

function Expression3.Msg(plyPlayer, strMsg, numType)
	plyPlayer = SERVER and plyPlayer or LocalPlayer()
	plyPlayer:SendLua(string.format("local s=%q notification.AddLegacy(s,%u,%s) MsgN(s)", strMsg, numType, 5))
end

function Expression3.Error(plyPlayer, strError)
	Expression3.Msg(plyPlayer, "Expression3 Error: "..strError, 1)
end

function Expression3.Warning(plyPlayer, strWarning)
	Expression3.Msg(plyPlayer, "Expression3 Warning: "..strWarning, 3)
end