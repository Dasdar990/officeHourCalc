import moment from "moment";

export function calculateExitTime(time1, time2) {
    const mTime1 = moment(time1);
    const mTime2 = moment(time2);

    const finalTime = mTime1.add(mTime2.hours(), 'hours').add(mTime2.minutes(), 'minutes');

    return finalTime.format('HH:mm');
}

