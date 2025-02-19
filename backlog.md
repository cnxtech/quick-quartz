- Simplify schema 
    - get rid of `schedName` from PKs
    - reorder to make `jobGroup` | `triggerGroup` the leading key component
    - prune indexes
- Storing jobs
    - handle the replace param when storing 
    - test with payloads on the triggers instead of on the job
- Acquiring triggers
    - ignore maxCount param when acquiring triggers?
- Pause/Shutdown
    - com.salesforce.zero.quickquartz.QuickQuartz.schedulerPaused
    - com.salesforce.zero.quickquartz.QuickQuartz.shutdown
    - filter out paused jobGroups/triggerGroups when acquiring next triggers
    - ^ requires a place to remember when a jobGroup/triggerGroup is paused
- Stats (by tenant/jobType)
    - jobs scheduled
    - triggers acquired
    - triggers executed