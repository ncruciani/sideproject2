
//Function for Slide Show//

let slideshow = document.getElementById("slide_show");
let slideHolders = document.querySelectorAll(".slide_holder");
//this variable stores whether or not the mousedown or mouseup event has most recently occured
let isDragging = false;
let startX = 0;
let scrollLeft = 0;
let currentSlide = 0;

slideshow.addEventListener("mousedown", (e) => {
	//indicates that the mouse is down on the element
	isDragging = true;
	/*startX is assigned the difference between the mouses horizontal position on the web page(how many pixels from the left of the web page the cursor is)
	and the number of pixels the cursor is from the left side of the "slideshow" element*/
startX = e.clientX - slideshow.getBoundingClientRect().left;
//this stores the value of the slideshow's "scrollLeft" attribute in a global variable to be used later
scrollLeft = slideshow.scrollLeft;
//prevents default behavior of mouse click
document.body.style.userSelect = "none";
e.preventDefault();
});


document.addEventListener("mousemove", (e) => {
	//this if statement makes the functions only run if both the mousedown event was triggered for this element
	if (!isDragging) return;
	/*x is assigned the difference between the mouses horizontal position on the web page(how many pixels from the left of the web page the cursor is)
	and the number of pixels the cursor is from the left side of the "slideshow" element*/
	const x = e.clientX - slideshow.getBoundingClientRect().left;
	/* walk is essentially the difference between where the mouse started on the slideshow (startX) and the position its currently in (x)*/
	//walk will eventually be used to set the position of the slide as the user is dragging it
	//in this case walk is twice the difference between where the mouse started on the slideshow so the slides will scroll twice as fast as the curser
	const walk = (x - startX) * 2;
	//this line sets the postion of the slide show to the difference of the current value of "scrollLeft" (the postions of the slideshow on "mousedown") and the value of walk
	slideshow.scrollLeft = scrollLeft - walk;

	// const maxScrollLeft = slideshow.clientWidth*3;
	// if (slideshow.scrollLeft >= maxScrollLeft){
	//     slideshow.scrollLeft = 0;
	// }
	e.preventDefault();
});

document.addEventListener("mouseup", () => {
	//this if statement makes sure this function wont run if the mouse is held down outside for the element dragged down and released
	if (!isDragging) return;
	isDragging = false;
	document.body.style.userSelect = "";

	//calculates the slide to be displayed by dividing the current  horizontal postion of the slideshow (all the slides) by the size of a slide and rounding it
	//the position the slide appears in on the slide show corresponds to the value of currentSlide
	currentSlide = Math.round(slideshow.scrollLeft / slideHolders[0].offsetWidth);
	// Calculate the target scroll position for the current slide
	//the target scroll or "snap postion" will always be set to the exact number of pixels on the slideshow element to display the slide with the most of itself appear in the window will be the one which is snapped to
	const targetScrollLeft = currentSlide * slideHolders[0].offsetWidth;
	// Smoothly scroll to the target slide
	scrollToSlide(targetScrollLeft);
});

// Function to smoothly scroll to a specific position
function scrollToSlide(targetPosition) {
	const duration = 300; // Duration of the scrolling animation in milliseconds
	//this gets a timestamp and uses at to keep track of the time when the function was called as "startTime"
	const startTime = performance.now();
	//this is the current scroll positon of the slide show (where the animation starts)
	const startScrollLeft = slideshow.scrollLeft;

	//function to animate scrolling
	function animateScroll(currentTime) {
		//calculates the time passed since animation begun
		const elapsedTime = currentTime - startTime;
		//checks if elapsedTime exceeds duration
		if (elapsedTime >= duration) {
			//"snaps" slideshow reel to the correct position of the elapsedTime exceeds animation time
			slideshow.scrollLeft = targetPosition;
			return;
		}

		//calculates scroll value for current point in time using ease function
		const scrollValue = easeInOut(elapsedTime, startScrollLeft, targetPosition - startScrollLeft, duration);
		//sets scroll position to calculated value
		slideshow.scrollLeft = scrollValue;
		//requests next frame to continue animation
		requestAnimationFrame(animateScroll);
	}
	//starts animation by requesting first frame
	requestAnimationFrame(animateScroll);
}

// Easing function for smoother animation
//t = time(elapsedTime), b = start position(startScrollLeft), c = change(targetPosition), d = duration(duration)
function easeInOut(t, b, c, d) {
	//t is devided by half the duration
	t /= (d / 2);
	//if "t" is less than one("t" is less than twice "d"(less than have the time in s the specified duration has passed))
	if (t < 1) {

		return (c / 2) * t * t + b;
	}
	t--;
	return (-c / 2) * (t * (t - 2) - 1) + b;
}

