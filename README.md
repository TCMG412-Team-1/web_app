# web_app

## Installation

Note: If you have Knife configured, and you have used cookbooks in the past, you can skip all this. Just clone the cookbook and run it on a node.

### Local-mode
clone this cookbook into a linux machine with `chef-client` installed and run
```ruby
chef-client --local-mode run_list ['web_app']
```

## As a node
### Getting the cookbook
1. create a directory and choose a name. I will call it `chef`.
2. Create a `cookbooks/` directory and a `.chef/` directory, both within `chef/`.
3. clone the [project-5-cookbook](https://github.com/TCMG412-Team-1/project-5-cookbook) into `cookbooks/`
You can now move on to configuring Knife. If knife is already configured with a Chef Server, you can move on to `Applying Configuration`

### Configure Knife
Knife needs to be configured to connect to the Chef server. If you have already connected
to a chef server, you can skip to the next step.

1. visit [Hosted Chef](https://getchef.opscode.com/signup) and sign up. Chef server should generate a `knife.rb` file, and a `.pem` file. Save these files to `chef/.chef/`

You should now be able to connect to your Chef server with knife commands.

Note: If you are using Amazon AWS, follow the next step to configure the `knife-ec2` gem

#### Configure Knife-ec2
Visit the [Knife-ec2](https://github.com/chef/knife-ec2) github page for documentation on how to install.
```ruby
gem install knife-ec2
```
should do the trick, but if it doesn't read the documentation at the github repo.
This gem is required for communicating with AWS

After you have the gem installed, visit AWS IAM management console to create an access key. ([guide](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html))
This will give you 2 keys:
1. an `aws access key id`
2. an `aws secret access key`
Add the following lines to your `chef/.chef/knife.rb` file
```ruby
knife[:aws_access_key_id] = "Access Key ID"
knife[:aws_secret_access_key] = "Secret Access Key"
```
You should now be able to configure AWS EC2 instances with Chef

### Applying Configuration
Now you have knife configured with your Chef Server. Your `chef/` directory (or whatever you chose to name it) should look about like this:
![Chef](http://i.imgur.com/H9DuUns.png)
Note: If you are using Git or any other version control, you will want to ignore your `.chef` directory, because it has private keys. You can do that by putting
```
.chef
```
in your `.gitignore` file

Now you can upload your cookbook to your Chef Server. From within the `web_app` directory. run
```shell
berks install
```
and
```shell
berks upload
```
(If `berks upload` didn't work, try `knife upload web_app` from the `cookbook` directory.)

You can now bootstrap your node with the following command:
```shell
knife bootstrap EC2-IP-ADDRESS --ssh-gateway EC2-GATEWAY --ssh-user USER --sudo --identity-file ~/.ssh/IDENTITY-KEY.pem --node-name NODE-NAME --run-list 'recipe[web_app]'
```
Replace the value with your own. You can find the IP and Gateway on your AWS console, and the identity file is given to you when you start the EC2. You can choose the node name. The default username on ubuntu EC2 is `ubuntu`, but it could be different for you.

### Updating the Node
Apparently you can update your cookbook on your workstation, upload it to the Chef Server with `berks upload`, and then run the following command to update your node:
```shell
knife ssh 'name:NODE-NAME' 'sudo chef-client' --ssh-user USER --identity-file ~/.ssh/IDENTITY-FILE.pem --attribute ipaddress
```