Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8F453D59
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 01:54:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv4G357Kcz2yPV
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 11:54:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OlMMolJY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=OlMMolJY; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv4Fz42dTz2xDd
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 11:54:45 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id v15so2427700ljc.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 16:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=snDMp8ZN3s27nOTtgVUn8ybkB3Bvg4gZKaPsrJWHRbk=;
 b=OlMMolJYTNTbimowEJBwIXsM2hkE8zuBCIaL3c27vgGJZiUCHRvEYjFmJ7zs8ehbdE
 8in3HLsYDWAu92XH0r3qVnDK9syG1QYqHsOegKznBn61kbfslpdic3UIzj3Eri1k1LEd
 LJfCukyCIKTzLkooMlkWGbanBbFWCb+4AMLkpPjD/ShbV229gdZtwsf+X7o08pzib3ln
 NuhOOxPqxuD8NeDaSKgN+t+gTTlyI4d34e1YlCubBNkDpQ7oxnjWizcrm4Wo9kO9Jzdj
 nbA7nL0qHcx5WqL5lL+DxDHjPv0XVwVi4jLnLHvkzDRJMj3xEvasp7nzYyf8cbSI8y+k
 ZiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=snDMp8ZN3s27nOTtgVUn8ybkB3Bvg4gZKaPsrJWHRbk=;
 b=35Hr0MMAk6sQe3RlyIxYEddsnbPQej9aBvkC623pPBawYpcqvZ09dy0zTRhhwh2qDY
 g9zkffYBR1snmODxdQdFVymlMGHuHIUY6ccL3IdUfFNsuBvODnlOWW1TY8ZOiDMJTTQ1
 TKVn1BB+6xXFjmYDtVs0Gaw+RSLzBcgQzx8HPhoqqEnU+IWJeLK52v0oHM3Ppqgo0zfN
 MaoiDPIaOgpAfEjeBnHp+Sy9udWQwYbDm2mUHnZMOOZW7locIsYHB6w9JHXvLPwRkSby
 Oi1G56rAT3KiVOXUC7sJENpxxAg3spYn7dA9Dc6T1Ad8izFUtnP3nsuelf8FHXvPMxbR
 nqYQ==
X-Gm-Message-State: AOAM533S8dUJErNn+THDb8KYPp6iZ7z8iMkEOvF/RlXlxXW7Cs2REx+B
 kutkOECIqWU3fAtIX5pRmw67geS9x4WpsrcxdDmWnw==
X-Google-Smtp-Source: ABdhPJxgbR1cXO3L2DOM57Wu1jDwVn1E8OE3f3aQh2y/6FXxrnWeLqKVMmV8xR4lZyXUddrt6XP9YjwkmTESnW7rbnE=
X-Received: by 2002:a05:651c:2dd:: with SMTP id
 f29mr3605808ljo.464.1637110475835; 
 Tue, 16 Nov 2021 16:54:35 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
 <4aa8906bdd429c878dd73139319e07f36ea584c2.camel@codeconstruct.com.au>
In-Reply-To: <4aa8906bdd429c878dd73139319e07f36ea584c2.camel@codeconstruct.com.au>
From: Oskar Senft <osk@google.com>
Date: Tue, 16 Nov 2021 19:54:20 -0500
Message-ID: <CABoTLcQ4VQCiEUyXtSQu-L4La=83btT4zB7iKBumtfH0V8eQpg@mail.gmail.com>
Subject: Re: vga_pw sysfs file
To: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
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
Cc: Ali El-Haj-Mahmoud <aaelhaj@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi

Jeremy, Thanks for the explanation!

I think the problem is that the gfx driver effectively changed the
semantic of the "vga_pw": In the past this was merely the contents of
said register. With the new driver, it claims to report "1" if the
host is driving the VGA, 0 otherwise. From what I can tell, it's not
possible to make such a statement just from the VGA scratch registers.
This is evident in that the uart_render_controller uses additional
signals (i.e. the "power" / run state of the host) to make a
determination on whether the host is driving VGA or not.

No that you mentioned it, I do remember from testing a couple of years
ago, that the register does not reliably return to 0 when the host is
rebooting.

With that, I suggest changing the gfx driver's "vga_pw" back to just
reporting the contents of the register and leaving it to a user space
process (like uart_render_controller) to use a variety of signals to
make a determination.

Joel, if I sent such a patch, would you accept that? If it's easier to
argue with the actual patch in hand, I'd be happy to prep it real
quick.

Thanks
Oskar.


On Tue, Nov 16, 2021 at 7:48 PM Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Oskar,
>
> I think Joel will send some details on the gfx driver side, but:
>
> > In uart_render_controller, however, we're checking whether the bottom
> > 8 bit equal to 0xa8 (why are we not checking for != 0 here?)
>
> This is because we want to ensure that we're in the init process of the
> host-side GPU driver, and not some arbitrary other access; it's been a
> while since working on this, but I *think* I remember seeing other areas
> of the scratch reg at non-zero values (granted, not the lower 8 bits
> though...).
>
> [There was some discussion with aspeed about the init value
> of 0x0 not being guaranteed on some part of the scratch register
> interface, but I don't recall what that applied to]
>
> We could change this to != 0, but there's a solid convention that the
> host-side driver is writing 0xa8 as the first part of init, so I think
> the current behaviour would provide a more solid check.
>
> Cheers,
>
>
> Jeremy
>
