Expression3.Tokenizer.Language = {}
Expression3.Tokenizer.Language.Parts = {}


function Expression3.Tokenizer.Language:AddKeywords(strType, anyKeywords)
	self.Parts[strType] = self.Parts[strType] or {}
	if type(anyKeywords) == "table" then
		for k, v in pairs(anyKeywords) do
			self.Parts[strType][#self.Parts[strType] + 1] = v
		end
	else
		self.Parts[strType][#self.Parts[strType] + 1] = anyKeywords
	end
end

function Expression3.Tokenizer.Language:GetKeywords(strType)
	return self.Parts[strType] or Error("Unknown keyword type!")
end

Expression3.Tokenizer.Language:AddKeywords("Comment", "//")
Expression3.Tokenizer.Language:AddKeywords("MemberIndexer", {"->", ":", "."})
Expression3.Tokenizer.Language:AddKeywords("Operator", {"if", "for", "var"})
Expression3.Tokenizer.Language:AddKeywords("StatementTerminator", ";")
Expression3.Tokenizer.Language:AddKeywords("Directive", {"#include", "#define", "#ifdef", "#enddef"})
Expression3.Tokenizer.Language:AddKeywords("NewLine", "\n")

--PrintTable(Expression3.Tokenizer.Language.Parts)