Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17F443B25
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 02:52:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkVCH1Trvz2xBl
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 12:52:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n0H27rJw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n0H27rJw; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkVC815kPz2xBl
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 12:52:33 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id a24so1122736qvb.5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 02 Nov 2021 18:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=W2HU4w7GnhKTte65isyHpt7yAXFNwuaPGGZjXYZzIto=;
 b=n0H27rJwgjdtjio7lxmzwV+ku2ClAqJg7OCr/K1KcAj+6e/BCrGJwbWJu43YR3BQI2
 3ZPoZhGZ7jA/GKubBzn5kbMELmhasgtMfCf/7JXMgtEJdAtaxoA8zt6sspI1czgw3Vzy
 3kgcg6ERstIMCbGylbyonfNK+UUj5e5yx/dgWyf2InCX1hJJ+RXqCJimBw2hiIDUcxDb
 GDf/MUV7rQThVUC6nfMGGUJX0Q+VZk7gdMeW3ELI8aqpJsN/y9ashfXGqWm84zuqmCLe
 IqvyrIO9boJcz+t603XxmJWkl38M9civl35afuasHfx7b3IDkqWv/AyysASTfbAwMxuU
 +1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=W2HU4w7GnhKTte65isyHpt7yAXFNwuaPGGZjXYZzIto=;
 b=ySFdg3bRmQZwYv+I7iRwBYTsEvMe+Z5dWkOuvukILZ4BvX3Prn2etPDhh55rvQaYu2
 18FfSNUVf+2WoDPugkAJ9saVzYtVrd6OJfCHDc2RcRN4Lbz6Zx7wDYzOAyCF/zP3ncOv
 lX4SNlT0ArbLomJzGfPPDupgB0SXyAHL6KNkzLVGKgEt6U44Sq1mUITBHlvFDrlsiEmn
 WCl68H4+ZJkno72ITjEtqHPz8WQzyWmFz78qCXSHv11+uhlvz0bqrKL23DqomttGpbKZ
 RHxcX5wuR/karekswLHqWeQPHnKtIrEbT3igd9tuwF4m7ViMirkxurSwZ0Krdvtt9Gqm
 A/kA==
X-Gm-Message-State: AOAM532ox4DMRtkpZsEtGV4cuiqurcEQ7hIZo2D4Me7hi8WMN0iSc19T
 0KhVvjZT3InBTl8ZI/ljqg==
X-Google-Smtp-Source: ABdhPJxAZb3DCF8bmbLHwMF6GRKQh7wEROD8SIINO6DSBkTwPrzFSqU3DONEfQuaeO92GHCycangsA==
X-Received: by 2002:ac8:5745:: with SMTP id 5mr18639476qtx.37.1635904350437;
 Tue, 02 Nov 2021 18:52:30 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id o10sm596759qtx.43.2021.11.02.18.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 18:52:30 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:b4e0:932d:f90c:fafb])
 by serve.minyard.net (Postfix) with ESMTPSA id 009481800B9;
 Wed,  3 Nov 2021 01:52:28 +0000 (UTC)
Date: Tue, 2 Nov 2021 20:52:27 -0500
From: Corey Minyard <minyard@acm.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH -next v2 5/6] dt-bindings: ipmi: aspeed,kcs-bmc: add
 'clocks' as a required property
Message-ID: <20211103015227.GO4667@minyard.net>
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
 <20211102203717.96794-6-jae.hyun.yoo@intel.com>
 <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 jae.hyun.yoo@intel.com, openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 02, 2021 at 08:20:37PM -0500, Rob Herring wrote:
> On Tue, 02 Nov 2021 13:37:16 -0700, jae.hyun.yoo@intel.com wrote:
> > From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > 
> > Add 'clocks' as a required property.
> > 
> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > ---
> > v1 -> v2:
> > Changes sinve v1:
> >  - Added 'clocks' property into kcs-bmc bindings using
> >    'aspeed,ast2400-kcs-bmc.yaml' because it's not merged into
> >    'aspeed-lpc.yaml' yet. The bindings merging could be done using a
> >    separate patch later.
> > 
> >  .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml   | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1549943
> 

From the code, I think this change will break all these platforms, as
the initialization of kcs will fail without the clock property.  I'm
going to pull this out until it gets sorted out.

Also, could you rebase on the latest kernel when submitting next time?
There was a minor thing I had to fix up.

-corey

> 
> kcs@114: 'clocks' is a required property
> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
> 
> kcs@24: 'clocks' is a required property
> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> 
> kcs@28: 'clocks' is a required property
> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
> 
> kcs@2c: 'clocks' is a required property
> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
> 
