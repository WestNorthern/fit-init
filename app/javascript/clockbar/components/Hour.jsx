import React from "react"

class Hour extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    return(
    	<div className="hour-bar">
      	{this.props.hour}
      </div>
    );
  }
}

export default Hour