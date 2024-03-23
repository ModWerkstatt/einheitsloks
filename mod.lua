function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
			{
				name = "ModWerkstatt",
				role = "CREATOR",
			},
		},
		tags = { "europe", "locomotive", "bundesbahn", "deutsche bahn", "electric", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
        params = {
			{
				key = "einheitsloks_vorspann",
				name = _("einheitsloks_vorspann"),
				values = { "No", "Yes", },
				tooltip = _("option_vorspann_einheitsloks_desc"),
				defaultIndex = 0,
			},
			{
				key = "einheitsloks_fake",
				name = _("einheitsloks_fake"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_einheitsloks_desc"),
				defaultIndex = 0,
			},
			{
				key = "einheitsloks_br110",
				name = _("einheitsloks_br110"),
				values = { "No", "Yes", },
				tooltip = _("option_einheitsloks_br110_desc"),				
				defaultIndex = 1,
			},
			{
				key = "einheitsloks_br110_3",
				name = _("einheitsloks_br110_3"),
				values = { "No", "Yes", },
				tooltip = _("option_einheitsloks_br110_3_desc"),				
				defaultIndex = 1,
			},
			{
				key = "einheitsloks_br139",
				name = _("einheitsloks_br139"),
				values = { "No", "Yes", },
				tooltip = _("option_einheitsloks_br139_desc"),				
				defaultIndex = 1,
			},
			{
				key = "einheitsloks_br140",
				name = _("einheitsloks_br140"),
				values = { "No", "Yes", },
				tooltip = _("option_einheitsloks_br140_desc"),				
				defaultIndex = 1,
			},
			{
				key = "einheitsloks_br141",
				name = _("einheitsloks_br141"),
				values = { "No", "Yes", },
				tooltip = _("option_einheitsloks_br141_desc"),				
				defaultIndex = 1,
			},
			{
				key = "einheitsloks_br150",
				name = _("einheitsloks_br150"),
				values = { "No", "Yes", },
				tooltip = _("option_einheitsloks_br150_desc"),				
				defaultIndex = 1,
			},
			{
				key = "einheitsloks_privatbahn",
				name = _("einheitsloks_privatbahn"),
				values = { "No", "Yes", },
				tooltip = _("option_einheitsloks_privatbahn_desc"),				
				defaultIndex = 1,
			},
        },
	},
	options = {
	},
	runFn = function (settings, modParams)
		
		local vorspannFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.vorspann == true then				
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
				--return false
			end	
			--return true
			return data
		end 
		
		local fakeFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.fake == true then		
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local br110Filter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.br110 == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local br110_3Filter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.br110_3 == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		
		local br139Filter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.br139 == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end  
		
		local br140Filter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.br140 == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		
		local br141Filter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.br141 == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local br150Filter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.br150 == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local privatbahnFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.einheitsloks and data.metadata.einheitsloks.privatbahn == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]					
			if params["einheitsloks_vorspann"] == 0 then				
				--addFileFilter("model/transportVehicle", vorspannFilter)	
				addModifier("loadModel", vorspannFilter)
			end
			if params["einheitsloks_fake"] == 0 then				
				addModifier("loadModel", fakeFilter)
			end
			if params["einheitsloks_br110"] == 0 then				
				addModifier("loadModel", br110Filter)
			end
			if params["einheitsloks_br110_3"] == 0 then				
				addModifier("loadModel", br110_3Filter)
			end
			if params["einheitsloks_br139"] == 0 then				
				addModifier("loadModel", br139Filter)
			end
			if params["einheitsloks_br140"] == 0 then				
				addModifier("loadModel", br140Filter)
			end
			if params["einheitsloks_br141"] == 0 then				
				addModifier("loadModel", br141Filter)
			end
			if params["einheitsloks_br150"] == 0 then				
				addModifier("loadModel", br150Filter)
			end
			if params["einheitsloks_privatbahn"] == 0 then				
				addModifier("loadModel", privatbahnFilter)
			end
			
		else
			--addFileFilter("model/transportVehicle", vorspannFilter)			
			addModifier("loadModel", fakeFilter)
			addModifier("loadModel", br110Filter)
			addModifier("loadModel", br110_3Filter)
			addModifier("loadModel", br139Filter)
			addModifier("loadModel", br140Filter)
			addModifier("loadModel", br141Filter)
			addModifier("loadModel", br150Filter)
			addModifier("loadModel", privatbahnFilter)
		end			
	end
}
end
