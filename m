Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9F64DD4AA
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 07:19:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKYkS5mynz30Mg
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 17:19:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VK1XyM14;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VK1XyM14; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKYkL40gvz306r
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Mar 2022 17:19:05 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id r1so5834703qvr.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Mar 2022 23:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mdtS4i3yY9UNNOjJROv83jggfwRN/yRDkWJuxc/obNE=;
 b=VK1XyM1461bgnDLYwq5WW39C4DA1YJKtE4R7hEKsgDcY2KpARw6EAR/kIwCsD+6cpz
 mB017TbaQqs+AOWXXXTawLEhwdOTRFIabU80XGkvukwlRwIavxYLNkusuiuYgvrAmm1I
 PerPiFbgrQGXXwAmQzj/7tIXZf1Ytj9tQ1Yr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdtS4i3yY9UNNOjJROv83jggfwRN/yRDkWJuxc/obNE=;
 b=LuNmjWC/bODFulOWGjgr/k5y7e8KlvGp7kGMHWzkHxDSuTnjL/KY2WsiUeiEUqjbeF
 pbC/W3M8WI3sIaSyXYFVuG56bNuVrpPyd2aZmfZw5a34mtwtQTCdCZv+PqXMUg5wDIoi
 nVbEitKzGCsMzSaYGUGK6ArSmYvIMzOTNlNquZ05yd/uoq6z0Y9h92n+KUEalMN1d48G
 YOW6mZLm9TsWPOfDCnaavyxuQYoFv2HN1seRsmEcmWV5XiCztAudViZl+SHyC+XFsQqv
 gsUk879Kl9f9O0oFxxnpXqbwLb6KtuKZvuOkxdLRrfercfddSddXusYDiU08eU8qwPX+
 h24w==
X-Gm-Message-State: AOAM53275KLhMGLHW8nhFOI18KBaNqb//GkKGipbtA2+xNu6gegcYS47
 BRyzhFZzuFudBC1YaaeUAakfzdE3Vya56flBbWs=
X-Google-Smtp-Source: ABdhPJxDDiTwL1J4WiCgUpWFC5w+o/LTsTpo9wXxAlaNierkjtHTP73dvxn7PsqnCUm9JvQztmVV+DKZs9+5Da/fAHM=
X-Received: by 2002:ad4:5fc5:0:b0:435:4420:d056 with SMTP id
 jq5-20020ad45fc5000000b004354420d056mr6090637qvb.130.1647584342048; Thu, 17
 Mar 2022 23:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220317191527.96237-1-singh.kuldeep87k@gmail.com>
 <20220317191527.96237-4-singh.kuldeep87k@gmail.com>
 <87h77wxslh.wl-maz@kernel.org>
 <20220317211024.GA99538@9a2d8922b8f1> <87fsngxnff.wl-maz@kernel.org>
In-Reply-To: <87fsngxnff.wl-maz@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Mar 2022 06:18:50 +0000
Message-ID: <CACPK8Xdv4bG=Haz5oe+gHotQ_B7=bMbZE3fNnHs-Ezy7Yje6Jg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: Remove arch timer clocks property
To: Marc Zyngier <maz@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 17 Mar 2022 at 21:46, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 17 Mar 2022 21:10:24 +0000,
> Kuldeep Singh <singh.kuldeep87k@gmail.com> wrote:

> > >
> > > >
> > > > Moreover, clocks also matches incorrectly with the regex pattern.
> > > > Remove this entry altogether to fix it.
> > > > 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >
> > > NAK. That's not a reason to randomly butcher things.
> >
> > I hope I explained my reasons above.
>
> My position on this sort of change remains. Blindly changing existing
> DTs based on a warning provided by a tool that totally ignores the
> reality of what is out there is not acceptable.

Thanks Marc for stating this. I share this view; we shouldn't go
around deleting parts of device trees for the sake of the bindings.
It's been happening across the tree, and I think it's to the detriment
of the supported hardware.

In the case of this particular change: I suspect this property was
there for early bringup, before the firmware was in place to configure
CNTFRQ. Looking back in time we had:

 clock-frequency = <25000000>;
 arm,cpu-registers-not-fw-configured;

I'm not sure why that changed from clock-frequency to clocks when the
device tree was mainlined.

That was bringup. These days, the vendor u-boot programs CNTFRQ with a
value for the system. This code is also in mainline u-boot, so as long
as you're running one of those firmwares the standard method will
work.

The qemu model also sets CNTFRQ, so loading the kernel without going
through u-boot will be fine there too.

Given that, I think we can go ahead with removing the property in this case.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I'll take the patch through my aspeed tree.

Cheers,

Joel
