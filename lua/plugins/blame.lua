return {
	{
		"fy0u11/blame.nvim",
		lazy = false,
		config = function()
			local blame_utils = require("blame.utils")
			local utils = require("utils")

			-- Register all necessary highlight groups
			local color_ranges = {
				{ base = "#e71c74", count = 4 },
				{ base = "#af1bc9", count = 4 },
				{ base = "#18a8be", count = 4 },
				{ base = "#a8a510", count = 4 },
				{ base = "#8a8a8a", count = 4 },
			}
			local total_index = 1
			local hl_groups = {}
			for range_idx, range in ipairs(color_ranges) do
				for i = 0, range.count - 1 do
					local hl_group = "git_blame_hl_" .. total_index
					local factor = i * 0.2
					local hl
					if range_idx == 5 then
						hl = { fg = utils.dim_color(range.base, 1 - factor) }
					else
						hl = { fg = utils.desaturate_color(range.base, factor) }
					end
					-- Underline the very newest commit
					if total_index == 1 then
						hl["underline"] = true
					end
					vim.api.nvim_set_hl(0, hl_group, hl)
					hl_groups[total_index] = hl_group
					total_index = total_index + 1
				end
			end

			local buffers_with_hashes = {}
			vim.api.nvim_create_autocmd("User", {
				pattern = "BlameViewBefore",
				callback = function(args)
					local parsed_blames = utils.unique_by_field(args.data.blame_lines, "hash")
					table.sort(parsed_blames, function(a, b) -- sort commits by datetime
						return a.committer_time > b.committer_time
					end)
					buffers_with_hashes[args.buf] = {}
					local counter = 1
					for _, v in ipairs(parsed_blames) do
						local hash = string.sub(v.hash, 0, 7)
						if hash ~= "0000000" then
							if counter > 20 then
								counter = 20
							end
							buffers_with_hashes[args.buf][hash] = counter
							counter = counter + 1
						end
					end
				end,
			})

			local my_format = function(line_porcelain, config, idx)
				local hash = string.sub(line_porcelain.hash, 0, 7)
				local line_with_hl = {}
				local is_committed = hash ~= "0000000"
				local date_text
				local default_hl = "Comment"
				if is_committed then
					if config.relative_date_if_recent then
						date_text = blame_utils.format_recent_date(config.date_format, line_porcelain.committer_time)
					else
						date_text = blame_utils.format_time(config.date_format, line_porcelain.committer_time)
					end
					local bufn = vim.api.nvim_get_current_buf()
					local hlindex = buffers_with_hashes[bufn] and buffers_with_hashes[bufn][hash] or 20
					local hl = hl_groups[hlindex] or default_hl
					line_with_hl = {
						idx = idx,
						values = {
							{
								textValue = hash,
								hl = default_hl,
							},
							{
								textValue = date_text,
								hl = hl,
							},
							{
								textValue = line_porcelain.author,
								hl = hl,
							},
						},
						format = "%s  %s  %s",
					}
				else
					line_with_hl = {
						idx = idx,
						values = {
							{
								textValue = "Not committed",
								hl = default_hl,
							},
						},
						format = "%s",
					}
				end
				return line_with_hl
			end

			require("blame").setup({
				format_fn = my_format,
			})
		end,
	},
}
