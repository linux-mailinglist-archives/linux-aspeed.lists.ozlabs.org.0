Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 804D56F6150
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 May 2023 00:30:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBWqL2zJDz3blg
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 May 2023 08:30:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bNRlnnTF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bNRlnnTF;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBWqF1P3Qz3bTs;
	Thu,  4 May 2023 08:30:14 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-24decf5cc03so3450530a91.0;
        Wed, 03 May 2023 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683153012; x=1685745012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Mp6CzPotn9aMhYuP1SiSdnM3toCuetUTL6p1Pka30U=;
        b=bNRlnnTF+SjZJvfO0HArhda1ki6KEyIa7yIRZQPDhMmTqTNNooLEQemu27nE0HCTDC
         ehg0UFT/VFvJrzxIMMpqs/LfyiZTcvfm3F+XeRCHeLKiHGTslEamAcA/igyUj1RUpYqb
         jGTv1DRSnyHXSO+6BklV+H0tQUegWEpRcj9ZpU3IZeJyr0OTp0uWflXKxNLt/Dv3Fo9Q
         lyreFoA/HC5oPSx7g0RJgiSEs9GwL3CQmot20cPJQBMw9eDNFCnNWmZeSQ/ZfOgd+UUX
         wLIk2ukG1JzFJdW7nk5OX9lr2jX57mY836CjkAxfeHIEUZ2uly4MzKA0lNXFe8yznUDm
         6rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683153012; x=1685745012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Mp6CzPotn9aMhYuP1SiSdnM3toCuetUTL6p1Pka30U=;
        b=Ciizqsm57RiOldftYdn1iVU8a5P/mrehaHmMdIGV6wqZkIM8LaGNO8DdMJXH4iqmx3
         oDvUkXWJIfC9yJ/NGQ3vI1rBA/wNSuvYFRbYBCJczgytH8FC2RY1t/zcrBLkHdNyWBto
         24i709S/AkVzpP+Rvm7BiBxIHgc95tcb+sUVCVRBMJaMTaJTlvQaXMjGzbBFwCJx6PD/
         4bNZSOoLKA72MFvEVNS7u+WWMNwECBp2IsLtUilpZrn60QCxN9n2lX8jPqMAvvOttHWH
         AhkHMB9fUyW5pL7OBYOTgnZQIAok9PgGz29o9XRMYssSl4q9HgJlvNAlSrCuKAjQlopp
         EiLg==
X-Gm-Message-State: AC+VfDzpmWDdsxecWBOrEL6QqeURgnlVYMAiSIW2jCwe8IULKWAvZNHu
	55qIbhRoGVFSbJ/bQd613c8=
X-Google-Smtp-Source: ACHHUZ68cmsHxtB87iONW+SsuMsSJr4NkMfMrRrxl8kzW+7lj28j0Q7Ue/XhdACq9ZdVdGd7yUEu7w==
X-Received: by 2002:a17:90a:a891:b0:247:bdd3:a039 with SMTP id h17-20020a17090aa89100b00247bdd3a039mr172899pjq.8.1683153011868;
        Wed, 03 May 2023 15:30:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id jx12-20020a17090b46cc00b0024e0141353dsm1872551pjb.28.2023.05.03.15.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 15:30:11 -0700 (PDT)
Message-ID: <bae5336c-a26a-cabb-6b83-ee9cece18130@gmail.com>
Date: Wed, 3 May 2023 15:29:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
 <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io
 >
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 5/2/23 18:04, Rob Herring wrote:
> On Tue, May 2, 2023 at 6:02 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 5/2/23 12:40, Rob Herring wrote:
>>> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>>
>>>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>>>> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>>
>>>>>> Does your script also cater for .dts files not matching any pattern,
>>>>>> but including a .dtsi file that does match a pattern?
>>>>>
>>>>> I assume I built everything after moving, but maybe not...
>>>>>
>>>>> That's all just "details". First, we need agreement on a) moving
>>>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>>>> been stuck on a) for being 'too much churn'.
>>>>
>>>> Sorry for missing most of the discussion last week. The script sounds
>>>> fine to me, the only reason I didn't want to do this in the past is that
>>>> we had the plan to move platforms out of the kernel tree to an external
>>>> repository and I wanted to do this platform at a time and also only move
>>>> each one once. I don't think that is going to happen anytime soon now,
>>>> so let's just do your script.
>>>>
>>>> Can you send me the script and/or a pull request of the resulting
>>>> tree based on my soc/dt branch? Everything is merged upstream,
>>>> and I think git-merge would handle the remaining merges with any
>>>> other changes in mainline.
>>>
>>> I've dusted off my script and made a branch[1] with the result.
>>> There's just a couple of fixes needed after the script is run (see the
>>> top commit). The cross arch includes are all fixed up by the script.
>>> dtbs_install maintains a flat install. I compared the number of .dtbs
>>> before and after to check the script.
>>>
>>> I think the only issue remaining is finalizing the mapping of
>>> platforms to subdirs. What I have currently is a mixture of SoC
>>> families and vendors. The most notable are all the Freescale/NXP
>>> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
>>> either. Once that's finalized, I still need to go update MAINTAINERS.
>>>
>>> Here's the current mapping:
>>>
>>> vendor_map = {
>>>       'alphascale' : 'alphascale',
>>>       'alpine' : 'alpine',
>>>       'artpec' : 'axis',
>>>       'axm' : 'lsi',
>>>       'cx9' : 'cnxt',
>>>       'ecx' : 'calxeda',
>>>       'highbank' : 'calxeda',
>>>       'ep7' : 'cirrus',
>>>       'mxs': 'mxs',
>>>       'imx23': 'mxs',
>>>       'imx28': 'mxs',
>>>       'sun' : 'allwinner',
>>>       'imx': 'imx',
>>>       'e6' : 'imx',
>>>       'e7' : 'imx',
>>>       'mba6' : 'imx',
>>>       'ls': 'fsl',
>>>       'vf': 'fsl',
>>>       'qcom': 'qcom',
>>>       'am3' : 'ti',
>>>       'am4' : 'ti',
>>>       'am5' : 'ti',
>>>       'dra' : 'ti',
>>>       'keystone' : 'ti',
>>>       'omap' : 'ti',
>>>       'compulab' : 'ti',
>>>       'logicpd' : 'ti',
>>>       'elpida' : 'ti',
>>>       'motorola' : 'ti',
>>>       'twl' : 'ti',
>>>       'da' : 'ti',
>>>       'dm' : 'ti',
>>>       'nspire' : 'nspire',
>>>       'armada' : 'marvell',
>>>       'dove' : 'marvell',
>>>       'kirkwood' : 'marvell',
>>>       'orion' : 'marvell',
>>>       'mvebu' : 'marvell',
>>>       'mmp' : 'marvell',
>>>       'berlin' : 'berlin',
>>>       'pxa2' : 'pxa',
>>>       'pxa3' : 'pxa',
>>>       'pxa' : 'marvell',
>>>       'arm-' : 'arm',
>>>       'integ' : 'arm',
>>>       'mps' : 'arm',
>>>       've' : 'arm',
>>>       'aspeed' : 'aspeed',
>>>       'ast2' : 'aspeed',
>>>       'facebook' : 'aspeed',
>>>       'ibm' : 'aspeed',
>>>       'openbmc' : 'aspeed',
>>>       'en7' : 'airoha',
>>>       'at91' : 'microchip',
>>>       'sama' : 'microchip',
>>>       'sam9' : 'microchip',
>>>       'usb_' : 'microchip',
>>>       'tny_' : 'microchip',
>>>       'mpa1600' : 'microchip',
>>>       'animeo_ip' : 'microchip',
>>>       'aks-cdu' : 'microchip',
>>>       'ethernut5' : 'microchip',
>>>       'evk-pro3' : 'microchip',
>>>       'pm9g45' : 'microchip',
>>>       'ge86' : 'microchip',
>>>       'bcm' : 'brcm',
>>
>> How about we use 'broadcom' here, to follow what arm64 does? I could
>> rename arch/mips/boot/dts/brcm to arch/mips/boot/dts/broadcom for
>> consistency, too?
> 
> Okay, though if starting clean I'd somewhat prefer to use the vendor
> prefix. I guess since arm and arm64 share dtsi files, they should
> match.

Sounds good to me, let's go with "brcm" then.
-- 
Florian

