{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "dlz-prod",
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::726935236963:root"
    },
    "Action": "events:PutEvents",
    "Resource": "arn:aws:events:us-east-1:832921726877:event-bus/default"
  }, {
    "Sid": "ilz-prod",
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::726255067814:root"
    },
    "Action": "events:PutEvents",
    "Resource": "arn:aws:events:us-east-1:832921726877:event-bus/default"
  }, {
    "Sid": "ifs-prod",
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::951909296574:root"
    },
    "Action": "events:PutEvents",
    "Resource": "arn:aws:events:us-east-1:832921726877:event-bus/default"
  }, {
    "Sid": "gsct-prod",
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::775380324830:root"
    },
    "Action": "events:PutEvents",
    "Resource": "arn:aws:events:us-east-1:832921726877:event-bus/default"
  }]
}


use this below piece for that.
Explanation:
The Principal is set to * (any entity) because we’re using a condition to filter access.
The aws:PrincipalOrgID condition ensures that only accounts in the specified AWS Organization (with ID o-xxxxxxxxxx) can assume the role.


{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "AllowAWS2Org",
    "Effect": "Allow",
    "Principal": "*",
    "Action": "events:PutEvents",
    "Resource": "arn:aws:events:us-east-1:832921726877:event-bus/default",
    "Condition": {
      "StringEquals": {
        "aws:PrincipalOrgID": "o-xxxxxxxxxx"  // Replace with your AWS Organization ID
      }
    }
  }]
}

