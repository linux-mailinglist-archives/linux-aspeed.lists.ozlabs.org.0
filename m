Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCFA4E92B8
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 12:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRqD24KRsz3c21
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 21:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B9rhYXNF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=matthias.bgg@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=B9rhYXNF; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRqCv1vThz2ynj;
 Mon, 28 Mar 2022 21:47:53 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id b19so19714180wrh.11;
 Mon, 28 Mar 2022 03:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=S4BUcd6hJObrfpqKxdRcJRoKACX0pcH5PLnHV9ghRjU=;
 b=B9rhYXNFCJG8FVrCwa5K+POuffvNj9XzTQKCajpz8pCCAe58zDB/aU9DL5fqtqJWAI
 ky54WS/d9TWKJ7aQI2ZqzXMkcPHxKAbOnYADOVDTZRl4K4EZ6nKuXHMRMOUlTa3pZvcK
 Y8cetVauSkzbUxvUnWzmQRJ7x7hfdMpVLYHTE3/Ae2k2izID9wHS/jw5EaXtUzwHEHAR
 K1L5smUPkm9azb41ja7r0hy1dRp/X4/xrOgLDr5HfLY+yO2hJuHnUmcoNrEBPPoA5ZAp
 n8/SKRsojeJxYPxX0tjb6jEnopKhJ1kNHYloxuyu3SfO3NpPdbAhGWlCkOMUqOnXfwdd
 bWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=S4BUcd6hJObrfpqKxdRcJRoKACX0pcH5PLnHV9ghRjU=;
 b=7ArE97Fs9RZcymEqczGECiwF7y4n7gCT3VP63CVO30Dd3VdDxgCHvKSTbU0hNoi/oz
 o36biMRzPQm2SygfhYwz8qMpcfqCwTBVYLPQjB6u77TNRrtnB2Os9Ohz6DBKUwHNukVx
 Acu/aFijNvxEM3lQyidKXSuj6mNlnc+1P+W9qYhDeLmVqGFKXiBAfLDW4qjKjxOG3iEI
 rI4XPY2I3/rr216GCS/B+JUebyKlS2Ic8aenxltTH9CrlRB2bUAtw0cNymunPb/5IhSU
 onE6AkRwTCw2u5nNkL3OyQsvUboekJqvKpkMcUwkf4EDbaG8EzIYNDJRUX7BLgWlmEmM
 cXsw==
X-Gm-Message-State: AOAM532vfqFiCZGo1lYpK1lnKtRd6hopzdma3q1SJ/smt5MDLLgggPP6
 eefIHarBce3z8UODq0PZDz4=
X-Google-Smtp-Source: ABdhPJxpNsUPF4FVDfJw3TgkeBx1g5iROwUOuCmVKrZ2Kp8QiOuC95uyQZ19znx7Kf29FzrQ8qx3og==
X-Received: by 2002:a5d:404c:0:b0:203:ea4e:3c07 with SMTP id
 w12-20020a5d404c000000b00203ea4e3c07mr22646484wrp.597.1648464468913; 
 Mon, 28 Mar 2022 03:47:48 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0038cb924c3d7sm11665275wmq.45.2022.03.28.03.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 03:47:48 -0700 (PDT)
Message-ID: <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
Date: Mon, 28 Mar 2022 12:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
In-Reply-To: <20220328000915.15041-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 28/03/2022 02:09, Ansuel Smith wrote:
> - Categorize every dts in arm directory in subdirectory
> - Fix Makefile to address for the arm subdirectory
> - Fix any arm64 dependency
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
[...]
>   arch/arm/boot/dts/mediatek/Makefile           |   14 +
>   .../boot/dts/{ => mediatek}/mt2701-evb.dts    |    0
>   .../boot/dts/{ => mediatek}/mt2701-pinfunc.h  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt2701.dtsi  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6323.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt6580-evbp1.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6580.dtsi  |    0
>   .../mt6582-prestigio-pmt5008-3g.dts           |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6582.dtsi  |    0
>   .../dts/{ => mediatek}/mt6589-aquaris5.dts    |    0
>   .../{ => mediatek}/mt6589-fairphone-fp1.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6589.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt6592-evb.dts    |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6592.dtsi  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623.dtsi  |    0
>   .../dts/{ => mediatek}/mt7623a-rfb-emmc.dts   |    0
>   .../dts/{ => mediatek}/mt7623a-rfb-nand.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623a.dtsi |    0
>   .../mt7623n-bananapi-bpi-r2.dts               |    0
>   .../dts/{ => mediatek}/mt7623n-rfb-emmc.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623n.dtsi |    0
>   .../boot/dts/{ => mediatek}/mt7629-rfb.dts    |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7629.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt8127-moose.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt8127.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt8135-evbp1.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt8135.dtsi  |    0

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Would it be possible to also script a fix for the MAINTAINERS file?

$ git grep "arch\/arm\/boot\/dts" MAINTAINERS |wc -l

101


Regards,
Matthias
