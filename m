Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D726F95A5
	for <lists+linux-aspeed@lfdr.de>; Sun,  7 May 2023 02:36:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDQT102xKz3bbD
	for <lists+linux-aspeed@lfdr.de>; Sun,  7 May 2023 10:36:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wid3vb0X;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wid3vb0X;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9wMM4FzXz3bd5
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 May 2023 08:52:29 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f0108a7d20so5140721e87.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 02 May 2023 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683067946; x=1685659946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1p8PAJD9DFCngojw0T3kSd1c2uyqBORxfNEmDK3GJ4=;
        b=Wid3vb0XoqRQiHbZz/w7uZzIrevHHiJUz4YIWI3XiBJlItHp64nbpwY8apoQHe5XiS
         kASQttuqycXEcD39Y65w0JvzrH6AMYymruY1P1QyLnT8NAUJ8o14IdZJEeKU2tuXFfG4
         dcvVfIY9dcGYBkv+a3KYrHyqkWBDr0eeBrzwQ/Fy4GZqh0NFV80W7871ks9fyZ+VvhHd
         kzmg/+c31QJHzjCWxqAEXqZS/U4CXQIbSVLK8pCiojz7xnfrfwrG0v1d74dmd70PJ1Ej
         ziYOp8gLWayX/HoiQMoGzE82hbBV8GBFaHE9eQDOtM8OjVal6qk9cIG+/RxD3bDlbcr3
         EUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683067946; x=1685659946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1p8PAJD9DFCngojw0T3kSd1c2uyqBORxfNEmDK3GJ4=;
        b=EPnhR9A7BmXkcAEC/UkD0B7esnidkNGJS5vAnB/3bxRHONMhcpIsigy8x8YNn+XcYr
         X/GXJmGvj/gbr82s7SIOnNu7fbMVfQQVqgM0cSbSSQQocsh2mZzE+QuB8R8BlL06/8DI
         wQBbEQyVSudmpx+qj/1US1BTPCJHHlUeM6XDkHL/qGI/8msIVm35WcHclwMwQ6jmfz81
         nPeUcYvS86A4tLjCT3oJTQFfRtbuI141agiGnCFnhH0jNyroDV7PwlJDxgVlY7vqBBUh
         hTpJInQKcSaeRpg9RVr9KoHel/1TKe1ZWnPYdmIxo4/3Gied7WuIGDMYTMltEAKC7E9d
         hmHw==
X-Gm-Message-State: AC+VfDyldiqmuTmRHPCGK7RzA1zFexuJTreBWY9IZwBD1gB6xC2yijrW
	BmYjbPl07DtSd+WmAHQaihwSIA==
X-Google-Smtp-Source: ACHHUZ6Oo6CNJusINV9/L7Xt1q+0o1hyr6U1jjDYvnM0ZlUDdwA1vrQ5KYtmvDXiiUxPR0FKQ1HT5g==
X-Received: by 2002:a19:c204:0:b0:4f1:223c:dc83 with SMTP id l4-20020a19c204000000b004f1223cdc83mr355945lfc.48.1683067945539;
        Tue, 02 May 2023 15:52:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r16-20020ac24d10000000b004ddaea30ba6sm5607156lfi.235.2023.05.02.15.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 15:52:24 -0700 (PDT)
Message-ID: <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org>
Date: Wed, 3 May 2023 01:52:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-GB
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 07 May 2023 10:35:51 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 02/05/2023 22:40, Rob Herring wrote:
> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>
>>>> Does your script also cater for .dts files not matching any pattern,
>>>> but including a .dtsi file that does match a pattern?
>>>
>>> I assume I built everything after moving, but maybe not...
>>>
>>> That's all just "details". First, we need agreement on a) moving
>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>> been stuck on a) for being 'too much churn'.
>>
>> Sorry for missing most of the discussion last week. The script sounds
>> fine to me, the only reason I didn't want to do this in the past is that
>> we had the plan to move platforms out of the kernel tree to an external
>> repository and I wanted to do this platform at a time and also only move
>> each one once. I don't think that is going to happen anytime soon now,
>> so let's just do your script.
>>
>> Can you send me the script and/or a pull request of the resulting
>> tree based on my soc/dt branch? Everything is merged upstream,
>> and I think git-merge would handle the remaining merges with any
>> other changes in mainline.
> 
> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
> 
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.
> 
> Here's the current mapping:
> 
> vendor_map = {
>      'alphascale' : 'alphascale',
>      'alpine' : 'alpine',
>      'artpec' : 'axis',
>      'axm' : 'lsi',
>      'cx9' : 'cnxt',
>      'ecx' : 'calxeda',
>      'highbank' : 'calxeda',
>      'ep7' : 'cirrus',
>      'mxs': 'mxs',
>      'imx23': 'mxs',
>      'imx28': 'mxs',
>      'sun' : 'allwinner',
>      'imx': 'imx',
>      'e6' : 'imx',
>      'e7' : 'imx',
>      'mba6' : 'imx',
>      'ls': 'fsl',
>      'vf': 'fsl',
>      'qcom': 'qcom',
>      'am3' : 'ti',
>      'am4' : 'ti',
>      'am5' : 'ti',
>      'dra' : 'ti',
>      'keystone' : 'ti',
>      'omap' : 'ti',
>      'compulab' : 'ti',
>      'logicpd' : 'ti',
>      'elpida' : 'ti',
>      'motorola' : 'ti',
>      'twl' : 'ti',
>      'da' : 'ti',
>      'dm' : 'ti',
>      'nspire' : 'nspire',
>      'armada' : 'marvell',
>      'dove' : 'marvell',
>      'kirkwood' : 'marvell',
>      'orion' : 'marvell',
>      'mvebu' : 'marvell',
>      'mmp' : 'marvell',
>      'berlin' : 'berlin',
>      'pxa2' : 'pxa',
>      'pxa3' : 'pxa',
>      'pxa' : 'marvell',

I'd question if it makes sense to split the pxa line. Yes, it was sold 
by Intel to Marvell, but IIRC the devices still had some inheritance. 
So, if we have the 'pxa' subdir, I'd move Marvell PXAs to that dir too.

>      'arm-' : 'arm',
>      'integ' : 'arm',
>      'mps' : 'arm',
>      've' : 'arm',
>      'aspeed' : 'aspeed',
>      'ast2' : 'aspeed',
>      'facebook' : 'aspeed',
>      'ibm' : 'aspeed',
>      'openbmc' : 'aspeed',
>      'en7' : 'airoha',
>      'at91' : 'microchip',
>      'sama' : 'microchip',
>      'sam9' : 'microchip',
>      'usb_' : 'microchip',
>      'tny_' : 'microchip',
>      'mpa1600' : 'microchip',
>      'animeo_ip' : 'microchip',
>      'aks-cdu' : 'microchip',
>      'ethernut5' : 'microchip',
>      'evk-pro3' : 'microchip',
>      'pm9g45' : 'microchip',
>      'ge86' : 'microchip',
>      'bcm' : 'brcm',
>      'exynos' : 'samsung',
>      's3c' : 'samsung',
>      's5p' : 'samsung',
>      'gemini' : 'gemini',
>      'hi3' : 'hisilicon',
>      'hip' : 'hisilicon',
>      'hisi' : 'hisilicon',
>      'sd5' : 'hisilicon',
>      'hpe' : 'hpe',
>      'intel': 'intel',
>      'mt' : 'mediatek',
>      'meson' : 'meson',
>      'moxa' : 'moxa',
>      'mstar' : 'mstar',
>      'nuvo' : 'nuvoton',
>      'lpc' : 'lpc',
>      'lan96' : 'microchip',
>      'owl' : 'actions',
>      'ox8' : 'oxsemi',
>      'rda' : 'rda',
>      'rtd' : 'realtek',
>      'r7' : 'renesas',
>      'r8' : 'renesas',
>      'r9' : 'renesas',
>      'emev2' : 'renesas',
>      'sh73a' : 'renesas',
>      'gr-' : 'renesas',
>      'iwg' : 'renesas',
>      'rk' : 'rockchip',
>      'rv11' : 'rockchip',
>      'rockchip' : 'rockchip',
>      'socfpga' : 'socfpga',
>      'stm' : 'stm32',
>      'sti' : 'sti',
>      'st-pin' : 'sti',
>      'ste' : 'st-ericsson',
>      'spear' : 'spear',
>      'axp' : 'allwinner',
>      'tegra' : 'nvidia',
>      'milbeaut' : 'socionext',
>      'uniph' : 'socionext',
>      'vt8500' : 'vt8500',
>      'wm8' : 'vt8500',
>      'xen' : 'xen',
>      'zx' : 'zte',
>      'zynq' : 'xilinx',
> }
> 
> Rob
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-move-v2

-- 
With best wishes
Dmitry

