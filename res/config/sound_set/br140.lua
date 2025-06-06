local soundeffectsutil = require "soundeffectsutil"

function data()
return {
	tracks = {
		{ name = "vehicle/einheitsloks/stand.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/fahrt1.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/luft.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/brumm.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/kurve.wav", refDist = 25.0 },
		{ name = "vehicle/einheitsloks/bremse_alt.wav", refDist = 25.0 },
	},
	events = {
		horn = { names = { "vehicle/einheitsloks/br140_horn.wav" }, refDist = 16.0 },
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
