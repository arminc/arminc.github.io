---
title: Git svn and Ubuntu
layout: post
permalink: /2010/01/15/git-svn-and-ubuntu/
categories:
  - other
tags:
  - git
  - git-svn
  - svn
  - ubuntu
description: Recently I tried git on my machine and I must say I like it. But because a lot of other people are still using svn I tried to combine that.
---
Recently I tried git on my machine and I must say I like it. But because a lot of other people are still using svn I tried to combine that.

  
The reason I like git after only using it couple of days is that I have my own local repository where I can commit all my changes to without bugging other people with it. This way I can try out new things without causing problems to others. After some days or hours I can still synchronize my local repository with an online git or svn repository. I can synchronize all my changes like I committed them with git or I can squash all my changes to one commit.

First of all let's install git:

<pre>sudo aptitude install git-core git-svn
</pre>

Now lets import an existing svn project in to our own local git repository:

<pre>mkdir Something
cd Something
git svn init http://coralic.googlecode.com/svn/trunk/Beta-SMS
git svn fetch -r23
git svn rebase
</pre>

Now you are ready to use your git repository. If you wish to work with eclipse use this [plugin][1]{.broken_link}.

After you have made some changes to your local git repository you can commit those changes to your svn repository by doing this:

<pre>git svn dcommit
</pre>

Hope this helps out.

 [1]: http://www.eclipse.org/egit/install.php