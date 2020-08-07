install_node_version=stable

function install_node {
  mkdir -p ~/.nodebrew/src
  nodebrew install-binary $install_node_version
  nodebrew alias default $install_node_version
  nodebrew use default
  npm install -g yarn
  yarn global upgrade
}

function update_node {
  nodebrew install-binary $install_node_version || true
  nodebrew alias default $install_node_version
  nodebrew use default
  npm install -g npm yarn
  yarn global upgrade
}

installers+=(node)
