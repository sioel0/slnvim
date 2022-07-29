local status_ok, neorg = pcall(require, 'neorg')
if not status_ok then
  return
end

neorg.setup({
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
    ['core.norg.compeltion'] = {
      config = {
        engine = 'nvim-cmp'
      }
    },
    ['core.presenter'] = {
      config = {
        zen_mode = 'truezen'
      }
    }
  }
})
