import React from "react"

class Hour extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    return(
    	<div className="small-4 columns grid-x">
    		<div className="small-1 columns"></div>
    		<div className="small-10 columns hour-bar">{this.props.hour}</div>
    		<div className="small-1 columns"></div>
      </div>
    );
  }
}

export default Hour