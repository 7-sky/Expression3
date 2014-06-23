Expression3.Tokenizer.Chunk = {}

Expression3.Tokenizer.Chunk.Stats = {
	[1] = "Valid",
	[2] = "Error",
	[3] = "Timeout",
	[4] = "In Process"
}

Expression3.Tokenizer.Chunk.__index = Expression3.Tokenizer.Chunk

function Expression3.Tokenizer.Chunk:ctor()
	self.__hash = string.format("%p", self)
end

function Expression3.Tokenizer.Chunk:dtor()
	
end

function Expression3.Tokenizer.Chunk:__tostring()
	return "E3TokenChunk["..self.__hash.."]"
end

function Expression3.Tokenizer.Chunk:SetSource(objectSource)
	self.objectSource = objectSource
end

function Expression3.Tokenizer.Chunk:GetSource()
	return self.objectSource
end

function Expression3.Tokenizer.Chunk:CreateBranch(newBranch)
	self.Branches[#self.Branches + 1] = newBranch
end

function Expression3.Tokenizer.Chunk:Process()
	Expression3.Tokenizer.Logic:Decide(self:GetSource())
end

function Expression3.Tokenizer.Chunk:Return()
	if self.Release then
		return self.Stats[self.Release.Verdict], self:GetSource()
	end
	return self.Stats[4]
end

function Expression3.Tokenizer.Chunk:Build(objectSource)
	local newChunk = setmetatable({}, Expression3.Tokenizer.Chunk)
	newChunk:ctor()
	newChunk:SetSource(objectSource)
	return newChunk
end

local new = Expression3.Tokenizer.Chunk:Build([[
	#include <holo>
	#include <matrix>
	var count = 1

	var pos = new Vector

	var test = new holo
	test->SetPos(pos(10, 0, 0))
]])

print(new)