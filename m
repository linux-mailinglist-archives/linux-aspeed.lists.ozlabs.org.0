Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1A6F01E1
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Apr 2023 09:37:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6SHY5NlJz3cBp
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Apr 2023 17:37:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=A9A1kf0a;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=matthias.bgg@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=A9A1kf0a;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6SHS6ptdz3c6v;
	Thu, 27 Apr 2023 17:37:08 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f09b4a156eso54357395e9.3;
        Thu, 27 Apr 2023 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682581024; x=1685173024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxehQfcmJryVNtOnqjPU8dcl4daH8QR4oPGx8PetHgc=;
        b=A9A1kf0aU5n5maWaTYSpwFq+dFDGkdZCkeAcCwkLD9kYlmE85jcd+hdkN4nKiQWQe+
         RVnhbx9f5wFVudnxQnUsSqLoUc+G3JM+O42GX9gNZfKeD8PN2HWTR2M+4STfmZxQqx7A
         ULQDVvEq1TUhKtYHjEQgZl7Jn4EVzSTkmRE2Oecxpq3Lqgdq1vonGcIN3aUKzLbJD2io
         FpSv3YS013V0nX3CVl5ec1a5D04GehDx526Kyx7RUB+XA1EFrTaBRu+mhMmPRXhFDy36
         7PFiOvnoAlRW92DFpieLR1YprFoJEGerJot6aeQ7uIG8PKhFuzZejCpTBKtwwOV0mzu8
         YerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682581024; x=1685173024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxehQfcmJryVNtOnqjPU8dcl4daH8QR4oPGx8PetHgc=;
        b=LXjz+iXgcINF767eoKvSKEeOb+HAjmOHK/rgPHhfiFUI/mGHtHt1FssEvkKqY4uyYm
         X+zBAXX1Ci5MhD5USHjl7zJ//afaLHLjAhzS1M0izt1D6ORWNvLUds0MMGmX9OL1C0xu
         2+nCzn2524SuGdAKBIyTZxrMyJx4WI2tueQJ3KZtkuqyo475qF5A+Yes7i8xPMNvY1zO
         k97cpH7SAu0mD3N99zU62l0ez4FKnOTxyUQrQ8b9tNvbd82ChxggEU2GLSJArUVA//A0
         nEdRid1Z5IJl4tY2jFvo8IrfD34KX1G09jMHY4xBzufGUjy1RHO+oYUpJVjCXAGLXHF0
         qnnw==
X-Gm-Message-State: AC+VfDxWAEKOyAHVbPyG6gWdtstKQppaQrxOkDOqOpb9BtfQfGcztb3V
	Bj7UEZAlmmbqDM2wmqVhcgg=
X-Google-Smtp-Source: ACHHUZ6j08kRlenxNEOxuCRn5D3dpBgWAxIWK0iOstSqplZ+yyO01YFGKwmwZRllZUj/HWkWlwS2Ow==
X-Received: by 2002:a5d:5312:0:b0:2f0:df59:1ea7 with SMTP id e18-20020a5d5312000000b002f0df591ea7mr504125wrv.31.1682581024316;
        Thu, 27 Apr 2023 00:37:04 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i6-20020a5d6306000000b002fed865c55esm17706733wru.56.2023.04.27.00.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 00:37:03 -0700 (PDT)
Message-ID: <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
Date: Thu, 27 Apr 2023 09:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US, ca-ES, es-ES
To: Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>, linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 25/04/2023 17:57, Rob Herring wrote:
> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> Hi Rob,
>>
>> On Tue, Apr 25, 2023 at 12:16 AM Rob Herring <robh+dt@kernel.org> wrote:
>>> I have a script[1] that does the conversion written the last time this
>>> came up. Just have to agree on directory names. I think the easiest
>>> would be for Arnd/Olof to run it at the end of a merge window before
>>> rc1.
>>
>> "emev2" and "sh7" are missing for renesas.
> 
> No doubt it's been bitrotting (or I may have missed some).
> 
>> Does your script also cater for .dts files not matching any pattern,
>> but including a .dtsi file that does match a pattern?
> 
> I assume I built everything after moving, but maybe not...
> 
> That's all just "details". First, we need agreement on a) moving
> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> been stuck on a) for being 'too much churn'.
> 

I think it makes sense to move them and probably the best way to do so is, as 
you proposed: that Arnd or Olof run the script to move them just before -rc1

Regards,
Matthias

> One nice thing with subdirs is 'make CHECK_DTBS=y
> arch/arm/boot/dts/foo/' can build everything for a platform family
> without having to mess with the kconfig. Maybe most folks don't care,
> but I do. My CI job running schema checks looks like this to deal with
> grouping the arm dts files (this list is probably out of date too, but
> less so):
> 
>          if [ "$ARCH" = "arm" ]; then
>              VENDOR_LIST="alphascale alpine artpec aspeed axm bcm cx9
> (ecx|highbank) \
>                efm ep7 imx1 imx23 imx28 imx27 imx5 imx6 imx7 ls vf qcom \
>                (am3|am4|am5|dra|keystone|omap|compulab|logicpd|elpida|motorola-cpcap|da|dm)
> \
>                nspire armada dove kirkwood orion mvebu mmp2 berlin pxa
> (arm-|integ|mps|ve) \
>                (at91|sama|usb_|tny_|mpa1600|animeo_ip|aks-cdu|ethernut5|evk-pro3|pm9g45|ge86)
> \
>                exynos s3c s5p gemini (hisi|hi3|hip) mt meson moxa nuvo
> lpc owl ox8 \
>                (r7|r8|r9|emev2|sh73a|gr-|iwg) (rk|rv11) socfpga stm
> (sti|st-pin) ste \
>                spear (sun|axp) tegra uniph (vt8500|wm8) xen zynq"
>          else
>              VENDOR_LIST=$(ls arch/$ARCH/boot/dts/ | xargs)
>          fi
> 
> Rob
