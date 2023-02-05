# Run.Ai event-router
This repo is a wrapper chart of [kubernetes-event-exporter](https://github.com/resmoio/kubernetes-event-exporter) open source project configured specifically to trigger alerts from Run.Ai cluster. 

> **Note**: Event router currently is configured out of the box only for parsing Run.ai scheduler events to slack

## Configure slack notifications
### Create your `values.yaml` in order to configure the chart.
```yaml
runaiProjects: 
  - my_runai_project

slack:
  enabled: true
  apiToken: ""
  channel: ""
```

`runaiProjects` - Projects listed here will set notifications

**slack**

`enabled` - Enable slack integration

`apiToken` - Slack bot token, configured with '**chat:write**'
permissions.
To create a Slack App follow: [guide to creating Slack apps with bot tokens](https://api.slack.com/authentication/basics). 

`channel` - A destination channel **'runai-notifications'** a direct message '**@bob.marly**' or dynamic by setting '**pod-project**'.

> If the value is of `channel` is set to pod-project, the event router will try to send the notification by tagging '**@project**' where project is taken from the 'project' label attached to your pod by runai.

### Deploy the chart
After configuring the values file you can run the following command in order to deploy the chart:
```sh
helm install  
``` 