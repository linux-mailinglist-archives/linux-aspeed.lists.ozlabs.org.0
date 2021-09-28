Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8479841BA5C
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Sep 2021 00:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJvLD107vz2yPj
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Sep 2021 08:28:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NWHhMqyq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NWHhMqyq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJvL35vGVz2xsW;
 Wed, 29 Sep 2021 08:28:43 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54E35613A6;
 Tue, 28 Sep 2021 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632868120;
 bh=CpoB/AQaiB5lLCqB8ho11PEAW2+8Qw4aT/GKC1JnWBs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NWHhMqyqu5ZeEo7veyI0DPB8sfx/QCj+Q6/4ri8A+3eKcgUBjZ2OSX1rCewPb226Y
 IzDq987TbzOv2e1SuaxsSPVI4471heZdrf3Yu1oJHcUukxwQXqv7v2Z/Via9w5kfG8
 c2D3Pt6Tk9p/qwZDK1kSi6Fdr9/FpF0CZrmHLDeE1xI9neyG3KgK2rAwo3Mf/A/x6q
 jpMcuhdfzW2xeHYcHLMWmHHnJ+2fFXEF/aeZTtLIfn+Reb0S8q4/fru1L3wKcvo2kN
 sRB6UvFq1i2+o/tmhodQdcJFeA8cfLTvsQ3H5hSAomDnY5QVoiR4xnXE0EA+l9EOz5
 S0Amq1sMI7KzA==
Received: by mail-ed1-f46.google.com with SMTP id s17so896121edd.8;
 Tue, 28 Sep 2021 15:28:40 -0700 (PDT)
X-Gm-Message-State: AOAM532kMgaaNjkyVDihi1JD5mflaaMD0YZsDIgE7ZDUBLDLBwXBq2gU
 JQlbcch4LeZZzs4Ycm+1qmw9MbeDMmhZ8MKIlw==
X-Google-Smtp-Source: ABdhPJwf3T2vDvRzn1kn4EttNExbUJlEkqp3unlYwOfhx9E5xNV/zF/ODC8gDrpuUojJrEloyRNMxi7elthKPR3Tgus=
X-Received: by 2002:a50:d903:: with SMTP id t3mr10809492edj.70.1632868118869; 
 Tue, 28 Sep 2021 15:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-11-chin-ting_kuo@aspeedtech.com>
 <YVIUf7/4ukMcrOb9@robh.at.kernel.org>
 <HK0PR06MB2786DAAA2D6E58EA2E2FCB6BB2A89@HK0PR06MB2786.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB2786DAAA2D6E58EA2E2FCB6BB2A89@HK0PR06MB2786.apcprd06.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Sep 2021 17:28:27 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+TZFXrvfJTjofVcnT6jJat-3SvWj+jAq0QST8ndfeUMA@mail.gmail.com>
Message-ID: <CAL_Jsq+TZFXrvfJTjofVcnT6jJat-3SvWj+jAq0QST8ndfeUMA@mail.gmail.com>
Subject: Re: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible
 string
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 27, 2021 at 9:51 PM Chin-Ting Kuo
<chin-ting_kuo@aspeedtech.com> wrote:
>
> Hi Rob,
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Tuesday, September 28, 2021 2:59 AM
> > To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > Subject: Re: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible
> > string
> >
> > On Wed, Sep 22, 2021 at 06:31:16PM +0800, Chin-Ting Kuo wrote:
> > > Add "aspeed,ast2600-emmc" compatible string for the sake of
> > > distinguishing between SD and eMMC device.
> >
> > Why?
> >
> > Is the h/w block different? We already have properties to handle some of the
> > eMMC specifics. Also, you can have a child node for the eMMC device if you
> > need that.
>
> There are two SD/SDIO controllers in a AST2600 SoC.
> One is for SD card and the other is for eMMC.
> Although both of them are embedded in the same SoC, the design of delay cell and
> the manufacture process are different. The delay phase is definitely different and, thus,
> we need a flag, compatible, to distinguish the device, SD or eMMC.
>
> Without "aspeed,ast2600-emmc" compatible, of course, eMMC device can work with original
> sdhci driver and device tree setting. But, for ultra-speed or HS200 case, AST2600 SoC needs some
> phase delay which (maximum) value is different between SD and eMMC device.

This is quite common as tweaking the timing is also need per board.
Look at what other bindings have done. A property is more appropriate
here.

Rob
