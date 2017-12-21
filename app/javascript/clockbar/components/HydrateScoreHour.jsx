import React from "react"

class HydrateScoreHour extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    if(this.props.isTrue === true) {
      return(
        <div className="small-6 columns hydrate-score-true"></div>
      );
    }
    else {
      return(
        <div className="small-6 columns hydrate-score-false"></div>
      );
    }
  }
}

export default HydrateScoreHour