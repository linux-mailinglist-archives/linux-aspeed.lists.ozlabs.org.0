Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7CD453D5D
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 01:57:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv4K85r5dz2yLJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 11:57:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FPC6eT+J;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FPC6eT+J; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv4K36p1vz2yP7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 11:57:27 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id p19so1014738qtw.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 16:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=igZHw2/KPf773jyJs0nwYbMJvZQMPAvr1iQZm1Zik+g=;
 b=FPC6eT+JsR4nqBuQQtnUe7WtTFXlThT8cisoi7Ty9aQr/aDIDzN1uo6D0iKD83Wv8B
 ljjbDPFvs9PBqyfD+PEW1tySRs9sop/HrUPW9JuAb0E+sXH59s7jWmgT/RV7az829jjT
 bvHo09wQw+k5VSjkr1e6iEKONzOsZUzetOpys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=igZHw2/KPf773jyJs0nwYbMJvZQMPAvr1iQZm1Zik+g=;
 b=HBqBhwpID+uleip6iHh9JNR9Tg3cn6PhQ4/MPX5II0ibpqgsMZFJOTUB7zG+xghpH5
 pH8wpfPSA6Y4OKwP/ZDtOXqR40DmaJ0qoDUM13ZIMDvfCIfrpipbRJu8RJsHDTV5uA1w
 ixSugi6tVS4DmiKhN5yZ+I77EmnwzIkpZ2WcDWthVynG694OkBV2V0OVWMgz+23FRcaN
 lMyeV2QOhq4Uq657n1UM1NYQnrCkrJ/XYDhwBbE/XH2/HI7ceKnPN8h05F4wirga2xFj
 czOMfsVKaSjLMowcsC9cY933DB+UEcg+WPvZDELBQGPDcxWPOZinrbLLN4zmP4k2g6Q2
 14mQ==
X-Gm-Message-State: AOAM5335buvg67n/3639uSUuhn9fnmg8gX+PcPU+NaR1QMpX0z5eiVrn
 km//STfF4iywsSTVkwyFGzzbLonBtF/1C6flPWo=
X-Google-Smtp-Source: ABdhPJx4QLlCO0hnrdrnma4LX1WgND7xJRHnMEv7+Au/F+AbZey7yQFT3NsUaYWtHwnU/Ahs0Fk+4Tlyhr0HJkCQQYg=
X-Received: by 2002:ac8:674a:: with SMTP id n10mr12287873qtp.145.1637110642851; 
 Tue, 16 Nov 2021 16:57:22 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
In-Reply-To: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Nov 2021 00:57:11 +0000
Message-ID: <CACPK8Xc_B4T-xAcQ7sSqOuVLpwBw69mmj7=5T_opr2AqUs7ThQ@mail.gmail.com>
Subject: Re: vga_pw sysfs file
To: Oskar Senft <osk@google.com>
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Oskar,

On Tue, 16 Nov 2021 at 14:40, Oskar Senft <osk@google.com> wrote:
>
> Hi everyone
>
> I'm currently upgrading from Linux kernel 4.10 to to 5.15 and found
> that uart_render_controller [1] can no longer detect whether the host
> is driving the Aspeed's VGA output.
>
> I tracked it down to a difference on how the VGA scratch register used
> to be read by aspeed-bmc-misc.c vs. how it's now read by the
> aspeed_gfx_drv.c driver:
> - In aspeed-bmc-misc.c we ended up with the full contents of SCU50 in sysfs.
> - With aspeed_gfx_drv.c we now only get bit 0 [2]. Unfortunately, at
> least in my BIOS, the VGA scratch register never has bit 0 set.
>
> In uart_render_controller, however, we're checking whether the bottom
> 8 bit equal to 0xa8 (why are we not checking for != 0 here?)

I think you found a mistake in the new sysfs file. I can't recall why
I masked the value the way I did.

> To restore the previous functionality, the "easiest" option might be
> to just return SCU50[31..0] as is, without trying to interpret it.

I think we will go with this option. This remains compatible with the
uart_render_controller code, which is our only known user of the file.

>
> Another option would be to check whether it's != 0  (instead of & ) -
> I think this would work in my example, too. If that's an option, I'll
> test it.
>
> For the check in [2], what BIOS was this tested with? Would a != 0
> check work there?

I would have tested it with a Power9 host, which doesn't run the BIOS
and relies on the "ast" DRM driver to perform the setup. Looking at
that driver it calls ast_open_key which writes 0xa8:

https://elixir.bootlin.com/linux/v5.15/source/drivers/gpu/drm/ast/ast_drv.h#L265

I suspect my testing was bad.

Thanks for investigating this. I'll send a patch to the kernel and if
you could test it that would be appreciated.

Cheers,

Joel
