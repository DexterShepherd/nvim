return {
  { "nvim-neotest/neotest-jest" },
  { "thenbe/neotest-playwright" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-jest",
        ["neotest-playwright"] = {
          persist_project_selection = true,
          enable_dynamic_test_discovery = true,
        },
      },
    },
  },
}
