package com.naver.project;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.Scheduler;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class TimeQuartzMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Thread.interrupted();
			org.quartz.JobDetail job1 = JobBuilder.newJob(QuartzTestClass.class).withIdentity("dummyJob1", "group1").build();
			Scheduler scheduler = (new StdSchedulerFactory()).getScheduler();
			//6부터 23시까지 매 5분마다
			org.quartz.Trigger trigger1 = TriggerBuilder.newTrigger().withIdentity("dummyTrigger1", "group1").withSchedule(CronScheduleBuilder.cronSchedule("0 0/5 6-23 * * ?")).build();
			scheduler.scheduleJob(job1, trigger1);
			System.out.println("quartz Schedule Start");
			scheduler.start();
			System.out.println("quartz Schedule End");
		}
		catch(Exception e) {
			
		}
	}

}
