import React from "react"
import DailyScoreHour from './DailyScoreHour'

class DailyScoreNode extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
      return(
        <div className="small-1 columns grid-x">
          
          <DailyScoreHour isTrue={this.props.node[0]} />
          <div className="small-1"></div>
          <DailyScoreHour isTrue={this.props.node[1]} />

        </div>
      );     
  }
}

export default DailyScoreNode