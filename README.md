# A simple cli WEBSERVER parser

When you want to see a web server's details, Like which pages have how many viewers and how many unique viewers, you can easily use this CLI.

You can use this CLI very easily.

## Instructor

1. In the first step, you have to clone the project on your machine. for cloning the project, you can use this command:

    `git clone github_address`

2. Go to the directory of the project.

3. Install some requirement gems. But before that, I have to mention that I'm using ruby version `2.7.1`.
Install gems with this command: `bundle install`

And it's ready to use.

# Usage

The CLI details:

```

  Command:
    parser parser

  Usage:
    parser parser

  Description:
    Webserver Log Parser

  Options:
    --file-path=VALUE                 # path to the log file, default: "webserver.log"
    --uniq=VALUE                      # sort base on uniq views, default: "false"
    --help, -h                        # Print this help
```

To load a web server log, you can use this command:
`./bin/parser parser --file-path='web server file path'`

I'm using a default log file in the project directory. to see the default web server log file details, you don't need to send any file path in your command line:
`./bin/parser parser`

if you call this command, you'll see these results:
```
 /about/2                       | Views: 90       | Uniq Views: 22
 /contact                       | Views: 89       | Uniq Views: 23
 /index                         | Views: 82       | Uniq Views: 23
 /about                         | Views: 81       | Uniq Views: 21
 /help_page/1                   | Views: 80       | Uniq Views: 23
 /home                          | Views: 78       | Uniq Views: 23
```

You can see all of the viewer counts for a specific page in the' Views' section. In the `Uniq Views` area, you'll see the unique viewers of a particular page. For example, you can see how many users visit that page.

We're sorting the resulting base on all of the viewers, but you can sort the resulting base on Uniq Viewers too.
for sorting based on Uniq Viewers, you can use this command:

`./bin/parser -p --uniq=true`

this command will return these results:

```

 /help_page/1                   | Views: 80       | Uniq Views: 23
 /contact                       | Views: 89       | Uniq Views: 23
 /home                          | Views: 78       | Uniq Views: 23
 /index                         | Views: 82       | Uniq Views: 23
 /about/2                       | Views: 90       | Uniq Views: 22
 /about                         | Views: 81       | Uniq Views: 21
```

you can send multiple arguments to this command, and it'll consider all of them together:

`./bin/parser parser --file-path='web server file path' --uniq=true`

## TODO

- [ ] Research about using ElasticSearch and Regex to make the process faster.
- [ ] Add a Validation to make sure the web server log file has the correct format.
- [ ] Get the list of IPs that viewed a specific page.
- [ ] Get the list of pages that an IP looks at it.
