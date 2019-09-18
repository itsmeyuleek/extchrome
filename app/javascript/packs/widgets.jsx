import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import Widget from '../components/Widget'
// import Color from '../../../../react-extension-boilerplate/src/color-bar/Color.jsx'

const Widgets = props => (
  <div>
    <Widget name="Color"/>
  </div>
)

// Hello.defaultProps = {
//   name: 'David'
// }
//
// Hello.propTypes = {
//   name: PropTypes.string
// }

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Widgets name="React" />,
    document.body.appendChild(document.createElement('div')),
  )
})
