function par=rundaq(handles)
	global hl;
	hl=handles;
	
	par.increment_save_num = 1; % Don't change this!!!
	par.experiment         = get(handles.ExperimentStr,'String');

	camlist  = camSelected(handles);
	par.cams = camlist(:,2);

	par.save_E200      = get(handles.SaveE200,'Value');
	par.save_back      = get(handles.Savebackground,'Value');
	par.set_print2elog = get(handles.Print2elog,'Value');
	par.n_shot         = str2num(get(handles.Numberofshots,'String'));
	
	par.comt_str=get(handles.Commentstring,'String');
	
	if get(handles.Daqscan,'Value')
		par.fcnHandle        = handles.func;
		par.Control_PV_start = str2num(get(handles.Scanstartval,'String'));
		par.Control_PV_end   = str2num(get(handles.Scanendval,'String'));;
		par.n_step           = str2num(get(handles.Scanstepsval,'String'));
	end
	
	% E200_DAQ_2013(par);
	FACET_DAQ_2014(par);

	display('Data Acquisition Successfully Taken via GUI');
end
