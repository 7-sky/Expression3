Expression3.Tokenizer.Logic = {}

function Expression3.Tokenizer.Logic:Decide(strCode)
	local Solution  = {}
	Solution.Lines = string.Explode(Expression3.Tokenizer.Language:GetKeywords("NewLine")[1], strCode) -- Only one comment
	-- Skip nothing
	
	for k,v in pairs(Solution.Lines) do
		if v == "" then
			table.remove(Solution.Lines, k)
		end
	end
	
	-- Skip comments like this -> //
	for k,v in pairs(Solution.Lines) do
		for _, Keywords in pairs(Expression3.Tokenizer.Language:GetKeywords("Comment")) do
			local CodeWithoutComments = string.Explode(Keywords, v)[1]
			Solution.Lines[k] = CodeWithoutComments
		end
	end
	
	for k,v in pairs(Solution.Lines) do
		MsgC(color_white, v.."\n")
	end
	return Expression3.Tokenizer.Chunk.Stats[1]
end