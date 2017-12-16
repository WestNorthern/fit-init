import React from "react"
import Hour from "./Hour"

class App extends React.Component {
	constructor(props) {
    super(props);
    var date= this.getTimeString();
    var pastThree= this.getLastThree();
    var nextThree= this.getNextThree();
    this.state= {
      time: date,
      pastThreeHours: pastThree,
      nextThreeHours: nextThree
    }
  }

  getLastThree() {
  	var lastThreeArr = [];
  	const currentTime = new Date(Date.now()).getHours();
  	function AMorPM() {
  		if (currentTime < 12){
  			return 'AM';
  		}
  		else{
  			return 'PM';
  		}
  	};

  	var x = 3;
  	while (x > 0) {
  		lastThreeArr.push(currentTime - x);
  		x--;
  	};
  	return lastThreeArr.map( x => {
  		if (x == 0){
  			return '12 AM';
  		}
  		else if (x == 12){
  			return '12 PM';
  		}
  		else if (x > 12){
  			x = x % 12;
  			return x + ' PM'
  		}
  		else{
  			return x + ' AM'
  		}
  	});
  }

  getNextThree() {
  	var nextThreeArr = [];
  	const currentTime = new Date(Date.now()).getHours();
  	function AMorPM() {
  		if (currentTime < 12){
  			return 'AM';
  		}
  		else{
  			return 'PM';
  		}
  	};

  	var x = 0;
  	while (x < 3) {
  		nextThreeArr.push(currentTime + 1 + x);
  		x++;
  	};
  	
  	return nextThreeArr.map( x => {
  		if (x == 0){
  			return '12 AM';
  		}
  		else if (x == 12){
  			return '12 PM';
  		}
  		else if (x > 12){
  			x = x % 12;
  			return x + ' PM'
  		}
  		else{
  			return x + ' AM'
  		}
  	});
  }

  getTimeString() {
    const date = new Date(Date.now()).toLocaleTimeString();
    return date;
  }

  componentDidMount() {
    const _this = this;
    this.timer = setInterval(function(){
      var date = _this.getTimeString();
      var pastThree= _this.getLastThree();
    	var nextThree= _this.getNextThree();
      _this.setState({
        time: date,
        pastThreeHours: pastThree,
      	nextThreeHours: nextThree
      })
    },1000)
  }

  componentWillUnmount() {
      clearInterval(this.timer);
  }

  render() {
    return(
    	<div className="clockbar-wrapper grid-x">

    		<div className="hours-wrapper small-5 columns grid-x"> {this.state.pastThreeHours.map( hour => <Hour hour={hour} key={hour} /> ) } </div>

      	<div className="current-time small-2 columns">{this.state.time}</div>

      	<div className="hours-wrapper small-5 columns grid-x"> {this.state.nextThreeHours.map( hour => <Hour hour={hour} key={hour} /> ) } </div>


      </div>
    );
  }
}

export default App


