import React from 'react'
import $ from 'jquery'

export default class Widget extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      name: props.name
    }

    this.changeColor = this.changeColor.bind(this)
  }

  changeColor() {
    document.getElementById("color").style.background = document.getElementById("colorNumber").value
  }

  render() {
    return (
      <div className="Widget">
        <h1>Get {this.state.name}</h1>

        <div
          id="color"
          className="colorBox"
        />

        <input
          id="colorNumber"
          type="text"
          placeholder="#000fff"
          pattern="^#[0-9a-fA-F]{6}$"
        />

        <button
          type="button"
          onClick={ this.changeColor }>Отправить</button>
      </div>
    )
  }
}
