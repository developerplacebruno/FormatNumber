--!strict
const suffixes = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc" }

return function(number: number, decimals: number?): string
	local abs = math.abs(number)
	if abs < 1000 then
		return string.format("%." .. (decimals or 0) .. "f", number):gsub("%.?0+$", "")
	end

	local tier = math.floor(math.log10(abs) / 3)
	local suffix = suffixes[tier + 1]
	local scaled = number / (1000 ^ tier)

	local formatted = string.format("%.2f", scaled)
	formatted = formatted:gsub("%.?0+$", "")

	return formatted .. suffix
end
