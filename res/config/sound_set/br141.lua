local soundeffectsutil = require "soundeffectsutil"

function data()
return {
	tracks = {
		{ name = "vehicle/einheitsloks/stand.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/knall.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/knall.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/fahrt1.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/luft.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/brumm.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/kurve.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/bremse_alt.wav", refDist = 25.0 },
	},
	events = {
		horn = { names = { "vehicle/einheitsloks/br141_horn.wav" }, refDist = 16.0 },
	},
	updateFn = function (input)
		return {
			tracks = {
			-- stand
				{ gain = soundeffectsutil.sampleCurve({
							{0.0, 0.9 },
							{0.01, 0.0 },
							{1.0, 0.0 },
						 }, input.speed01),
				  pitch = soundeffectsutil.sampleCurve({
							{0.0, 1.0 },
							{0.2, 0.0 },
							{1.0, 0.0 },
						  }, input.speed01)
				},
			-- knall
				{ gain = soundeffectsutil.sampleCurve({
							{0.0, 0.0 },
							{0.0001, 0.9 },
							{0.065, 0.9 },
							{0.066, 0.0 },
							{0.105, 0.0 },
							{0.11, 0.9 },
							{0.12, 0.9 },
							{0.131, 0.0 },
							{0.199, 0.0 },
							{0.2, 0.9 },
							{0.23, 0.9 },
							{0.231, 0.0 },
							{0.299, 0.0 },
							{0.3, 0.9 },
							{0.33, 0.9 },
							{0.331, 0.0 },
							{1.0, 0.0 },
						 }, input.speed01),
				  pitch = soundeffectsutil.sampleCurve({
							{0.0, 0.0 },
							{0.499, 0.0 },
							{0.5, 1.0 },
							{1.0, 1.0 },
						  }, input.power01)
				},
			--knall 2
				{
				  gain = soundeffectsutil.sampleCurve({
							{0.0, 0 },
							{0.451, 0.0 },
							{0.452, 0.9 },
							{0.459, 0.9 },
							{0.46, 0.0 },
							{1.0, 0.0 },
						}, input.speed01),
				  pitch = soundeffectsutil.sampleCurve({
							{0.0, 0.0 },
							{0.9, 0.0 },
							{0.91, 1.0 },
							{1.0, 1.0 },
						  }, input.power01)
				},

			-- fahrt 1
				{
				  gain = soundeffectsutil.sampleCurve({
							{0.0, 0 },
							{0.01, 0.8 },
							{0.31, 0.8 },
							{0.4, 0.6 },
							{0.6, 0.5},
							{1.0, 0.4 },
						 }, input.speed01),
				  pitch = soundeffectsutil.sampleCurve({
							{0.0, 0.5 },
							{0.34, 1.0 },
							{1.0, 1.25 },
						  }, input.speed01)
				},
			-- luft
				{ gain = soundeffectsutil.sampleCurve({
							{0.0, 0 },
							{0.29, 0 },
							{0.33, 1.25 },
							{1.0, 1.25 },
						 }, input.speed01),
				  pitch = soundeffectsutil.sampleCurve({
							{0.0, 0 },
							{0.15, 1.0 },
							{1.0, 1.0 },
						  }, input.speed01)
				},
			-- brumm
				{
				  gain = soundeffectsutil.sampleCurve({
							{0.0, 0 },
							{0.01, 0.1 },
							{0.25, 0.3 },
							{1.0, 0.4 },
						 }, input.speed01),
				  pitch = soundeffectsutil.sampleCurve({
							{0.0, 0.7 },
							{1.0, 2.0 },
						  }, input.speed01)
				},
			    soundeffectsutil.squeal(input.speed, input.sideForce, input.maxSideForce),
				soundeffectsutil.brake(input.speed, input.brakeDecel, 0.5),
			},
			events = {
				horn = { gain = 1.0, pitch = 1.0 }
			}
		}
	end
	}
end
