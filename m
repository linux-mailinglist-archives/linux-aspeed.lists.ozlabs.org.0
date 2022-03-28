Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354F94E95DE
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 13:55:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRrjV07gwz3c1r
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 22:55:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OBOwZMzg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=ansuelsmth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OBOwZMzg; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRrjQ1Y5lz2xSN;
 Mon, 28 Mar 2022 22:55:06 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id g20so16597498edw.6;
 Mon, 28 Mar 2022 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VBA2TVvDQq46dU+vDSFsKIjMbNiJuAyL+n01cA7mLg0=;
 b=OBOwZMzgqbA4Bri1W+TQyb45lBR8NViCvJYDlk5rJZKcVaCgWCV40Bf7Mv/7s4LQTo
 o61uoNoV320FDfTmAXy0OyXXsM6xbZnily3YKTr/Pe7gWFLFh2fymA9CCUGhWiDEZlLZ
 nNwep3nx1H6RuXTTVxqC1Ux9vx68yHHOYmvP8HexVe79FWRO9Iu3fNpeAYkfW2JkM+Vt
 qrh2k9qqmA2fYydHCfMeMdCIwVVoaxO4gxjQE8JAPqhrWkQW+6YiB4qavu4HrF1R3jtl
 KNxBJkSRciGcZ0Vf/9M87/6ctraLnA19Hi8Jr/TqhQEfd0ot10wekX5HmOo9zLRLpGu/
 NhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VBA2TVvDQq46dU+vDSFsKIjMbNiJuAyL+n01cA7mLg0=;
 b=voMFk52OSOlFq+R0Vz7RtQ+MenY+cMsYaZ8FyC0hDk7XtY7B/RgNB3Qdw1GcHPuP7/
 Kb6dYxLz0EHY9b8pD5oT7w73m2bTmbjeA1uCfaHvB0/gxwz4KofLDNvtMhAeuDIQxjsU
 nXzAFaN5pB76UKVN5XjfPCXyCyNEiP4xPv5TmO9WXK2WxMRbPtdsji8ouQUf0XbAuNY+
 9lIKGNF4QNFjM4c+59XN3Ju4rsSFAZJLm5fSSqRTn6ePtdfWX64CEtfR4IjHpfNKEljZ
 9lU9aOq3VcaomRvK0ugmAWOkHo/neDRPiEWYUucEtr5GV+4qMWcYFuEF68o5bZjE2pBI
 PGoA==
X-Gm-Message-State: AOAM530Jzj+f3KWym1VCbCmmqkZ3hocHT7LkFq1atP6s88I3zYXvYHUI
 CdXuil6e21ijK6m5Nd3ql40=
X-Google-Smtp-Source: ABdhPJxl9m+FiC/OJjd+DqfT2L64nZ1Oy+3md9ABQHlV5EJnd26lo+025HjOApFZeOymI3r2eMPv3w==
X-Received: by 2002:a05:6402:1718:b0:419:564:6b62 with SMTP id
 y24-20020a056402171800b0041905646b62mr15482099edu.361.1648468502610; 
 Mon, 28 Mar 2022 04:55:02 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 nb6-20020a1709071c8600b006e02910f818sm5859904ejc.157.2022.03.28.04.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:55:02 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:55:01 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <YkGiFa9DSKpsSZou@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <20220328082858.GJ7371@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328082858.GJ7371@axis.com>
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
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@axis.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
 "linux-unisoc@lists.infradead.org" <linux-unisoc@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Mar 28, 2022 at 10:28:58AM +0200, Jesper Nilsson wrote:
> Hi Ansuel,
> 
> On Mon, Mar 28, 2022 at 02:09:15AM +0200, Ansuel Smith wrote:
> > - Categorize every dts in arm directory in subdirectory
> > - Fix Makefile to address for the arm subdirectory
> > - Fix any arm64 dependency
> > [...]
> >  arch/arm/boot/dts/axix/Makefile               |    3 +
> >  .../boot/dts/{ => axix}/artpec6-devboard.dts  |    0
> >  arch/arm/boot/dts/{ => axix}/artpec6.dtsi     |    0
> 
> All ARTPEC platforms should be in a directory called "axis".
> Otherwise LGTM.
> 
> Thanks!
> 
> /^JN - Jesper Nilsson
> -- 
>                Jesper Nilsson -- jesper.nilsson@axis.com

Will do the change! Noted.

-- 
	Ansuel
