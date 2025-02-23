---
author: mbailey
comments: true
date: 2012-06-15 04:48:11+00:00

slug: ec2-outage-pimp-my-fail
title: 'EC2 Outage: Pimp my Fail'
wordpress_id: 454
categories:
- amazon
- cloud
- ec2
- heroku
---

Amazon are reporting degraded performance for some volumes in a single AZ in
the us-east-1 region.

[![AWS Service Health Dashboard](../../../assets/2012-06-15-ec2-outage-pimp-my-fail/AWS-Service-Health-Dashboard-Jun-14-2012-1.jpg)](http://status.aws.amazon.com/)

Twitter has lit up with complaints. An amusing one referred to "[Amazons
Elastic SLA](https://twitter.com/#!/search/elastic%20sla)". Overheard in the
office "The Cloud's down! Does that mean it's sunny?"


## Fire Drill for the Cloud or You're Doing it Wrong

Some pretty high profile websites are timing out which seems to indicate we're
not the only ones to have failed to take advantage of the high availability
made possible by the AWS service stack.

More concerning though is the lack of design effort put into their error pages.

[![Heroku Gateway Timeout](../../../assets/2012-06-15-ec2-outage-pimp-my-fail/heroku-504-Gateway-Time-out-1.jpg)]()

[![Quora Error](../../../assets/2012-06-15-ec2-outage-pimp-my-fail/quora.com_.jpg)](http://www.quora.com/)


## Take a Lesson from the Masters

GitHub put the fun back into fail, like the sound effects on TV's Funniest Home Videos.
[![GitHub 404](../../../assets/2012-06-15-ec2-outage-pimp-my-fail/404.jpg)](https://github.com/504.html)

My all time favourite 404 page captures the awkward embarrassment on an unsatisfiable request.

[![Visit Steve 404](../../../assets/2012-06-15-ec2-outage-pimp-my-fail/visit-steve-404.jpg)](http://visitsteve.com/404.html)
