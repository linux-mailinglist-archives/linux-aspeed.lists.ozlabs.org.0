Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D22D07CB
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 09:06:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4yJ38RtzDqLr
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 18:06:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pr9ZefvN"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46p4y94bcDzDqJq
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2019 18:06:25 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id w2so1276890qkf.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Oct 2019 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5C/Xf1z5fv/jAWW18gGeEsLNpV/wFOp2/29F3EEqfg0=;
 b=pr9ZefvNrZzWlSPXS1uPnFLw0XgUsDn2NHHSi05YOoYQlSmYgsGak49kvskwFuaUWL
 bEmKr3f8Tbzk2SN+9cUE7gzsH0iBLO0UL1TWIu7LzCa3qmFEUxit5T+Rh0eidUiiNDRL
 z2bo/nDDZghCtmnmR9xf1xnfvoXMWbIDDz+03uNvcMCs85RqE4aPp20lpOdNr42vclW1
 LqGnA86Z1ZONhGB0L02omNPWzRYhF9/9BS1lWZhii5uB0Psf0M/86SIqJkN6alB/eG0Z
 V3wkucc50tce1f4gSeToM+JLuQl0XTC58VHVM+WSoi/iG8x4jsfSzh56t3pJGKKWQB8L
 Gwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5C/Xf1z5fv/jAWW18gGeEsLNpV/wFOp2/29F3EEqfg0=;
 b=bywTe5c+3SNUfNEe/08JJAqBA3lwAIyEdfxZEdhrabaKDu0ZLBEZ+I9/CzYigWJ6Tp
 eWSRsG2GZTuZsmKu7qTNUy31c1mXU0pNHEJ2tdo2EQ4KrKyBfMM0Ox4E1DYf6RjmoVi7
 s6aIDaAYuZiktkjY95nvCWdBJuMgJEjCX+rq4rufgZGQSM3oZNA1DZXMe4ctYJ5pufAZ
 KtAZtiNAAWW/DK2LbNKijBqWmMoCxLBaBQ4vRbG5UhEaXX1BJB0v/Ybrjr5whAIKT3t/
 QBP8RT7qmfwxtPIXQA2uSqHZ8w8CCL1zlCVMKt0SNdXRYY5tSKAek8u3c4UZLhnWEtk4
 GJzg==
X-Gm-Message-State: APjAAAXDvF1HSU8C7jbKXHFIYaqjJF0rw03GGr4rYImB7MWhJKQj4Srf
 6XX/kod1SnOviurvDiqGoQ2EPwI1f04UU2dZ+ggwUw==
X-Google-Smtp-Source: APXvYqylNOfk/dos/exZnKXlWoreP++MXYFAIrR4wt0A9XzOtsfvMXZmWSYRHCMG6UDz7YnDt4skePhaA+VTUd5MXMw=
X-Received: by 2002:a05:620a:2158:: with SMTP id
 m24mr2244333qkm.250.1570604780965; 
 Wed, 09 Oct 2019 00:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
 <CACPK8XcaAa8aRjqV+vYzh71KMp6hEwLi+qV6bcQUC5xATm0zzg@mail.gmail.com>
In-Reply-To: <CACPK8XcaAa8aRjqV+vYzh71KMp6hEwLi+qV6bcQUC5xATm0zzg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 9 Oct 2019 09:06:09 +0200
Message-ID: <CACT4Y+ZXaz31ktL3XBAb+rVXrGw9+nujC0+kUU6fRin-rGXcuA@mail.gmail.com>
Subject: Re: i2c-aspeed testing with kunit fake and syzkaller
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Wolfram Sang <wsa@the-dreams.de>, Brendan Higgins <brendanhiggins@google.com>,
 syzkaller <syzkaller@googlegroups.com>, linux-i2c@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 9, 2019 at 8:48 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 8 Oct 2019 at 14:44, Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > Hi i2c/aspeed-related people,
> >
> > Some time ago Brendan and myself did an experiment of testing the
> > i2c-aspeed driver in a qemu VM (without any hardware/emulation) using
> > kunit-based fake hardware. The fake allowed us to get 10 i2c devices
> > successfully probe and appear in /dev/. Which in turn allowed us to
> > test the actual driver with syzkaller.
> > I will just leave here some details and traces as FYI and for future
> > reference. I think this is an important precedent in general.
>
> Wow, this is extensive. It will take me some time to digest it.
>
> Thanks for sending it along.
>
> Cheers,
>
> Joel
>
>
> >
> > The kernel branch is here:
> > https://github.com/dvyukov/linux/commits/kunit-i2c-stub2
> > This is one of kunit branches with this commit on top:
> > https://github.com/dvyukov/linux/commit/c9c1706611fdc49679c5bf5bff1e147ab7c7aa79
> > This contains lots of hacks to get the fake working on x86 and leave
> > persistent devices initialized (rather than shutdown them after
> > unit-testing).

One thing I should have pointed to is the actual "hardware fake":
https://github.com/dvyukov/linux/blob/d154ffa80dff44c8b941814d700b22e6cf4c23c2/drivers/i2c/busses/i2c-aspeed-fake.c

Brendan, in this mode kunit prints whole lot of messages re
missed/failed expectations, etc. It probably should have a special
mode for platform mock when it does not bother about expectations, at
least doesn't print anything.

> > This is the kernel config:
> > https://gist.githubusercontent.com/dvyukov/72a31dad43b5687e6ffdcdb4cb342175/raw/24b706326e2d9202789fece5bfc17355aadda411/gistfile1.txt
> > (some i2c configs + a bunch of debugging configs).
> >
> > If you boot this kernel with the config in qemu, you should see /dev/i2c-{0,10}.
> >
> > Probably any syzkaller commit will work, but I just testing on this one:
> > https://github.com/google/syzkaller/tree/2ab6c4a4571d4170b0009a5b14b9789b016814b6
> > Here is syzkaller config I used:
> > https://gist.githubusercontent.com/dvyukov/d0a3c0e9b44cc7d445b36a8a50404ed8/raw/5f6aab34c6515cc4e96dac6cf3a98aaaf5e21b58/gistfile1.txt
> >
> > Here is kernel coverage we achieved as the result of fuzzing:
> > https://drive.google.com/file/d/1JdNshmCWI3crJ3BuVo6uvRuHMBrwH5eB/view?usp=sharing
> >
> > For crashes, I've got 3 different task hangs:
> >
> > INFO: task hung in i2c_transfer
> > https://gist.githubusercontent.com/dvyukov/25e98a59b643bc868c7489f566ed9eab/raw/67b717488ae9af381a5b0615e5ddf2d226369d3c/gistfile1.txt
> >
> > INFO: task hung in i2c_smbus_xfer
> > https://gist.githubusercontent.com/dvyukov/7ca87fea1b397d46e3393227a34595b9/raw/f5385f025abfc3ad2e91fd4f2616e58c7de8804e/gistfile1.txt
> >
> > INFO: task hung in aspeed_i2c_master_xfer
> > https://gist.githubusercontent.com/dvyukov/dbc51e3ea7034f255c8fd1c99965d91a/raw/a5165e4e6c3b41d593d02fc22996104e468cfab3/gistfile1.txt
> >
> > And some memory corruptions (non-thread-safe kunit data structures?):
> >
> > KASAN: use-after-free Read in aspeed_i2c_fake_write_command_reg
> > https://gist.githubusercontent.com/dvyukov/6ca5bca5cf7a40a93636360635a4672c/raw/5ad0e7b33907f4b0db102b74c2a11237df612462/gistfile1.txt
> >
> > KASAN: use-after-free Read in __of_find_property
> > https://gist.githubusercontent.com/dvyukov/95ed93a39d38fd215c141b58e5d3ec0f/raw/ea7f2346982a31ab16fca2850f91e1ef11faf687/gistfile1.txt
> >
> > general protection fault in mock_do_expect
> > https://gist.githubusercontent.com/dvyukov/8c2e3def6775d39cb7496b56a77cbcd8/raw/5778337009e21397b484aafe5b24c87ebe64b63f/gistfile1.txt
> >
> > There are probably a number of things that can be improved in kunit
> > platform mock, the fake driver and syzkaller i2c coverage, but this is
> > a starting point.
> >
> > Thanks
