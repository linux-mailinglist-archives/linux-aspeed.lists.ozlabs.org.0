Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4604EA9CF
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 10:52:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSNbl0KG8z2yMK
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 19:52:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=umahVY6x;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microchip.com (client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com; envelope-from=nicolas.ferre@microchip.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=umahVY6x; 
 dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Tue, 29 Mar 2022 19:51:57 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSNbd5lhRz2yPR;
 Tue, 29 Mar 2022 19:51:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1648543918; x=1680079918;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0r3zs2np5g1OGyfR5AfBJmzryAoR1xJqsqcoDejQqWU=;
 b=umahVY6xciAG/lz4q7+4byQGZ6u+DeFP2Q78TYwj46yTF6W38bojp3XW
 UCnGkrg9QVk6NWdQyrnYk6f12sbW3sqTlYfmb2cMFx89K9m77/ZBoTE5d
 jMCXbDTknxLZgV0ob/p5thhyhygWwLPpDjNGpi7qPvEwl29jD9JClJTrU
 FPC6aV33jZ0dfjTS3bImN8C79kNpZ9S7srm7e2yGdJKszo+THrNzWAshB
 DuELIdQBauII519Dq8OwwoMLD9I6LqAinEmWc2EIkd40l0YDyLFT4jC0e
 mnZB07V/HLKZZJcX/TNWMBPeUtVU05jeFHrZxaLAgILRNMYqw8o86a3AX g==;
X-IronPort-AV: E=Sophos;i="5.90,219,1643698800"; d="scan'208";a="158497460"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Mar 2022 01:50:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 29 Mar 2022 01:50:48 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 29 Mar 2022 01:50:41 -0700
Message-ID: <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
Date: Tue, 29 Mar 2022 10:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Santiago Esteban
 <Santiago.Esteban@microchip.com>, Cristian Birsan
 <Cristian.Birsan@microchip.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Ansuel, All,

On 28/03/2022 at 10:55, Daniel Palmer wrote:
> Hi Ansuel
> 
> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>>
>> Hi,
>> as the title say, the intention of this ""series"" is to finally categorize
>> the ARM dts directory in subdirectory for each oem.
> 
> While I agree with this change and think it's for the good (browsing
> the ARM dts directory at the moment is frustrating..) I think
> buildroot and others need to be told about this as it'll potentially
> break their kernel build scripting for ARM and probably messes up the
> configs they have for existing boards.

This aspect mustn't be underestimated and I anticipate lots of issues 
during a long time on this particular topic of "build systems".

Another aspect is CI and public or private testing farms we all have 
running.

These aspects always refrained me to change anything in the naming 
scheme of our DT files, but if we go in this direction, we must really 
be prepared and I'm still not convince it's worth it...


If this has to happen, I would also like to queue some file name changes 
to do all modifications in one go in order to lower the annoyance level 
of those who would need to adapt to those changes.

BTW, is there a common scheme for dts/dtsi file naming? Is it more 
enforced in one way or another for arm64 in a sense that I can take some 
norm as an example?

[..]

Best regards,
   Nicolas



-- 
Nicolas Ferre
