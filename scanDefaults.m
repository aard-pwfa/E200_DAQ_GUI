function handles=scanDefaults(hObject,handles)
funcind=get(handles.Scanfunction,'Value');
switch funcind
	case 1
		handles.func=@set_QSBEND_energy;
		setdefaults(handles,-8,8,3);
		updateScanText(handles,'GeV');
	case 2
		handles.func=@set_QS_energy;
		setdefaults(handles,-8,8,3);
		updateScanText(handles,'GeV');
	case 3
		handles.func=@set_phase_ramp;
		setdefaults(handles,60,62,7);
		updateScanText(handles,'deg');
	case 4
		try
			handles=rmfield(handles,'func');
		end
		setdefaults(handles,-150,150,7);
		updateScanText(handles,'MeV');
	case 5
		handles.func=@set_QS_energy_ELANEX;
		setdefaults(handles,-2,2,5);
		updateScanText(handles,'GeV');
	case 6
		handles.func=@slit_scan;
		setdefaults(handles,-1.5,1.5,10);
		updateScanText(handles,'mm');
	case 7
		handles.func=@set_dummy;
		setdefaults(handles,-1,1,3);
		updateScanText(handles,'unitless');

end

guidata(hObject,handles)

Setscanval(handles);

end

function setdefaults(handles,start,scanend,steps)
set(handles.Scanstartval,'String',num2str(start));
set(handles.Scanendval,'String',num2str(scanend));
set(handles.Scanstepsval,'String',num2str(steps));
end
