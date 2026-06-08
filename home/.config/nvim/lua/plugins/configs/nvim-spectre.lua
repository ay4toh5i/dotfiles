return {
  'nvim-pack/nvim-spectre',
  event = 'VeryLazy',
  config = function()
    -- Run CARGO_TARGET_AARCH64_APPLE_DARWIN_LINKER=/usr/bin/cc ./build.sh in this plugin directory to use nvim-oxi for better replacing
    require('spectre').setup({
      default = {
        replace = {
          cmd = "oxi"
        }
      }
    })
  end
}
