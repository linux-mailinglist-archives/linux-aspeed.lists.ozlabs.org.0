Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986586F566B
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 May 2023 12:42:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBD6M6FL5z3cB1
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 May 2023 20:42:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uiHf7zU5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=neil.armstrong@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uiHf7zU5;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBD6D4v8hz3bgr
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 May 2023 20:42:11 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f4000ec74aso1868485e9.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 03 May 2023 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683110522; x=1685702522;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BDk/+beT2Vi+sTgcaduCKGPnBsodi2tO/SNsvbOgP+Y=;
        b=uiHf7zU5OUclCL+nTNOzI51TiwU3XSMeDr4dH1jtzuJPzyrZsj2smb8gGZc0fqnV7x
         aHL1ofrmje1EDO+5gE0g6qKZ4EuW1aNNu5hqEHzlOnNFJg3dDUsEcnArL7QMqULeZ8QQ
         E78qfLE8YanRXWvr8VWZpJQWQZOP2OfsmOtFdKslaSwhg/W729dCGq8oA9CpVleD+Sf3
         qiwZnpKbCFJljnSJxR0hduidKNBpkgr+9ArXsLE1YdQrUZ5g0UtoCp+WQoSG9oLApN1q
         lpLnom5qusxbymkaYi2fPjD77aDN/15+0Ca22+r2BlmDKzsK4Ofi9VnpgXo/JmVv3006
         rcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110522; x=1685702522;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDk/+beT2Vi+sTgcaduCKGPnBsodi2tO/SNsvbOgP+Y=;
        b=Z2BLZsTIE9NNVJjRnzHKpeX3muz7GcrzA88ZTo6R3SE4SACMR6XaPYmGj5FK4p2GBV
         Fmj6vgCH3VKH89kgxDqX3xEMLEISZGTM5LMSWuMVRnhTEhic8v2RnwsWtRLZz2a58T22
         ufp0QP6D2gE09fRL+Sqh/wdrKVsloL6aF3swTSaStBKTBp1N2hW/lOjJQecF8ju5p5te
         C9g3K0WP1i80QU/QYGOBThzHeTRh0K+IBvfdoLya5sDnHHCHOrL1TyOWAABZTqJWNekj
         ukbTzpU63D9KFCCEr3DgX8398dmI+kkFmUqQxJU4npkL7RIP4Cbx6jUKGFNnO7Grmvr9
         JHqg==
X-Gm-Message-State: AC+VfDwlZveXTHymzJuT5F0fDvXwwVkzsMiKZb0e1+l78P6phUVi1knk
	9xMBydtCmXlQyWgfUB3k9mld9w==
X-Google-Smtp-Source: ACHHUZ4+w/861P1TP8XCtb+nKXdXmZXNl4DkJQUk42yYWgf1yqlqtWDrqllYUzBQocFIkyK2KHDH1w==
X-Received: by 2002:a7b:c391:0:b0:3f1:9391:46c with SMTP id s17-20020a7bc391000000b003f19391046cmr14791096wmj.30.1683110522481;
        Wed, 03 May 2023 03:42:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:68:e58d:3e87:f8c2? ([2a01:e0a:982:cbb0:68:e58d:3e87:f8c2])
        by smtp.gmail.com with ESMTPSA id u19-20020a7bc053000000b003f09d7b6e20sm1512696wmc.2.2023.05.03.03.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 03:42:02 -0700 (PDT)
Message-ID: <10572b4a-c3dc-6a28-bb21-c8a95444886e@linaro.org>
Date: Wed, 3 May 2023 12:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io
 >
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 03/05/2023 00:01, Christian Hewitt wrote:
> 
> 
>> On 2 May 2023, at 8:40 pm, Rob Herring <robh+dt@kernel.org> wrote:
>>
>> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>>> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>
>>>>> Does your script also cater for .dts files not matching any pattern,
>>>>> but including a .dtsi file that does match a pattern?
>>>>
>>>> I assume I built everything after moving, but maybe not...
>>>>
>>>> That's all just "details". First, we need agreement on a) moving
>>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>>> been stuck on a) for being 'too much churn'.
>>>
>>> Sorry for missing most of the discussion last week. The script sounds
>>> fine to me, the only reason I didn't want to do this in the past is that
>>> we had the plan to move platforms out of the kernel tree to an external
>>> repository and I wanted to do this platform at a time and also only move
>>> each one once. I don't think that is going to happen anytime soon now,
>>> so let's just do your script.
>>>
>>> Can you send me the script and/or a pull request of the resulting
>>> tree based on my soc/dt branch? Everything is merged upstream,
>>> and I think git-merge would handle the remaining merges with any
>>> other changes in mainline.
>>
>> I've dusted off my script and made a branch[1] with the result.
>> There's just a couple of fixes needed after the script is run (see the
>> top commit). The cross arch includes are all fixed up by the script.
>> dtbs_install maintains a flat install. I compared the number of .dtbs
>> before and after to check the script.
>>
>> I think the only issue remaining is finalizing the mapping of
>> platforms to subdirs. What I have currently is a mixture of SoC
>> families and vendors. The most notable are all the Freescale/NXP
>> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
>> either. Once that's finalized, I still need to go update MAINTAINERS.
>>
>> Here's the current mapping:
>>
>> vendor_map = {
>>     'alphascale' : 'alphascale',
>>     'alpine' : 'alpine',
>>     'artpec' : 'axis',
>>     'axm' : 'lsi',
>>     'cx9' : 'cnxt',
>>     'ecx' : 'calxeda',
>>     'highbank' : 'calxeda',
>>     'ep7' : 'cirrus',
>>     'mxs': 'mxs',
>>     'imx23': 'mxs',
>>     'imx28': 'mxs',
>>     'sun' : 'allwinner',
>>     'imx': 'imx',
>>     'e6' : 'imx',
>>     'e7' : 'imx',
>>     'mba6' : 'imx',
>>     'ls': 'fsl',
>>     'vf': 'fsl',
>>     'qcom': 'qcom',
>>     'am3' : 'ti',
>>     'am4' : 'ti',
>>     'am5' : 'ti',
>>     'dra' : 'ti',
>>     'keystone' : 'ti',
>>     'omap' : 'ti',
>>     'compulab' : 'ti',
>>     'logicpd' : 'ti',
>>     'elpida' : 'ti',
>>     'motorola' : 'ti',
>>     'twl' : 'ti',
>>     'da' : 'ti',
>>     'dm' : 'ti',
>>     'nspire' : 'nspire',
>>     'armada' : 'marvell',
>>     'dove' : 'marvell',
>>     'kirkwood' : 'marvell',
>>     'orion' : 'marvell',
>>     'mvebu' : 'marvell',
>>     'mmp' : 'marvell',
>>     'berlin' : 'berlin',
>>     'pxa2' : 'pxa',
>>     'pxa3' : 'pxa',
>>     'pxa' : 'marvell',
>>     'arm-' : 'arm',
>>     'integ' : 'arm',
>>     'mps' : 'arm',
>>     've' : 'arm',
>>     'aspeed' : 'aspeed',
>>     'ast2' : 'aspeed',
>>     'facebook' : 'aspeed',
>>     'ibm' : 'aspeed',
>>     'openbmc' : 'aspeed',
>>     'en7' : 'airoha',
>>     'at91' : 'microchip',
>>     'sama' : 'microchip',
>>     'sam9' : 'microchip',
>>     'usb_' : 'microchip',
>>     'tny_' : 'microchip',
>>     'mpa1600' : 'microchip',
>>     'animeo_ip' : 'microchip',
>>     'aks-cdu' : 'microchip',
>>     'ethernut5' : 'microchip',
>>     'evk-pro3' : 'microchip',
>>     'pm9g45' : 'microchip',
>>     'ge86' : 'microchip',
>>     'bcm' : 'brcm',
>>     'exynos' : 'samsung',
>>     's3c' : 'samsung',
>>     's5p' : 'samsung',
>>     'gemini' : 'gemini',
>>     'hi3' : 'hisilicon',
>>     'hip' : 'hisilicon',
>>     'hisi' : 'hisilicon',
>>     'sd5' : 'hisilicon',
>>     'hpe' : 'hpe',
>>     'intel': 'intel',
>>     'mt' : 'mediatek',
>>     'meson' : 'meson',
> 
> ‘meson’ : ‘amlogic’,
> 
> ^ to match the SoC vendor name (and arm64)

Ack we're trying to get rid of meson, so it would be time.

Neil

> 
> Christian
> 
>>     'moxa' : 'moxa',
>>     'mstar' : 'mstar',
>>     'nuvo' : 'nuvoton',
>>     'lpc' : 'lpc',
>>     'lan96' : 'microchip',
>>     'owl' : 'actions',
>>     'ox8' : 'oxsemi',
>>     'rda' : 'rda',
>>     'rtd' : 'realtek',
>>     'r7' : 'renesas',
>>     'r8' : 'renesas',
>>     'r9' : 'renesas',
>>     'emev2' : 'renesas',
>>     'sh73a' : 'renesas',
>>     'gr-' : 'renesas',
>>     'iwg' : 'renesas',
>>     'rk' : 'rockchip',
>>     'rv11' : 'rockchip',
>>     'rockchip' : 'rockchip',
>>     'socfpga' : 'socfpga',
>>     'stm' : 'stm32',
>>     'sti' : 'sti',
>>     'st-pin' : 'sti',
>>     'ste' : 'st-ericsson',
>>     'spear' : 'spear',
>>     'axp' : 'allwinner',
>>     'tegra' : 'nvidia',
>>     'milbeaut' : 'socionext',
>>     'uniph' : 'socionext',
>>     'vt8500' : 'vt8500',
>>     'wm8' : 'vt8500',
>>     'xen' : 'xen',
>>     'zx' : 'zte',
>>     'zynq' : 'xilinx',
>> }
>>
>> Rob
>>
>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-move-v2
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

