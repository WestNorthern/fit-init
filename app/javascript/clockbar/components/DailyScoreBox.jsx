import React from "react"
import DailyScoreNode from './DailyScoreNode'

class DailyScoreBox extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
      return(
      	<div className="row">
          <div className="grid-x">
          { this.props.dayScoreArray.map( (node, index) => <DailyScoreNode key={index} node={node} /> ) }
          </div>
        </div>
      );
      
  }
}

export default DailyScoreBox