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
