Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98923445E99
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 04:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlmFk3lLpz2yb9
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 14:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bFpgSBej;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=bFpgSBej; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlmFd5Yzfz2xXP
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 14:29:07 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id s24so12788044lji.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 20:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EFhEGzd3uyu/upM/gXOMVH8uE8syXTQEP3bcTaF1vUM=;
 b=bFpgSBejwW0dhsvKWz/Gl9WyeQUV8bS0IHfmuMBgavQbazBkcpoUljvn3agruMgs1T
 MJocHOk2gCyW1AdFDJRJU94NZZlWyYl9EQCs4fWJBesThZelQAKraLpiPXXQKp8Jmd6S
 YdUxo3nem1UNKZVeplLWCJnicWwKSh7vc7WZ06aNc1bO7j7WXUCGqLHK7t6UfVsWGoR2
 pmKSsGFj1fzvzmW4XBb3kLmXMJ5DDpglzWqOG2kRDTTEahKZDQCu1MQGytLrzES4ZULa
 XK2z7oWBVQqbdk1sYiXtKg5cEkipLSLgcKOn4e1NUvoRztIaC5MXUjj0WWkKuqII8p3L
 2HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFhEGzd3uyu/upM/gXOMVH8uE8syXTQEP3bcTaF1vUM=;
 b=8Ed8NSQqc+zseS4b5GSlw+t3WcZx5jT+HPymGHGXs/MTqF7JCy9MiGRNlPNKAMEPeg
 4kGxBRfiy5KKr5ZOCcpJElilSpAghtqTJACA2fXy2zZgDf+vcEStHJtZdSTt5bf021U9
 Y3sjg45VUyPdtrBxKlYTPIgetUKuVmNUgYDeEBqKPh4zprhWnB0Pycevav0nmznE5ACm
 ojeacF9+8fXL0VCDYF3q31IMbdDVriKsqBjhnQa1LOgH+B6Ecp8FjaU0rtalzTiECxA5
 jSCh0ulv4GyVbGQFAEncC1geJ7PrtSglxZB+MFqOFhTo1onMe52pumvKbKsnTYhuvXgl
 9llQ==
X-Gm-Message-State: AOAM531OUYnL186KVncVBc5nrkA2LKlR993TSW13uhKeInH7RXzrvedy
 5zwsafYBbLAtaKRL1zcnIdrQwznJxrPtxv7A2WMedQ==
X-Google-Smtp-Source: ABdhPJz8qB4ZfOYpsc8hKtslo4tMCaACoDrduKl98yH+ZHvuxpZdu3mSg4Uekql9oE5ax3BjnenSvSAjQ71zsofqEuo=
X-Received: by 2002:a05:651c:1784:: with SMTP id
 bn4mr59884622ljb.521.1636082939433; 
 Thu, 04 Nov 2021 20:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211105005955.107419-1-osk@google.com>
 <CACPK8XcXR=V5-Q+sC4MniNJZJgvbiysFD-5yu6v30_2BwDRTSA@mail.gmail.com>
 <CABoTLcS=s0XuM9jiisYW3=1gXtiwP8WeopqTOeBwnTX1XCky9Q@mail.gmail.com>
 <CACPK8XebNsSr3wiMdMxDwQuMGX3p0g2Kid91dekUc6TGcHqfYQ@mail.gmail.com>
In-Reply-To: <CACPK8XebNsSr3wiMdMxDwQuMGX3p0g2Kid91dekUc6TGcHqfYQ@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 4 Nov 2021 23:28:43 -0400
Message-ID: <CABoTLcTb5uGABwe9FG4haj1888NA4mdZqJFTeQcSotBnq1aZVg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
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
Cc: Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel

> I test the kernels independently of yocto; I recommend doing that with
> a cross compiler when submitting patches upstream. My flow looks like
> this:
> [...]
> A few notes:
>  - I use the cross compiler from my distro. Debian unstable has GCC
> 11.2.0, which is the same as openbmc. You can use the compiler from
> your openbmc build tree if you aren't able to install a modern
> compiler
I couldn't figure out how to use the compiler from the OpenBMC tree.
The biggest issue is that it has "openbmc" in its name and Linux build
was getting confused by it. I gave up on that approach and found how
to install the right cross compiler in our environment. That worked
well. Thanks for the hints!

>  - building with -s means warnings stand out
Excellent idea, thank you!

>  - if you're working on device trees and want to ensure your binary is
> being built each time, omit the -s and build the 'dtbs' target
Ack.

I'll send a PATCH v3 now.

Oskar.
