install_node_version=stable

function install_node {
  mkdir -p ~/.nodebrew/src
  update_node
}

function update_node {
  nodebrew install-binary $install_node_version || true
  nodebrew alias default $install_node_version
  nodebrew use default
  yarn global upgrade
}

installers+=(node)
