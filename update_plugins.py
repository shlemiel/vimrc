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
ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim
nerdtree https://github.com/preservim/nerdtree
tlib https://github.com/tomtom/tlib_vim
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
lightline.vim https://github.com/itchyny/lightline.vim
editorconfig-vim https://github.com/editorconfig/editorconfig-vim
dracula https://github.com/dracula/vim
awesome-vim-colorschemes https://github.com/rafi/awesome-vim-colorschemes
vim-signature https://github.com/kshenoy/vim-signature
""".strip()

COMMON_PLUGINS_FORKED = """
vim-smoothie https://github.com/shlemiel/vim-smoothie
""".strip()

GITHUB_ZIP = "%s/archive/master.zip"

COMMON_SOURCE_DIR_FORKED = path.join(path.dirname(__file__), "common_plugins/sources_forked")
COMMON_SOURCE_DIR = path.join(path.dirname(__file__), "common_plugins/sources_non_forked")


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
                executor.map(cf_update(COMMON_SOURCE_DIR), COMMON_PLUGINS.splitlines())
                executor.map(cf_update(COMMON_SOURCE_DIR_FORKED), COMMON_PLUGINS_FORKED.splitlines())
        else:
            [cf_update(COMMON_SOURCE_DIR)(x) for x in COMMON_PLUGINS.splitlines()]
            [cf_update(COMMON_SOURCE_DIR_FORKED)(x) for x in COMMON_PLUGINS_FORKED.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
