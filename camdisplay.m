function camdisplay(handles)
	camSel = camSelected(handles);
	str = '';
	for i=1:size(camSel,1)
		str = [str camSel{i,1} '\t' camSel{i,2} '\n'];
	end
	str = sprintf(str);
	
	set(handles.camDisplay,'String',str);
end
