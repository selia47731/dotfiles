return {
  {
    "nvim-orgmode/orgmode",
    event = 'VeryLazy',
    config = function()
      require("orgmode").setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
        org_todo_keywords = { "TODO(t)", "WAIT(w)", "|", "DONE(d)", "CANCELLED(c)" },
        org_hide_leading_stars = true,
        org_startup_folded = "overview",

        org_capture_templates = {
          t = {
            description = "Task",
            template = "* TODO %?\n  SCHEDULED: %t\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n",
            target = function()
              return string.format('~/orgfiles/task/%s.org', os.date('%Y-%m-%d'))
            end,
          },
          n = {
            description = "Note",
            template = "* %?\n :PROPERTIES:\n :CREATED: %U\n :END:\n",
            target = function()
              return string.format('~/orgfiles/note/%s.org', os.date('%Y-%m-%d'))
            end,
          },
          j = {
            description = "Jorunal",
            template = "* %U\n%?\n",
            target = function()
              return string.format('~/orgfiles/journal/%s.org', os.date('%Y-%m-%d'))
            end,
          },
        },

        org_refile_targets = {
          { "~/orgfiles/task", max_level = 3 },
          { "~/orgfiles/note", max_level = 3 },
        },

        org_agenda_custom_commands = {
          d = {
            description = "Daily Overview",
            types = {
              {
                type = 'agenda',
                org_agenda_overriding_header = 'Daily Overview',
                org_agenda_span = 'day',
              },
              {
                type = 'tags_todo',
                match = 'TODO="TODO"',
                org_agenda_overriding_header = 'Pending TODOs',
                org_agenda_todo_ignore_scheduled = 'all',
              },
            },
          },
          w = {
            description = "Weekly Overview",
            types = {
              {
                type = 'agenda',
                org_agenda_overriding_header = 'Weekly Overview',
                org_agenda_span = 'week',
                org_agenda_start_on_weekday = 1,
                org_agenda_remove_tags = true,
              },
            },
          },
          t = {
            description = "Task List",
            types = {
              {
                type = 'tags_todo',
                match = 'TODO="TODO|TODO=WAIT"',
                org_agenda_overriding_header = 'Tasks & Waiting',
              },
            },
          },
          n = {
            description = "Notes List",
            types = {
              {
                type = 'tags',
                match = 'NOTE',
                org_agenda_overriding_header = 'Notes',
              },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-orgmode/telescope-orgmode.nvim",
    event = 'VeryLazy',
    dependencies = {
      "nvim-orgmode/orgmode",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("orgmode")

      vim.keymap.set('n', '<leader>r', require('telescope').extensions.orgmode.refile_heading)
      vim.keymap.set('n', '<leader>fh', require('telescope').extensions.orgmode.search_headings)
      vim.keymap.set('n', '<leader>li', require('telescope').extensions.orgmode.insert_link)
    end,
  },
}
