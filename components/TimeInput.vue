<template>
  <div class="flex flex-col">
    <div class="flex items-end gap-2">
      <h2>{{ labelText }}</h2>
    </div>
    <div class="flex gap-4 items-center" @input="emitTimeInput">
      <input class="py-2 bg-black border-white text-xl" @focus="$event.target.select()" v-model="hours" type="number"
             pattern="[0-9]*" inputmode="numeric" placeholder="hh" min="0" max="24">
      <h2 class="mx-1">:</h2>
      <input class="py-2 bg-black border-white text-xl" @focus="$event.target.select()" min="0" max="60"
             v-model="minutes" type="number" pattern="[0-9]*" inputmode="numeric" placeholder="mm">
    </div>
  </div>
</template>

<script>
import moment from "moment";

export default {
  data() {
    return {
      hours: '',
      minutes: ''
    };
  },
  mounted() {
    if (this.defaultHours) this.hours = this.defaultHours;
    if (this.defaultMinutes) this.minutes = this.defaultMinutes;
  },
  methods: {
    resetFields() {
      this.hours = this.defaultHours ?? '';
      this.minutes = this.defaultMinutes ?? '';
    },
    emitTimeInput() {
      this.hours = this.hours.toString().padStart(2, '0');
      this.minutes = this.minutes.toString().padStart(2, '0');

      if (this.hours < 0 || this.hours > 24) {
        this.hours = this.defaultHours ?? 0;
      }
      if (this.minutes < 0 || this.minutes > 59) {
        this.minutes = this.defaultMinutes ?? 0;
      }
      const momentTime = moment().hours(Number(this.hours)).minutes(Number(this.minutes)).seconds(0);
      this.$emit('update:modelValue', momentTime);
    }
  },
  props: ['labelText', 'defaultHours', 'defaultMinutes']
};
</script>