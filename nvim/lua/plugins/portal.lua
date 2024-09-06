return {
    "cbochs/portal.nvim",
    -- Optional dependencies
    dependencies = {
        "cbochs/grapple.nvim",
        "ThePrimeagen/harpoon"
    },
	keys = {
		{ 
			"<c-o>", "<cmd>Portal changelist backward<cr>",
			desc = "Jump through changes backwards"
		},
		{
			"<c-i>", "<cmd>Portal changelist forward<cr>",
			desc = "Jump through changes forward"
		}
	}
}
