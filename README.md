# What?

It's a small rofi script which provides spell checking. If you accept one of the options presented, it will copy the word to your clipboard.

With the exhilarating power of spellcheck...
![rofithing](https://user-images.githubusercontent.com/425547/209489594-40219ab9-416f-48e4-bd50-338310e402f5.gif)
Anything is possible!

# Why?

Because I'm Canadian and never sure what flavour/flavor of spelling rules applies, and bad enough at spelling that I'm paranoid whenever I want to type a word with an *-ance* or an *-ence* in it.

This script is very useful if you, like me, are sick of using google for spellchecking just because it's the fastest thing available.

I had this idea years ago, but the opportunity cost was always higher than writing this. That was until I switched to using the [Kagi search engine](https://kagi.com) which, at time of writing (Christmas Day 2022), doesn't do a great job of indicating when it's corrected your spelling making it unsuitable for the task *(and I'm just lazy enough that opening up a non-default search engine is enough to push this project over the annoyance threshold)*

The future is now!

# How?

It uses the spell checking front end `enchant-2` internally. If there's some interest, I may make it fall back gracefully to aspell or anything else that supports 

It also uses `wl-clipboard` for copying to the clipboard. Obviously this doesn't work on X11 and I'll need to adapt this script to X11 soon as I still run i3 on some systems.

# Okay but actually how do I use it?

Download the `rofi-spellcheck.sh` file. Give it execution permissions and put it somewhere on your PATH so that rofi can find it when starting.

Then add it to your rofi configuration as a script mode, or bind it to a hotkey as a one-off invocation:

## Example one-off invocation
```bash
$ rofi -show spell -modes "spell:rofi-spellcheck.sh"
```

## Example configuration mode line
```css
configuration {
    modes: "run,drun,spell:rofi-spellcheck.sh";
    font: "mono 12";
    ...
}
```
