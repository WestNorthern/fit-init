import React from "react"
import HydrateScoreHour from './HydrateScoreHour'

class HydrateScoreNode extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
      return(
        <div className="small-1 columns grid-x">
          
          <HydrateScoreHour isTrue={this.props.node[0]} />
          <HydrateScoreHour isTrue={this.props.node[1]} />

        </div>
      );     
  }
}

export default HydrateScoreNode