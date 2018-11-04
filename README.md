# temper

A small utility to show presentation in a shell

> It is pretty basic as of now

## Usage

```
$ sh temper.sh template_file
```
**[OR]**
```
Copy to a location in path then just use
$ temper template_file
```

## Defining content

`We use a template file to give the content! ( how sweet )`

So the template file was a big file with multiple `titles` and `description`

It is arranges down in the order of they appear ( `title1` `description1` `title2` `description2`)

A title is specified with a hash at the begining and the description is given as the text following it.
All the text that follows it until the next heading is considered as a part of the previous header.

# Requirements

* figlet - for beautified heading
* lolcat - to color stuff

## Screenshot
![screenshot](http://i.imgur.com/izg7YJp.png)

## TODO

- [ ] Center content by fetching width and height from shell
- [ ] Basic markdown support. Bold, underline etc...
