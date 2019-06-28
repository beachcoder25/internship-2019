# What is Chef InSpec?

Chef InSpec is used to compare the *actual state* of a system with the *desired state* that we outline in our Chef InSpec code. It will detect violations of that symmetry, and display it's findings in a report.

## What is InSpec

InSpec is an open-source testing framework by Chef that enables us to specify compliance, security, and other policy requirements.


## How it works

Chef InSpec looks to take our system from an unknown state of compliance, to a detected state in which we understand the deficincies present keeping it from a desired state, to lastly correcting the system so it mirrors our desired state.

## Categorizing the severity of individual InSpec tests

There is an **impact** variable defined under each control (test), it is described as:

*impact is a string, or numeric that measures the importance of the compliance results. Valid strings for impact are none, low,* *medium, high, and critical. The values are based off CVSS 3.0. A numeric value must be between 0.0 and 1.0. The value ranges are:*
- *0.0 to <0.01 these are controls with no impact, they only provide information*
- *0.01 to <0.4 these are controls with low impact*
- *0.4 to <0.7 these are controls with medium impact*
- *0.7 to <0.9 these are controls with high impact*
- *0.9 to 1.0 these are critical controls*

# Chef->InSpec->Ansible

Chef uses cookbooks, which contain Gemfiles, these gems are installed via: 
```sh 
bundle install
kitchen init
```

This will create a `.kitchen.yml` file, ensure provisioner is set to:
```sh
provisioner:
     name: chef_zero
```

When you are looking to run multiple tests from a .kitchen.yml you will do so under you verifier section:
```sh
verifier:
  name: inspec
  sudo: true
  inspec_tests:
    - https://github.com/dev-sec/tests-os-hardening
```
When writing your own InSpec tests these tests can be combined to run together, allowing multiple tests to be ran per .rb file, simply append each test block of code to the file such as:

```sh
control 'os-01' do
  impact 1.0
  title 'Trusted hosts login'
  desc "hosts.equiv file is a weak implemenation of authentication. Disabling the hosts.equiv support helps to prevent users from subverting the system's normal access control mechanisms of the system."
  describe file('/etc/hosts.equiv') do
    it { should_not exist }
  end
end

control 'os-11' do
  impact 1.0
  title 'Protect log-directory'
  desc 'The log-directory /var/log should belong to root'
  describe file('/var/log') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    its(:group) { should match(/^root|syslog$/) }
  end
end
```

# Inspec tests against a container

Using SSH you can easily run an Inspec test against a container:
```sh
inspec exec trusted_hosts.rb -t ssh://root@172.17.0.6 --password 'root_password_here'
```
You can create reports in sevral different formats, including creating a text file:
```sh
inspec exec trusted_hosts.rb -t ssh://root@172.17.0.6 --password 'root_password_here' --reporter cli documentation:/tmp/output.txt
```
Example of that output:
```sh
  File /etc/hosts.equiv
  should not exist (FAILED - 1)

File /var/log
  should be directory
  should be owned by "root"
  group
    should match /^root|syslog$/

Failures:

  1) File /etc/hosts.equiv should not exist
    Failure/Error: DEFAULT_FAILURE_NOTIFIER = lambda { |failure, _opts| raise failure }
      expected File /etc/hosts.equiv not to exist
    # trusted_hosts.rb:6:in `block (3 levels) in load_with_context'

  Finished in 0.07743 seconds (files took 0.63915 seconds to load)
  4 examples, 1 failure

  Failed examples:

  rspec '/opt/chefdk/embedded/lib/ruby/gems/2.5.0/gems/inspec-2.2.70/lib/inspec/rule.rb[1:1]' # File /etc/hosts.equiv should not exist
```

## Setting up Chef .kitchen tests

You must add the ruby gem executable directory to your path:
```sh
export PATH=$PATH:/Users/your_user_name/.gem/ruby/2.3.0/bin
```

You must have your GemFile present,then you can run: 
```sh
bundle install --path /Users/your_user_name.gem/ruby/2.3.0/bin
```


# Good to knows

## InSpec

- Inspec tests are called a **control**
- Uses SSH and Win RM, InSpec requires no software to be installed on the target system
- You run InSpec remotely on your targets
- Regardless of the auomation used to build/provision (Such as Ansible) Chef InSpec can be used to verify configurations. The InSpec code will always be the same regardless of the provisioning service.
- **Formatting reports:** Including color coding for impact levels (Severity) for each test: <https://github.com/inspec/inspec/issues/532>
- **Custom report built off InSpec tests:** <https://discourse.chef.io/t/customise-testing-report/11722>

## .test.kitchen

- What is kitchen? <https://kitchen.ci/>
- Want to test compliance with a baseline? You can do this by defining compliance as shown here: 
```sh
suites: 
- name: ansible
  verifier: 
    inspec_tests:
      - test/integration/default
      - compliance: demo/linux_baseline
```
- Running InSpec tests against a client machine: <https://lollyrock.com/posts/inspec-windows/>
  - SSH into VirtualBox from Mac (Mimic testing on a client's machine): <https://www.youtube.com/watch?v=ErzhbUusgdI>

- Test kitchen is a test harness that automates the process of:
  - Creating a machine (Vagrant, Docker, etc)
  - Running configuration management code on that machine
  - Running tetst (Chef InSpec) on that machine
  - Destroying that machine


## Docker

 - **Attach volume to container, name it, and open interactie session:** If it is set up properly you should be able to add files to the directory on your local machine, and it will show up immediately in the directory on your container (/data in this example) 

```sh
docker run -it --name <container_alias> -v ~/Desktop/chef_data:/data <image_name> bash
```

-  **Keep container running, even if exited:** Use -td
```sh
docker run -td chef_image
```

# Related tutorials

- **Testing with InSpec:** <http://www.anniehedgie.com/inspec-basics-1>

- **Testing Servers with InSpec and Test Kitchen** <https://mkdev.me/en/posts/testing-servers-with-inspec-and-test-kitchen>

- **Testing from control to target:** <https://learn.chef.io/modules/try-inspec#/>

- **Use InSpec to detect potential compliance and security issues:** <https://learn.chef.io/tracks/compliance-automation/>

- **Custom report built off InSpec tests:** <https://discourse.chef.io/t/customise-testing-report/11722>

- **Docker and Chef:** <https://supermarket.chef.io/cookbooks/docker>