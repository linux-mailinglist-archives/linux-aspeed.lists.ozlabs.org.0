Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D323B6EE5A2
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Apr 2023 18:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5S2H5cm9z3cjC
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Apr 2023 02:22:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5S2C0cYbz3cNj;
	Wed, 26 Apr 2023 02:22:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E2F24B3;
	Tue, 25 Apr 2023 09:22:19 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD31A3F587;
	Tue, 25 Apr 2023 09:21:31 -0700 (PDT)
Message-ID: <45bc13a8-1442-2dd3-b9ea-1ed2f5962bac@arm.com>
Date: Tue, 25 Apr 2023 17:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-GB
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Santiago Esteban <Santiago.Esteban@microchip.com>,
 Cristian Birsan <Cristian.Birsan@microchip.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 29/03/2022 9:50 am, Nicolas Ferre wrote:
> Ansuel, All,
> 
> On 28/03/2022 at 10:55, Daniel Palmer wrote:
>> Hi Ansuel
>>
>> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>>>
>>> Hi,
>>> as the title say, the intention of this ""series"" is to finally 
>>> categorize
>>> the ARM dts directory in subdirectory for each oem.
>>
>> While I agree with this change and think it's for the good (browsing
>> the ARM dts directory at the moment is frustrating..) I think
>> buildroot and others need to be told about this as it'll potentially
>> break their kernel build scripting for ARM and probably messes up the
>> configs they have for existing boards.
> 
> This aspect mustn't be underestimated and I anticipate lots of issues 
> during a long time on this particular topic of "build systems".
> 
> Another aspect is CI and public or private testing farms we all have 
> running.

Yet another is if this affects what `make dtbs_install` does (I don't 
know for sure, but I'd be inclined to suspect it might). Some distros 
use that to deliver the DTBs as part of their kernel package, so if 
paths suddenly change it could break end users' bootloader setups too.

Thanks,
Robin.

> These aspects always refrained me to change anything in the naming 
> scheme of our DT files, but if we go in this direction, we must really 
> be prepared and I'm still not convince it's worth it...
> 
> 
> If this has to happen, I would also like to queue some file name changes 
> to do all modifications in one go in order to lower the annoyance level 
> of those who would need to adapt to those changes.
> 
> BTW, is there a common scheme for dts/dtsi file naming? Is it more 
> enforced in one way or another for arm64 in a sense that I can take some 
> norm as an example?
> 
> [..]
> 
> Best regards,
>    Nicolas
> 
> 
> 
