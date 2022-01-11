local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end
bufferline.setup {
	options = {
		offsets = {{filetype = "NvimTree", text = " Explorer"}},
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = " ",
		left_trunc_marker = " ",
		right_trunc_marker = " ",
		view = "default",
		separator_style = "slant",
		indicator_icon = "",
		custom_filter = function(buf_number)
			-- filter out quick fix window
			if vim.bo[buf_number].filetype ~= "qf" then
				return true
			end
		end,
	},
}
