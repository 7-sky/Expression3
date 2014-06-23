Expression3.Tokenizer.Logic = {}

function Expression3.Tokenizer.Logic:Decide(strCode)
	local Solution  = {}
	Solution.Lines = string.Explode("\n", strCode)
	PrintTable(Solution.Lines)
end