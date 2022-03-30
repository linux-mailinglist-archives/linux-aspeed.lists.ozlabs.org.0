Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960CA4ECE52
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 23:02:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTJmZ2yf2z302c
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 08:02:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SNWLGTFn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1129;
 helo=mail-yw1-x1129.google.com; envelope-from=aaelhaj@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=SNWLGTFn; dkim-atps=neutral
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTJmS1T5Fz2x9S
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Mar 2022 08:02:47 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2eafabbc80aso17509067b3.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MbZG5js3SjuYDgIQ/rADqgEQMKAPej/0O54S775Z4KI=;
 b=SNWLGTFnQR0rE/xA/VKCskcrwkPzx9QHG6Hh8+yibtoaCRqfbscfzjvOY8elo2I5U5
 sEfh9BYsLLcRWyg0i6oQyPTKY6QASg/TED0vja+fUOSUi1q0jtJPXnk6uf471fRsMYOi
 gqXEWqzktP8fH+u6wNP+30KP7LctbuOq8fK5xejm1N7uupCw+X9+tMPfDsSXmyXCAUKL
 g0ihZwAL0BiP0bcqPbqPCc3+gVEBC6blOlDz7/OM1Wnt3wP012HvZNG+lG3Fbid05iYR
 9XunF+U7Z2TMLsVNcysjZxbDITpTIHTfRdh55OHbon/2/h5WnWvwN3tJxsR+skFXGkNr
 wUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MbZG5js3SjuYDgIQ/rADqgEQMKAPej/0O54S775Z4KI=;
 b=zvWkDANsEh9ol8OEkWOdjxXo/BES068TgeqM9qj9whwotuwK1KlQkjElryg2i1DaHY
 9aZ3dPurvyaJpGCcotcbgVU5MkV6zY/lenLVIHYR7axGJnr5Zn42+toYfX/PeENUH019
 qvbM4fFrn1QDkyzHlXhrEYGK56KLZ/WdKqUAbPH6qgrOLLSsxWJ/RnZuDI9VBtNmvcld
 pL6wVKuT0ledo9Cc9tJ0VVzGc+mbenL2pqE8bQxLmk8py0lEPMHayMqd7EpTGH0rOyC6
 zgjQVC+gNijtUuyIv5e1O4RR9xEYTWvWxnJdqGTYyr6g7zG+0UHAEOr48QXnWUWnBIUA
 WfXg==
X-Gm-Message-State: AOAM533Cb1Oi6rKBHWXNBhPu8mGGB3OQiewWHlVqGloqbuZXazLjgYl8
 K3BpUgZrFaClFnSGk9Cll2/W7To+b9FMAXjjGVsAgPhwFvpibbt+
X-Google-Smtp-Source: ABdhPJxVhoeJXYiez0xGq0KxMuDhwyMU8p1YxLWgAloE9hCCTcrUK7FOIEF30bZCARU47pSan6vHRxK4QybHahDIpDQ=
X-Received: by 2002:a81:3dcd:0:b0:2ea:949b:a5d9 with SMTP id
 k196-20020a813dcd000000b002ea949ba5d9mr1812854ywa.465.1648674163431; Wed, 30
 Mar 2022 14:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPZpNbNc5Fx1tBtmM1x0n-qEB_qp+wSSrR2+_0bxPrPyh1xMw@mail.gmail.com>
 <c29de2ea-0f60-4e7f-8308-11849a7de8e8@www.fastmail.com>
 <CAFPZpNZ1+UDVcEs_gp1zCzxXfP6PqZ8kx+UGhb73BusiScRk+g@mail.gmail.com>
 <a509d7a3-2551-4eea-b965-9499ada39b16@www.fastmail.com>
In-Reply-To: <a509d7a3-2551-4eea-b965-9499ada39b16@www.fastmail.com>
From: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Date: Wed, 30 Mar 2022 17:02:17 -0400
Message-ID: <CAFPZpNb4fNF-QgQrWLeSkN9TjYsWZvH1YrbQj66rBW6jn8rCug@mail.gmail.com>
Subject: Re: aspeed2500 SPI1 control at run-time with OpenBMC
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Oskar Senft <osk@google.com>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

I'm testing with pinmux-select/debugfs at initially to understand how
this is supposed to work.

I have a local patch to let pinctrl driver modify SCU70[13:12]:
https://github.com/aaelhaj/linux/commit/732342c55876fb81bd02828b4530ee28158b5c96

The desired state is that SPI1 is by default in passthru so that the
host can boot. I'd like to switch it to be connected to the BMC only
when updating the host BIOS (while the host is switched off).

Testing with:

&spi1 {
status = "okay";
pinctrl-names = "default";
pinctrl-0 = <&pinctrl_spi1_default>;
}

I would assume this means SPI1 would be connected to BMC (SCU70[13:12]
= 0x1), which is indeed the case. After rebooting the system:
$ echo $(( ($(devmem 0x1e6e2070 32) >> 12) & 0x3 ))
1

I can flash a new host BIOS:
$ grep -xl pnor /sys/class/mtd/*/name
/sys/class/mtd/mtd6/name
$ dd if=bios.bin of=/dev/mtd6

I can also switch the pinmux-select to SPI1PASSTHRU to boot the host
with the new BIOS:
$ echo SPI1PASSTHRU SPI1PASSTHRU >
/sys/kernel/debug/pinctrl/1e6e2080.pinctrl-aspeed-g5-pinctrl/pinmux-select
$ echo $(( ($(devmem 0x1e6e2070 32) >> 12) & 0x3 ))
3

So at least I know that I can switch the state of SPI1 control using
pinmux-select/debugfs when it starts connected to the BMC by default.

However, the other way around doesn't work. If I have this config:

&spi1 {
status = "okay";
pinctrl-names = "default";
pinctrl-0 = <&pinctrl_spi1passthru_default>;
};

I would assume this should have SPI1 in passthru mode connected to the
host (SCU70[13:12] = 0x3), which is indeed the case:

$ echo $(( ($(devmem 0x1e6e2070 32) >> 12) & 0x3 ))
3

The host boots by default, which is again the desired behavior. I can
switch SPI1 control to master through pinmux-select:
$ echo SPI1 SPI1 >
/sys/kernel/debug/pinctrl/1e6e2080.pinctrl-aspeed-g5-pinctrl/pinmux-select
$ echo $(( ($(devmem 0x1e6e2070 32) >> 12) & 0x3 ))
1

However, I cannot access the device. '/dev/mtd6' doesn't exist, and I
cannot bind it:
$  echo 1e630000.spi >/sys/bus/platform/drivers/aspeed-smc/bind
-sh: echo: write error: No such file or directory

I'm probably missing something obvious but not sure what.
Thanks again, and sorry for the long winded reply.

On Tue, Mar 29, 2022 at 10:08 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 30 Mar 2022, at 04:27, Ali El-Haj-Mahmoud wrote:
> > Thanks for the reply Andrew.
> >
> >> Not explicitly as I mentioned. You're also going to run into the
> >> constraints here:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c?h=v5.17#n2739
> >>
> >> Fundamentally that needs to be changed. We could do something like have
> >> it default to pass-through unless a driver is bound.
> >
> > Could you please elaborate on this a bit? I'm way out of my depth here
> > and would appreciate any additional pointers.
> >
> > I already ran into the read-only constraints in the pinctrl driver,
> > and I have a patch that excludes SCU70[13:12], but that wasn't enough.
>
> What were you doing to test it?
