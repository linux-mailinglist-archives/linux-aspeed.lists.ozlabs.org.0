Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372C4ECF34
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 23:56:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTKxx2wL9z2ymq
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 08:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=axis-central1 header.b=dK0NkDNI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axis.com (client-ip=195.60.68.18; helo=smtp2.axis.com;
 envelope-from=jesper.nilsson@axis.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=dK0NkDNI; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Mon, 28 Mar 2022 19:30:07 AEDT
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRm8v3TNdz2xts;
 Mon, 28 Mar 2022 19:30:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1648456208;
 x=1679992208; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6lodqU722XqqMCnjzMd3/cpwy1KHIQLMRjx1NSCdEKA=;
 b=dK0NkDNIrE+1O1Mr6UHChku4GO1I8+QNjRKCSdMBzYDCBIo8jD2EcKqa
 MbrwOk5EwyMQZmga5eBqxqdLtzBsN0o7D+4YCB7Gp8TTGw0FEhC8zFWFI
 dSduFBklVQ4xJThQbSNCaC8TlJ4NIchnQf2BANEr8lZ02NJZlH1JYOTva
 pdVgIoTx/umKDQ6MAffb9e47m0fx74YMfO+wrFknWVFtjGeWbHi7M9grQ
 fLDy5RRCiClaLJ3yZb6kCsVx+dpkmpeAKAXoyL7dc85od4NQ8ehN+yVpr
 65ABdKdAeITuZeNCa+8Zy3YhCMn3MAbxgghjW4q52RLjeDEAyoYn2DXu6 g==;
Date: Mon, 28 Mar 2022 10:28:58 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <20220328082858.GJ7371@axis.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220328000915.15041-2-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 31 Mar 2022 08:56:02 +1100
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

Hi Ansuel,

On Mon, Mar 28, 2022 at 02:09:15AM +0200, Ansuel Smith wrote:
> - Categorize every dts in arm directory in subdirectory
> - Fix Makefile to address for the arm subdirectory
> - Fix any arm64 dependency
> [...]
>  arch/arm/boot/dts/axix/Makefile               |    3 +
>  .../boot/dts/{ => axix}/artpec6-devboard.dts  |    0
>  arch/arm/boot/dts/{ => axix}/artpec6.dtsi     |    0

All ARTPEC platforms should be in a directory called "axis".
Otherwise LGTM.

Thanks!

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
