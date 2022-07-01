try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import re
import zipfile
import shutil
import tempfile
import requests

from os import path

# --- Globals ----------------------------------------------
COMMON_PLUGINS = """
ale https://github.com/dense-analysis/ale
vim-ripgrep https://github.com/jremmen/vim-ripgrep
ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim
nerdtree https://github.com/preservim/nerdtree
nginx.vim https://github.com/chr4/nginx.vim
tlib https://github.com/tomtom/tlib_vim
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-bundle-mako https://github.com/sophacles/vim-bundle-mako
vim-coffee-script https://github.com/kchmck/vim-coffee-script
vim-indent-object https://github.com/michaeljsmith/vim-indent-object
vim-less https://github.com/groenewege/vim-less
vim-pyte https://github.com/therubymug/vim-pyte
friendly-snippets https://github.com/rafamadriz/friendly-snippets
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-fugitive https://github.com/tpope/vim-fugitive
vim-rhubarb https://github.com/tpope/vim-rhubarb
vim-gitgutter https://github.com/airblade/vim-gitgutter
vim-flake8 https://github.com/nvie/vim-flake8
vim-pug https://github.com/digitaltoad/vim-pug
lightline.vim https://github.com/itchyny/lightline.vim
lightline-ale https://github.com/maximbaz/lightline-ale
vim-abolish https://github.com/tpope/vim-abolish
rust.vim https://github.com/rust-lang/rust.vim
vim-markdown https://github.com/plasticboy/vim-markdown
vim-ruby https://github.com/vim-ruby/vim-ruby
typescript-vim https://github.com/leafgarland/typescript-vim
vim-javascript https://github.com/pangloss/vim-javascript
vim-python-pep8-indent https://github.com/Vimjas/vim-python-pep8-indent
editorconfig-vim https://github.com/editorconfig/editorconfig-vim
dracula https://github.com/dracula/vim
awesome-vim-colorschemes https://github.com/rafi/awesome-vim-colorschemes
vim-signature https://github.com/kshenoy/vim-signature
vim-table-mode https://github.com/dhruvasagar/vim-table-mode
""".strip()

NVIM_PLUGINS = """
LuaSnip https://github.com/L3MON4D3/LuaSnip
plenary.nvim https://github.com/nvim-lua/plenary.nvim
telescope.nvim https://github.com/nvim-telescope/telescope.nvim
""".strip()

VIM_PLUGINS = """
vim-vsnip https://github.com/hrsh7th/vim-vsnip
""".strip()

COMMON_PLUGINS_FORKED = """
vim-smoothie https://github.com/shlemiel/vim-smoothie
vimwiki https://github.com/shlemiel/vimwiki
zettelkasten_snippets https://github.com/shlemiel/zettelkasten_snippets
""".strip()

NVIM_PLUGINS_FORKED = """
telescope-luasnip.nvim https://github.com/benfowler/telescope-luasnip.nvim
""".strip()

VIM_PLUGINS_FORKED = """
""".strip()

GITHUB_ZIP = "%s/archive/master.zip"

COMMON_SOURCE_DIR_FORKED = path.join(path.dirname(__file__), "common_plugins/sources_forked")
VIM_SOURCE_DIR_FORKED = path.join(path.dirname(__file__), "vim_plugins/sources_forked")
NVIM_SOURCE_DIR_FORKED = path.join(path.dirname(__file__), "nvim_plugins/sources_forked")
COMMON_SOURCE_DIR = path.join(path.dirname(__file__), "common_plugins/sources_non_forked")
VIM_SOURCE_DIR = path.join(path.dirname(__file__), "vim_plugins/sources_non_forked")
NVIM_SOURCE_DIR = path.join(path.dirname(__file__), "nvim_plugins/sources_non_forked")


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, "wb").write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    content_disp = req.headers.get("Content-Disposition")
    filename = re.findall("filename=(.+).zip", content_disp)[0]
    plugin_temp_path = path.join(temp_dir, path.join(temp_dir, filename))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print("Updated {0}".format(plugin_name))


def update(plugin, directory):
    name, github_url = plugin.split(" ")
    zip_path = GITHUB_ZIP % github_url
    try:
        download_extract_replace(name, zip_path, temp_directory, directory)
    except Exception as exp:
        print("Could not update {}. Error was: {}".format(name, str(exp)))

def cf_update(directory):
    return lambda plugin: update(plugin, directory)

if __name__ == "__main__":
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(cf_update(NVIM_SOURCE_DIR), NVIM_PLUGINS.splitlines())
                executor.map(cf_update(VIM_SOURCE_DIR), VIM_PLUGINS.splitlines())
                executor.map(cf_update(COMMON_SOURCE_DIR), COMMON_PLUGINS.splitlines())
                executor.map(cf_update(NVIM_SOURCE_DIR_FORKED), NVIM_PLUGINS_FORKED.splitlines())
                executor.map(cf_update(VIM_SOURCE_DIR_FORKED), VIM_PLUGINS_FORKED.splitlines())
                executor.map(cf_update(COMMON_SOURCE_DIR_FORKED), COMMON_PLUGINS_FORKED.splitlines())
        else:
            [cf_update(NVIM_SOURCE_DIR)(x) for x in NVIM_PLUGINS.splitlines()]
            [cf_update(VIM_SOURCE_DIR)(x) for x in VIM_PLUGINS.splitlines()]
            [cf_update(COMMON_SOURCE_DIR)(x) for x in COMMON_PLUGINS.splitlines()]
            [cf_update(NVIM_SOURCE_DIR_FORKED)(x) for x in NVIM_PLUGINS_FORKED.splitlines()]
            [cf_update(VIM_SOURCE_DIR_FORKED)(x) for x in VIM_PLUGINS_FORKED.splitlines()]
            [cf_update(COMMON_SOURCE_DIR_FORKED)(x) for x in COMMON_PLUGINS_FORKED.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
