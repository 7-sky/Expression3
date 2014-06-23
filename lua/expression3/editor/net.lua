Expression3.Editor = {}

function Expression3.Editor:GetIDE()
	if not ValidPanel(Expression3.Editor.Panel) then
		Expression3.Editor.Panel = vgui.Create("Expression3EditorFrame")
		Expression3.Editor.Panel:Setup("Expression 3 Editor", "expression3", "E3")
	end
	return Expression3.Editor.Panel:Open()
end

function Expression3.Editor:Reload()
	if ValidPanel(Expression3.Editor.Panel) then
		Expression3.Editor.Panel:Remove()
	end
	return Expression3.Editor:GetIDE()
end
Expression3.Editor:Reload()
net.Receive("WireExpression3_OpenEditor", Expression3.Editor.GetIDE)