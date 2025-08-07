import schedule;
import logging;
import traceback;
import from logging { Logger }
import from jivas.agent.action.action { Action }
import from jvserve.lib.agent_interface { do_pulse }

node PulseAction(Action) {
    # Registers a cron-like job to trigger agent actions on an interval.

    # set up logger
    static has logger:Logger = logging.getLogger(__name__);

    has enabled:bool = False;
    # schedule of cron jobs by action
    has config:dict = {
        # accepts key:value mappings as expressed below
        # (see https://schedule.readthedocs.io/en/stable/examples.html)

        # 'PulseAction' : 'every(5).seconds',
        # 'XYZAction': 'every(1).hour.until("2030-01-01 18:00")'
    };

    def on_register() {
        # need to make ctx transient since it messes with YAML export
        self.transient_attrs += ['ctx'];
        # set up the schedule based on the config
        self.init_schedule();
    }

    def on_deregister() {
        # cancel all jobs tagged by 'action'
        schedule.clear('pulse-actions');
    }

    def post_update() {
        # clear all scheduled items
        schedule.clear('pulse-actions');
        # re-init the schedule
        self.init_schedule();
    }

    def on_enable() {
        self.init_schedule();
    }

    def on_disable() {
        schedule.clear('pulse-actions');
    }

    def pulse() {
        self.logger.info('pulsing..');
    }

    def init_schedule() {
        # sets up all scheduled jobs based on schedule config
        for action_label in self.config.keys() {
            self.queue_action_pulse(action_label=action_label, interval=self.config[action_label]);
        }
    }

    def add_schedule(action_label:str, interval_spec:str) {
        # accepts the action and time interval spec (see https://schedule.readthedocs.io/en/stable/examples.html)
        # then prepares the queued job
        self.config[action_label] = interval_spec;
        self.init_schedule();
        self.get_agent().update();
    }

    def remove_schedule(action_label:str) {
        # accepts the action then removes the queued job
        if not self.has_schedule(action_label) {
            return;
        }
        # remove the job from the schedule
        del self.config[action_label];
        schedule.clear(action_label);
        self.get_agent().update();
    }

    def has_schedule(action_label:str) -> bool {
        # accepts the action then checks if the job exists
        if action_label in self.config {
            return True;
        }
        return False;
    }


    def queue_action_pulse(action_label:str, interval:str) {
        # accepts the action and time interval spec (see https://schedule.readthedocs.io/en/stable/examples.html)
        # then prepares the queued job
        try {
            # we'll need the agent_id of this action
            agent_id = self.get_agent().id;
            # we're using exec so it may get wild...
            # let's ensure we clear any preexisting jobs under the tag 'action_label'
            schedule.clear(action_label);
            # now, prepare the schedule statement
            exec_str = f'schedule.{interval}.do(do_pulse, "action_label={action_label}", "agent_id={agent_id}").tag("pulse-actions", "{action_label}")';
            # let errr rip..
            return exec(exec_str);
        } except Exception as e {
            self.logger.error(f"an exception occurred, {traceback.format_exc()}");
        }
    }

}