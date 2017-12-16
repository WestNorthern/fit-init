import React from "react"
import Hour from "./Hour"

class App extends React.Component {
	constructor(props) {
    super(props);
    var date= this.getTimeString();
    var pastThree= this.getLastThree();
    this.state= {
      time: date,
      pastThreeHours: pastThree
    }
  }
  getLastThree() {
  	var lastThreeArr = [];
  	const currentTime = new Date(Date.now()).getHours();
  	var x = 3;
  	while (x > 0) {
  		lastThreeArr.push(currentTime - x)
  		x--;
  	};
  	return lastThreeArr;
  }
  getTimeString() {
    const date = new Date(Date.now()).toLocaleTimeString();
    return date;
  }
  componentDidMount() {
    const _this = this;
    this.timer = setInterval(function(){
      var date = _this.getTimeString();
      _this.setState({
        time: date
      })
    },1000)
  }
  componentWillUnmount() {
      clearInterval(this.timer);
  }
  render() {
    return(
    	<div className="clockbar-wrapper">

    		<div className="hours-wrapper"> {this.state.pastThreeHours.map( hour => <Hour hour={hour} key={hour} /> ) } </div>

      	<p>{this.state.time}</p>

      </div>
    );
  }
}

export default App


