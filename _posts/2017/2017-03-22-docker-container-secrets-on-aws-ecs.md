---
title: Docker container secrets on AWS ECS
layout: post
permalink: /2017/03/22/docker-container-secrets-on-aws-ecs/
categories:
  - docker
tags:
  - secrets
  - docker
  - cloud
description: Easy way to use Docker container secrets on AWS ECS
---
Original post can be found at [Xebia][1]

Almost every application needs some kind of a secret or secrets to do it's work. There are all kind of ways to provide this to the containers but it all comes down to the following five:

1. Save the secrets inside the image
2. Provide the secrets trough ENV variables
3. Provide the secrets trough volume mounts
4. Use a secrets encryption file
5. Use a secrets store

For a complete description and an explanation please see the [following post][2]

Depending on your context all five options might work or are considered good enough. In my opinion to do it right and be safe, flexibel and in control you can only go for option 5 "Secrets store". Choosing this method it leaves you with different ways to accomplish this. As stated in the [post above][2] it comes down to this:

1. Use some form of S3, with or without encryption. For more [info see][3]
2. [HashiCorp Vault][4]

AWS has released a service called Parameter Store, although it is not as sophisticated as Vault it serves a purpose. If you are starting or want to keep things simpel please try using the [Parameter Store][5].  But if you need full control and want more flexibility then go ahead and use Vault.

***Parameter Store

Parameter Store allows you to store key value data in a key value store with the values encrypted using KMS. Because Parameter Store uses IAM it is a great fit for AWS ECS because you can control the access to the secrets per container.

I could explain how to do this but luckily AWS has a great post on how this should be done, [you can find it here][6]

The blog post is great but I am not really impressed with the run.sh script in which I am replacing the secrets and fetching them with aws cli. There has to be a better and cleaner way....

I really thought so but we could not find any, so we chose to create one.

***Dockerfy

Without trying to invent the wheel again we took the simpel but useful app "dockerfy" and extended it. More information on [Dockerfy can be found here][7]. Dockerfy already handles ENV's and secret files, and it uses templating for simpel usage of secrets.

Sadly it did not have a AWS Parameter Store integration but we took care of that, [as you can see in this PR][8]

You can use the Parameter Store and combine it with Dockerfy features to add your secrets using a template but if you need a simpel command-line secret, here is an example.

**Dockerfile:**
{% highlight bash %}FROM socialcode/nginx-with-dockerfy
ENTRYPOINT [ "dockerfy", "--aws-secret-prefix", "PROD_" -- ]
CMD [ "/bin/echo", "{{ AWS_Secret.db_password }}" ]
{% endhighlight %}

To use the above Docker container, store a password in the Parameter Store called "PROD_db_password". Then provide the AWS keys or run it on an EC2 instance or an ECS service with proper IAM rights and see the secret being echoed.

 [1]: http://blog.xebia.com/docker-container-secrets-aws-ecs/
 [2]: https://elasticcompute.io/2016/01/21/runtime-secrets-with-docker-containers
 [3]: https://aws.amazon.com/blogs/security/how-to-manage-secrets-for-amazon-ec2-container-service-based-applications-by-using-amazon-s3-and-docker
 [4]: https://www.vaultproject.io/
 [5]: https://aws.amazon.com/ec2/systems-manager/parameter-store
 [6]: https://aws.amazon.com/blogs/compute/managing-secrets-for-amazon-ecs-applications-using-parameter-store-and-iam-roles-for-tasks
 [7]: https://github.com/SocialCodeInc/dockerfy
 [8]: https://github.com/SocialCodeInc/dockerfy/pull/4