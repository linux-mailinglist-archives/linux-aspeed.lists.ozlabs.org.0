Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3AC442DBA
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 13:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk8Dw1DsJz2yQL
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 23:22:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gqgGeoKV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gqgGeoKV; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk8Dm4MD8z2xXr
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 23:22:47 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id i13so620590qvm.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 02 Nov 2021 05:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=524j3weIMUBYVohdC3QFfF1dIv9YteXIYBPPUPdtNZI=;
 b=gqgGeoKVcua9Eja33WGYMqhcVmZEluUj9WI0JxTO7JMhAdAoofYhm2DMUWOe17ogJR
 YDX/jP/LWDCq+gD2PsifYEkFXkAqj0TeWKjv8g6eL6UYjeUQ2IKoeMYqLuBZ42U5I4I0
 9YB2oOvhoBqvmDTHilv2hZdUT3u4Y+g1fFuYD5iKP41w6fXEFPbl5sF8HIK/+vQs53+v
 0hBOnuLTxg8XM4uvOOUvZEi5uUXE3Hs4IZPwaSGA5KLogHVkP//DzKiN2RrQd5AG2pyB
 u6hD3gNXIdU8EP/PVBGUbxmjidwtSM1TwsATBbtAriVFXAIbYgDbWGHxuaIa8AtPdR2j
 DpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=524j3weIMUBYVohdC3QFfF1dIv9YteXIYBPPUPdtNZI=;
 b=K9J+CchAPEqx7bAMyiBhcRzTmooEB32QOjsv9+FE81WoWBP9PJCOln7Dg3LSjrMHX4
 tXcCswddLSn4smeRTX5bqJ41ft8U9uFDNg1XHqYsYWM7cJg1PC1UshoeeF+mlWZd1DUc
 0sSF6bZf+i8PiSgKV3+Kdrje3LT5LjUwyyD+dUR3AVDqclkeIXIJalRksoXtVkQy2zRh
 4jfzS/jP7mG2NlW9aWnQcg18LCjPpW3Vjy2ONc3FomWhrihjq4/SB4LcAMf3MhsLpdv7
 ThZl9EDswAQZbQhfrUtFqMQJSz8TgXSKmoQE3FynlR2FjTnCGfQKF4xLbVwJWYbMGP6f
 07/A==
X-Gm-Message-State: AOAM530C9i0wjFMPa5Bh7o1fiUpTeHk+Kkw0rMiPxqlm0i0VnIXvZS5x
 8ULw4gP+vEvlgyMeeDQNoQ==
X-Google-Smtp-Source: ABdhPJwC+GW2Z14j8Ar7+l/yPNFCH4WawZMyhX5wmqOW3DdYy7QDet5X850by09ALefKzmA4gePHeQ==
X-Received: by 2002:a05:6214:2584:: with SMTP id
 fq4mr17116466qvb.53.1635855764249; 
 Tue, 02 Nov 2021 05:22:44 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id i11sm48290qtq.44.2021.11.02.05.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:22:43 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:b4e0:932d:f90c:fafb])
 by serve.minyard.net (Postfix) with ESMTPSA id C9A0B1800BA;
 Tue,  2 Nov 2021 12:22:42 +0000 (UTC)
Date: Tue, 2 Nov 2021 07:22:41 -0500
From: Corey Minyard <minyard@acm.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH -next 0/4] Add LCLK control into Aspeed LPC sub drivers
Message-ID: <20211102122241.GK4667@minyard.net>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <CACPK8XfBi+jY5ftLqsEVXHe01SQBNpTSwo+WtXN3=YUQnXACtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfBi+jY5ftLqsEVXHe01SQBNpTSwo+WtXN3=YUQnXACtw@mail.gmail.com>
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
Reply-To: minyard@acm.org
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Zev Weiss <zev@bewilderbeest.net>, Rob Herring <robh+dt@kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Cedric Le Goater <clg@kaod.org>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Nov 01, 2021 at 11:36:38PM +0000, Joel Stanley wrote:
> On Mon, 1 Nov 2021 at 23:18, <jae.hyun.yoo@intel.com> wrote:
> >
> > From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >
> > Hello all,
> >
> > This series is for appliying below fix to all Aspped LPC sub drivers.
> > https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/
> >
> > An LPC sub driver can be enabled without using the lpc-ctrl driver or it
> > can be registered ahead of lpc-ctrl depends on each system configuration and
> > this difference introduces that LPC can be enabled without heart beating of
> > LCLK so it causes improper handling on host interrupts when the host sends
> > interrupts in that time frame. Then kernel eventually forcibly disables the
> > interrupt with dumping stack and printing a 'nobody cared this irq' message
> > out.
> >
> > To prevent this issue, all LPC sub drivers should enable LCLK individually
> > so this patch adds clock control logic into the remaining Aspeed LPC sub
> > drivers.
> 
> Thanks for sending this out!
> 
> This will resolve a few of the issues we have in the issue tracker:
> 
> https://github.com/openbmc/linux/issues/210
> https://github.com/openbmc/linux/issues/130
> 
> The patches look good to me. I think you've just missed Corey's PR for
> v5.16, but I will stick them in the openbmc tree once they've had a
> review.

We can still get them in to 5.16 if it's important for that; this is a
bug fix, after all, and it's early.  I just need to know the urgency.

Get the Reviewed-by's in and add the bindings and I can get it into the
next tree for a bit, then I can submit.  We may be in rc1 by then, but
that's ok.

-corey

> 
> Cheers,
> 
> Joel
> 
> >
> > Please review this series.
> >
> > Thanks,
> > Jae
> >
> > Jae Hyun Yoo (4):
> >   ARM: dts: aspeed: add LCLK setting into LPC IBT node
> >   ipmi: bt: add clock control logic
> >   ARM: dts: aspeed: add LCLK setting into LPC KCS nodes
> >   ipmi: kcs_bmc_aspeed: add clock control logic
> >
> >  arch/arm/boot/dts/aspeed-g4.dtsi   |  1 +
> >  arch/arm/boot/dts/aspeed-g5.dtsi   |  5 +++++
> >  arch/arm/boot/dts/aspeed-g6.dtsi   |  5 +++++
> >  drivers/char/ipmi/bt-bmc.c         | 24 ++++++++++++++++++++++-
> >  drivers/char/ipmi/kcs_bmc_aspeed.c | 31 ++++++++++++++++++++++++++----
> >  5 files changed, 61 insertions(+), 5 deletions(-)
> >
> > --
> > 2.25.1
> >
