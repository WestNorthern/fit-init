import React from "react"

class DailyScoreHour extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
      if(this.props.isTrue === true) {
        return(
          <div className="small-5 columns bobby"></div>
        );
      }
      else {
        return(
          <div className="small-5 columns bobby-no"></div>
        );
      }
  }
}

export default DailyScoreHour