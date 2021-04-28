// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import { ProSidebar, Menu, MenuItem, SubMenu, SidebarHeader, SidebarFooter, SidebarContent } from 'react-pro-sidebar';
import 'react-pro-sidebar/dist/css/styles.css';

const Hello = (props) => (
  <ProSidebar>
    <SidebarHeader>
      <Menu iconShape="square">
        <MenuItem>Dashboard de G47</MenuItem>
        <SubMenu title="Componentes">
          <MenuItem>Component 1</MenuItem>
          <MenuItem>Component 2</MenuItem>
        </SubMenu>
      </Menu>
    </SidebarHeader>
    <SidebarContent>
    </SidebarContent>
    <SidebarFooter>
    </SidebarFooter>
    <Menu iconShape="square">
      <MenuItem>Dashboard de G47</MenuItem>
      <SubMenu title="Componentes">
        <MenuItem>Component 1</MenuItem>
        <MenuItem>Component 2</MenuItem>
      </SubMenu>
    </Menu>
  </ProSidebar>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hello name="React" />,
    document.querySelector('#sidebar'),
  )
})
