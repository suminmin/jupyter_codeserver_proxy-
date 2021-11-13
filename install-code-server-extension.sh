
code_server_proxy_wheel="jupyter_codeserver_proxy-1.0b3-py3-none-any.whl"

curl -fsSL https://code-server.dev/install.sh | sh

# git clone https://github.com/vnijs/jupyter_codeserver_proxy.git
# cd jupyter_codeserver_proxy

# git clone https://github.com/suminmin/jupyter_codeserver_proxy-.git

python setup.py bdist_wheel

cp ./dist/${code_server_proxy_wheel} /${HOME}/

# conda install --quiet --yes \
#     'jupyter-server-proxy' && \
#     jupyter labextension install @jupyterlab/server-proxy && \
#     pip install --quiet --no-cache-dir "${HOME}/${code_server_proxy_wheel}" && \
#     rm "${HOME}/${code_server_proxy_wheel}" && \
#     jupyter lab clean -y && \
#     npm cache clean --force && \
#     conda clean --all -f -y && \
#     fix-permissions "${CONDA_DIR}" && \
#     fix-permissions "/home/${NB_USER}"

conda install -c conda-forge --quiet --yes \
    'jupyter-server-proxy' && \
    jupyter labextension install @jupyterlab/server-proxy && \
    pip install --quiet --no-cache-dir "${HOME}/${code_server_proxy_wheel}" && \
    rm "${HOME}/${code_server_proxy_wheel}" && \
    jupyter lab clean -y && \
    npm cache clean --force && \
    conda clean --all -f -y 


## plugin
code-server --install-extension ms-python.python


python -m pip install -U pylint --user