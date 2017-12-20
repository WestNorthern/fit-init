import React from "react"

class Hour extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    if(this.props.hourCheck === true){
      return(
      	<div className="small-4 columns grid-x">
      		<div className="small-1 columns"></div>
      		<div className="small-10 columns hour-bar-yes">{this.props.hour}</div>
      		<div className="small-1 columns"></div>
        </div>
      );
    } 
    else if (this.props.hourCheck === false){
      return(
        <div className="small-4 columns grid-x">
          <div className="small-1 columns"></div>
          <div className="small-10 columns hour-bar-no">{this.props.hour}</div>
          <div className="small-1 columns"></div>
        </div>
      );
    }
    else {
      return(
        <div className="small-4 columns grid-x">
          <div className="small-1 columns"></div>
          <div className="small-10 columns hour-bar">{this.props.hour}</div>
          <div className="small-1 columns"></div>
        </div>
      );
    }
  }
}

export default Hour