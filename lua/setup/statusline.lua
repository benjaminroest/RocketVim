local function get_mode()
	local mode_map = {
		n = { " n ", "StModeNormal" },
		i = { " i ", "StModeInsert" },
		v = { " v ", "StModeVisual" },
		V = { " v-line ", "StModeVisual" },
		["\22"] = { " v-block ", "StModeVisual" },
		c = { " c ", "StModeOther" },
		r = { " r ", "StModeOther" },
		R = { " R ", "StModeOther" },
		t = { " t ", "StModeOther" },
	}
	local mode = vim.api.nvim_get_mode().mode
	local m = mode_map[mode] or { " " .. mode .. " ", "StModeOther" }
	return "%#" .. m[2] .. "#" .. m[1] .. "%#StBase#"
end

local function get_git()
	local dict = vim.b.gitsigns_status_dict
	if not dict then
		return ""
	end

	local branch = dict.head and ("%#StGitBranch#  " .. dict.head .. " ") or ""
	local added = dict.added and dict.added > 0 and ("%#StGitAdd#+" .. dict.added .. " ") or ""
	local changed = dict.changed and dict.changed > 0 and ("%#StGitChange#~" .. dict.changed .. " ") or ""
	local removed = dict.removed and dict.removed > 0 and ("%#StGitDelete#-" .. dict.removed .. " ") or ""

	local diff = added .. changed .. removed
	if branch == "" and diff == "" then
		return ""
	end
	return diff .. branch .. ""
end

local function get_lsp_diagnostic_count()
	local counts = vim.diagnostic.count(0)

	local errors = counts[vim.diagnostic.severity.ERROR] or 0
	local warnings = counts[vim.diagnostic.severity.WARN] or 0
	local hints = counts[vim.diagnostic.severity.HINT] or 0
	local info = counts[vim.diagnostic.severity.INFO] or 0

	local error_icon = errors > 0 and "  " .. errors or ""
	local warnings_icon = warnings > 0 and "  " .. warnings or ""
	local hints_icon = hints > 0 and "  " .. hints or ""
	local info_icon = info > 0 and "  " .. info or ""

	return "%#ErrorHl#"
		.. error_icon
		.. "%#WarningHl#"
		.. warnings_icon
		.. "%#HintsHl#"
		.. hints_icon
		.. "%#InfoHl#"
		.. info_icon
end

function _G.CustomStatusLine()
	local is_active = vim.g.statusline_winid == vim.fn.win_getid()
	local is_modified = vim.api.nvim_get_option_value("modified", { buf = 0 })
	local modified_icon = is_modified and "" or "󱓞"
	local filename = "%t"
	local space = "%="
	if not is_active then
		return "%#StBase#" .. filename .. space .. "not active"
	end
	return "%#StBase# "
		.. "%#FileModifiedIcon#"
		.. modified_icon
		.. " "
		.. "%#StBase#"
		.. filename
		.. " "
		.. get_lsp_diagnostic_count()
		.. "%#StBase#"
		.. space
		.. get_git()
		.. get_mode()
end

vim.opt.statusline = "%!v:lua.CustomStatusLine()"

vim.cmd("redrawstatus") -- no need if not using any floating window from dashboard

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave", "CmdlineLeave" }, {
	callback = function()
		vim.schedule(function()
			vim.cmd("redrawstatus")
		end)
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	group = vim.api.nvim_create_augroup("statusline_git", {}),
	command = "redrawstatus",
})

vim.api.nvim_set_hl(0, "StModeNormal", { fg = "#2d353b", bg = "#83c092", bold = true })
vim.api.nvim_set_hl(0, "StModeInsert", { fg = "#2d353b", bg = "#F7F1DE", bold = true })
vim.api.nvim_set_hl(0, "StModeVisual", { fg = "#2d353b", bg = "#d699b6", bold = true })
vim.api.nvim_set_hl(0, "StModeOther", { fg = "#2d353b", bg = "#e67e80", bold = true })
vim.api.nvim_set_hl(0, "StGitBranch", { fg = "#d3c6aa", bg = "NONE" })
vim.api.nvim_set_hl(0, "StGitAdd", { fg = "#a7c080", bg = "NONE" })
vim.api.nvim_set_hl(0, "StGitChange", { fg = "#dbbc7f", bg = "NONE" })
vim.api.nvim_set_hl(0, "StGitDelete", { fg = "#e67e80", bg = "NONE" })
vim.api.nvim_set_hl(0, "FileModifiedIcon", { fg = "#FFFFFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "ErrorHl", { fg = "#e67e80", bg = "NONE" })
vim.api.nvim_set_hl(0, "WarningHl", { fg = "#dbbc7f", bg = "NONE" })
vim.api.nvim_set_hl(0, "HintsHl", { fg = "#A5E9DD", bg = "NONE" })
vim.api.nvim_set_hl(0, "InfoHl", { fg = "#B0BA99", bg = "NONE" })
vim.api.nvim_set_hl(0, "RecordingHl", { fg = "#e67e80", bg = "NONE" })
vim.api.nvim_set_hl(0, "LazyCheckHl", { fg = "#F7F1DE", bg = "NONE" })
vim.api.nvim_set_hl(0, "StBase", { bg = "NONE" }) -- Transparent background
