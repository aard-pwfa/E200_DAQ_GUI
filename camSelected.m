function camSel = camSelected(handles)
	camind = get(handles.Cameralist,'Value')';
	camlist = cameras();
	camSel = camlist(camind,[1,2,4]);

	% Verify cameras aren't on the same channel.
	camChannels = cell2mat(camSel(:,3));
	for i=1:size(camChannels,1)
		bool = (camChannels == camChannels(i));
		if sum(bool) > 1
			error(['Cannot choose cameras with the same channel:' camSel{i,1}]);
		end
	end
end
