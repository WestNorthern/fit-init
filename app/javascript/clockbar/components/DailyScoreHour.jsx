import React from "react"

class DailyScoreHour extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
      if(this.props.isTrue === true) {
        return(
          <div className="small-6 columns hour-score-true"></div>
        );
      }
      else {
        return(
          <div className="small-6 columns hour-score-false"></div>
        );
      }
  }
}

export default DailyScoreHour