function rundaq(handles)
	global hl;
	hl=handles;
	
	par=E200_Param;
	par=rmfield(par,'camera_config');
	% 
	par.experiment=get(handles.ExperimentStr,'String');
	% par.camera_config=str2num(get(handles.Camconfignumber,'String'));

	camlist = camSelected(handles);
	par.cams = camlist;

	% display(par.cams)
	par.is_CMOS = strncmp('CMOS',par.cams(:,2),4);
	par.num_CMOS = sum(par.is_CMOS);
	par.run_cmos = par.num_CMOS > 0;
	par.cam_CMOS = par.cams(par.is_CMOS,:);
	par.cam_UNIQ = par.cams(~par.is_CMOS,:);
	par.num_UNIQ = sum(~par.is_CMOS);

	if get(handles.Eventcode213,'Value')
	    par.event_code=213;
	elseif get(handles.Eventcode53,'Value')
	    par.event_code=53;
	else
	    error('Choose an event code!');
	end
	
	par.save_facet=get(handles.Savefacet,'Value');
	par.save_E200=get(handles.SaveE200,'Value');
	par.save_back=get(handles.Savebackground,'Value');
	par.set_print2elog=get(handles.Print2elog,'Value');
	par.aida_daq=get(handles.AIDAdaq,'Value');
	par.n_shot=str2num(get(handles.Numberofshots,'String'));
	par.cmos_n_shot=str2num(get(handles.Numberofshots,'String'));
	
	% CMOS stuff
	%par.run_cmos = get(handles.UseCMOS,'Value');
	%[day,rem]=strtok(datestr(now),'-');
	%[month,rem]=strtok(rem,'-');
	%date_path = ['/media/CMOS_Volume/data/' month '_' day];
	%E200_setNum = lcaGetSmart('SIOC:SYS1:ML02:AO001')+1;
	%E200_dir = ['/E200_' num2str(E200_setNum) '/'];
	%par.cmos_path = [date_path E200_dir];
	par.cmos_file = 'data_step_01';
	
	par.comt_str=get(handles.Commentstring,'String');
	
	if get(handles.Daqscan,'Value')
	    startval=str2num(get(handles.Scanstartval,'String'));
	    endval=str2num(get(handles.Scanendval,'String'));
	    stepsval=str2num(get(handles.Scanstepsval,'String'));
	    switch get(handles.Scanfunction,'Value')
	        case {1, 2, 3, 5}
	            E200_gen_scan(handles.func,startval,endval,stepsval,par);
	        case 4
	            E200_Dispersion_Scan(startval,endval,stepsval,par.n_shot,par.camera_config);
	    end
	else
	    E200_DAQ_2013(par);
	end
	
	display('Data Acquisition Successfully Taken via GUI');
end
