local status_ok, neorg = pcall(require, 'neorg')
if not status_ok then
  return
end

neorg.setup{
  load = {
    ['core.defaults'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          home = '~/notes/home',
          uni = '~/notes/uni',
          work = '~/notes/work'
        }
      }
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp'
      }
    },
    ['core.presenter'] = {
      config = {
        zen_mode = 'truezen'
      }
    },
    ['core.norg.concealer'] = {
      config = {
        conceal = false,
        dim_code_blocks = {
          content_only = false
        }
      }
    }
  }
}
