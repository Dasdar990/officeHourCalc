<template>
  <div class="w-full flex justify-center">
    <div class="flex gap-8 flex-col w-full min-h-4/5	max-w-[800px] bg-black rounded-lg m-3 p-5 text-white">
      <div class="flex justify-between">
        <h4 class="text-[#FF513C]">Office hour calculator</h4>
        <MdiIcon class="cursor-pointer" icon="mdiRotateLeft" @click="resetTimes"/>
      </div>
      <div class="flex flex-col items-end gap-4">
        <h2>Exit time</h2>
        <h1 v-if="calculatedExitTime">{{ calculatedExitTime }}</h1>
        <h2 v-else>The result will appear here...</h2>
      </div>
      <div class="flex flex-col md:flex-row gap-4 md:gap-10">
        <TimeInput ref="timeInput1"  v-model="entranceTime" labelText="Entrance Time"/>
        <TimeInput ref="timeInput2"  v-model="hoursWorked" labelText="Hours Worked" defaultHours="08"
                   defaultMinutes="45"/>
      </div>
    </div>
  </div>
</template>

<script>

import {calculateExitTime} from "assets/js/timeCalc.ts";
import moment from "moment";

export default {
  data() {
    return {
      entranceTime: '',
      hoursWorked: '',
    }
  },
  methods: {
    resetTimes() {
      Object.keys(this.$refs).forEach(ref => {this.$refs[ref].resetFields()});
    }
  },
  computed: {
    calculatedExitTime() {
      if (this.entranceTime !== '') {
        if (this.hoursWorked === '') {
          const defaultWorkingTime = moment().hours(Number(8)).minutes(Number(45)).seconds(0);
          return calculateExitTime(this.entranceTime, defaultWorkingTime);
        }
        return calculateExitTime(this.entranceTime, this.hoursWorked);
      }
    },
  }
}
</script>