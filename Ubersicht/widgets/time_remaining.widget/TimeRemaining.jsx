import { styled } from "uebersicht";

// Customize your widget --------------------------------------------------
const settings = {
	birthday: new Date("2002-01-01T00:00:00"), // your birthday, ignore the time part
	lifeExpectancy: 60, // how many years you expect to live
	style: {
		top: "70%",
		left: 0,
		right: 0,
		bottom: 0,
		heartSize: "40px",
		heartColor: "#D90A2C",
		heartBackgroundColor: "#333333",
	},
};

// Ubersicht methods ----------------------------------------------------------
export const refreshFrequency = 1000;

export const command = (dispatch) =>
	dispatch({ type: "UPDATE", data: calculateTime() });

export const updateState = (event, previousState) => {
	switch (event.type) {
		case "UPDATE":
			return event.data;
		default:
			return previousState;
	}
};

export const render = ({ daysLived, daysLeft, timeLeft, percentLeft }) => (
	<div>
		<Context>
			<link rel="preconnect" href="https://fonts.googleapis.com" />
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
			<link
				href="https://fonts.googleapis.com/css2?family=Playwrite+HR+Lijeva:wght@100..400&display=swap"
				rel="stylesheet"
			/>
			{/* <div style={{ display: "none" }}> */}
			{/* 	<svg */}
			{/* 		id="heart" */}
			{/* 		fill="currentColor" */}
			{/* 		width="25" */}
			{/* 		height="25" */}
			{/* 		xmlns="http://www.w3.org/2000/svg" */}
			{/* 		viewBox="0 0 512 512" */}
			{/* 	> */}
			{/* 		<path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" /> */}
			{/* 	</svg> */}
			{/* </div> */}
			<Row style={{ display: "inline-block" }}>
				<div style={{ position: "relative", marginBottom: "7.5rem" }}>
					{/* <HeartEmpty> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* </HeartEmpty> */}
					{/* <HeartFilled style={{ width: `${percentLeft}%` }}> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* 	<svg viewBox="0 0 25 25"> */}
					{/* 		<use xlinkHref="#heart" /> */}
					{/* 	</svg> */}
					{/* </HeartFilled> */}
				</div>
			</Row>
			{/* <Row> */}
			{/* 	<Value>{daysLived}</Value> */}
			{/* </Row> */}
			<Row>
				<Value>{daysLeft}</Value>
			</Row>
			<Row>
				<Value>{timeLeft}</Value>
			</Row>
		</Context>
	</div>
);

// Uberschit styles --------------------------------------------------------------
export const className = `
  top: ${settings.style.top}; 
  right: ${settings.style.right};
  left: ${settings.style.left};
  bottom: ${settings.style.bottom};
  width: 60%;
  box-sizing: border-box;
  margin: auto;
  font-family: Helvetica Neue;
  color: white;
  font-weight: 300;
  border-radius: 1px;
  text-align: justify;
  line-height: 1.75;
  text-align: center;
`;

const Context = styled("div")`
  margin: 0 auto;
  width: fit-content;

  svg {
    height: ${settings.style.heartSize};
    margin-bottom: 0.5rem;
  }
`;

const Row = styled("div")`
  font-size: 1.4rem;
  letter-spacing: 4px;
  font-family: "Playwrite HR Lijeva", cursive;
  font-optical-sizing: auto;
  font-weight: 800;
  font-style: normal;
`;

const Title = styled("span")``;

const Value = styled("span")`
  font-weight: bold;
  color: red;
`;

const HeartEmpty = styled("div")`
  color: ${settings.style.heartBackgroundColor};
  display: flex;

  svg {
    margin-right: 10px;

    &:last-child {
      margin-right: 0;
    }
  }
`;

const HeartFilled = styled("div")`
  position: absolute;
  display: flex;
  overflow: hidden;
  top: 0;
  left: 0;
  right: 0;
  color: ${settings.style.heartColor};

  svg {
    flex-shrink: 0;
    margin-right: 10px;

    &:last-child {
      margin-right: 0;
    }
  }
`;

// Private methods ------------------------------------------------------------
const MILLISECOND = 1000;
const MINUTE = MILLISECOND * 60;
const HOUR = MINUTE * 60;
const DAY = HOUR * 24;
const NUMBER_FORMAT = Intl.NumberFormat("en-US");

const calculateTime = () => {
	const death = new Date();
	death.setFullYear(settings.birthday.getFullYear() + settings.lifeExpectancy);
	death.setHours(0, 0, 0, 0); // ignore time part, or we won't get a countdown

	const millisecondsLived = Date.now() - settings.birthday;
	const millisecondsLeft = death - Date.now();
	const lifetimeMilliseconds =
		settings.lifeExpectancy * 1000 * 60 * 60 * 24 * 365;
	const percentLeft = (millisecondsLeft / lifetimeMilliseconds) * 100;

	const lived = calculateTimeRemaining(millisecondsLived);
	const left = calculateTimeRemaining(millisecondsLeft);

	return {
		daysLived: `You have lived ${lived.days} days.`,
		daysLeft: `Remaining ${left.days} days.`,
		timeLeft: `New day starts in ${left.hours} hour & ${left.minutes} minutes.`,
		percentLeft,
	};
};

const calculateTimeRemaining = (millisecondsRemaining) => {
	const days = NUMBER_FORMAT.format(Math.floor(millisecondsRemaining / DAY));
	const hours = formatTimePart(
		Math.floor((millisecondsRemaining % DAY) / HOUR),
	);
	const minutes = formatTimePart(
		Math.floor((millisecondsRemaining % HOUR) / MINUTE),
	);
	const seconds = formatTimePart(
		Math.floor((millisecondsRemaining % MINUTE) / MILLISECOND),
	);

	return { days, hours, minutes, seconds };
};

const formatTimePart = (timePart) => timePart.toString().padStart(2, "0");
