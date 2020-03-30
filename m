Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B139C197EB2
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Mar 2020 16:43:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rZvy686QzDqcP
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Mar 2020 01:43:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FTWBKZRr; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rZvm49nqzDq6q
 for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Mar 2020 01:43:26 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id q188so19134489qke.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Mar 2020 07:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xd6A0GRMLxn1sVuQYx0dEBJI+Khi8SI9odnvPdKtNY=;
 b=FTWBKZRrTY7rIbYSEHIeQyYd/hQy3dy/WbWyJ53h/4ujanI+6I4pNvflj4owXW+N04
 oC6K/P4sqqCc/rguk39sjD6Fe5JiZYEAmdN2yn7pLjnLMJG+7oXjPdhOSoYQ+BvIgGSM
 Q4zAdxPn0RxAhmdoTAD9wcqQpEFkw9pguzEkYkDNcrFIoiY1vaEx+WXbddFH3HBYL/ho
 bTBWu7Pe2G5jWxzJCENHqVLB+mdO/sowRNWHrr1OyMBa3i1p+v2MUTw0gxLC9i1/5x2i
 cH+W4uQdJ2OkSYQdUzFJ4YrM8q1ygoKxpscSWbMkUfCR7uidpixhz5ymo5nDFILSERbJ
 cqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xd6A0GRMLxn1sVuQYx0dEBJI+Khi8SI9odnvPdKtNY=;
 b=F9yteNfysWAoSdZI4hpJjrK21jwiWbbHrR6q3Y3HXt/BRrm04+6mr8or8YIEcJQ53P
 GMDqS2eejoURFoFILpozdNzZJA/wlKlGqoNCVl9CZvpOW2EPSsLV5so/KFhNHpHVxfNw
 NFkVBd0kCwQ7JkeWsg2HV5TsKFaTpBB0xPwD9efrToyC4pAVOIHnKHFbnzIAyHNvN7qU
 eFNWSJ1UnBrnL3iUX+7erZ9qnaLVCO3+djNsZ9geG/PoakrLIbVudDpT+dIoY3v54lu5
 9OljlO0kPBsvkLL46ElOdmCK/sBwKt9Xd5t+UTpY4qKCcOXvEEtiptloUbraZDPFcqMw
 jreQ==
X-Gm-Message-State: ANhLgQ0IzV/tUBy8yOK5pKW/slKHQnRz8ZPX+T1QYQtaOYtYQfotK6lv
 +cMnGWIrzwS8QT3igFsC6jVWWLbvxApbPe4eM+cIlg==
X-Google-Smtp-Source: ADFU+vuymU3G8a3jV7LmEUAfjyIdqXBPWPBMl5AwN06QHiZOh2xfhQmjAC1mgENLp2N8QlZhOnnv8bbgUHqtFsBLWsU=
X-Received: by 2002:a37:a93:: with SMTP id 141mr303468qkk.244.1585579402278;
 Mon, 30 Mar 2020 07:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <BL0PR06MB45481A385F546CF5B6855C16E5CA0@BL0PR06MB4548.namprd06.prod.outlook.com>
 <d694432d-a3f2-4aa1-b9ee-f99f18ee2d99@www.fastmail.com>
In-Reply-To: <d694432d-a3f2-4aa1-b9ee-f99f18ee2d99@www.fastmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 30 Mar 2020 07:43:11 -0700
Message-ID: <CAO=notwsjF3fVhY6gFVqsxTXYs=D7LHoOUDhcHSJLzRrsA7rGw@mail.gmail.com>
Subject: Re: [Bug Report] soc/aspeed: integer error in
 aspeed_p2a_region_acquire
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Changming Liu <liu.changm@northeastern.edu>,
 "yaohway@gmail.com" <yaohway@gmail.com>, "Lu, Long" <l.lu@northeastern.edu>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Mar 29, 2020 at 5:37 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi Changming Liu,
>
> I've added Patrick to the thread, who authored the driver.
>
> On Mon, 30 Mar 2020, at 06:07, Changming Liu wrote:
> > Hi Joel and Andrew,
> >
> > Greetings, I'm a first year PhD student who is interested in the usage
> > of UBSan in the linux kernel, and with some experiments I found that in
> > drivers/soc/aspeed/aspeed-p2a-ctrl.c function
> > aspeed_p2a_region_acquire, there is an unsigned integer error which
> > might cause unexpected behavior.
> >
> > More specifically, the map structure, after the execution of
> > copy_from_user at line 180 in function aspeed_p2a_ioctl, is filled with
> > data from user space.  So the code at line 136 that is
> >
> > end = map->addr + (map->length - 1);
> >
> > the subtraction could underflow when map->length equals zero, also,
> > this sum could overflow. As a consequence, the check at line 149 could
> > be bypassed and the following code could be executed.
> >
> > Although the fact that map->addr is a 64-bit unsigned integer and
> > map->length is 32-bit makes the overflow less likely to happen, it
> > seems doesn't eliminate the possibility entirely. I guess a access_ok
> > could do?

I'll take a look, but certainly adding a 32-bit value to a 64-bit
value has the possibility of overflow given a contrived attack
scenario.

> >
> > Due to the lack of knowledge of the interaction between this module and
> > the user space, I'm not able to assess if this is security-related
> > problem. I'd appreciate it very much to hear your valuable opinion on
> > why this could not cause any trouble if it's indeed the case, this will
> > help me under linux and UBSAN a lot! and I'm more than happy to provide
> > more information if needed.
>
> It's certainly not expected behaviour and should be fixed :) We need to check
> if the `end` calculation overflowed, but not using `access_ok()`, as the value of
> `end` is an address in the physical address space of the SoC.
>
> The current behaviour does have a security impact, though probably not in
> the way you're expecting, as the driver itself is a means to violate the SoC's
> security. The SoC is a BMC and exposes several PCIe devices to its host
> (a VGA graphics device and a "BMC" device). Both devices expose
> functionality that allows the host to perform arbitrary reads and writes to the
> BMC's physical address space _if_ the BMC has allowed it to do so. This
> driver controls whether the capability is exposed to the host (disabling
> denies the read capability) and what regions of the SoC's physical address
> space can be written. Regions are roughly broken up into memory-mapped
> flash, BMC MMIO, BMC RAM and BMC LPC host controller.
>
> Practically, enabling any region for write is to some degree unsafe: for instance
> exposing the BMC's RAM to writes doesn't in any way restrict what areas of RAM
> can be written, allowing e.g. arbitrary code injection into the kernel or running
> processes on the BMC. Enabling writes to the BMC MMIO region allows arbitrary
> control of the BMC and its peripherals without having to gain code-execution
> (including escalating by removing write protection for other regions).
>
> The driver exists to assist a trusted firmware update process used on some
> platforms where the host can request (e.g. via IPMI) that BMC RAM be made
> writable, then drop its firmware update payload into a predetermined location
> in physical memory, and finally complete the transfer by requesting that RAM
> region be returned to at least read-only mode.
>
> To unlock unexpected regions of the BMC's address space in this scenario the
> host would also have to exploit IPMI to craft an ioctl() payload with the properties
> to trigger the overflow. Given that it already has complete write access to RAM it
> may be easier to just exploit the BMC kernel directly rather than chain an exploit
> through at least one other userspace process.
>
> Anyway, enough background :) Thanks for the bug report and for analyzing the
> driver. Hopefully Patrick can take a look and cook up a fix.

Yeah, this driver was deliberately written to enable accessing the
memory regions controlled by the BMC, opening a security hole in the
BMC.  It's part of the design.

>
> Andrew
