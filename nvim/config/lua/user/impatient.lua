local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	vim.notify("could not load impatient")
	return
end

impatient.enable_profile()
