Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2D5E5BAA
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 08:52:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY5Yx0lVSz3c2j
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 16:52:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tTATpAtR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tTATpAtR;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY5Yr5bWQz307C
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Sep 2022 16:52:15 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id f9so13098663lfr.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 23:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=R4By1A4vsqkhsX1zQ9Pp9D5cDY7oXVIoxYX95+DT5PE=;
        b=tTATpAtRVwjlDYTCT7pL1pRJbq5m1acku+1Ba7Zt53sySs6UkSNrUaB0GLEOrrFETm
         9G+iZtHyPR6SvFXlXV2hcpvCw5gr9fSriZL7EMWe9I5UyUJ4cHdctXvAQHMWiwYS6uEk
         Qxel41eu2KSTH4QJp9KIBjN6mZz8rZYGYZxRNlURYri7cxs4SptLwa7H2ncezI86NorG
         wrAWseYtHfxWGryE/asWzRiw8bohgI3b3IRIAch0x6RE4u4C1c5u3TX2ZAr8s1rreqrG
         cET7sqTGbNafXUKexSsxYPGdCVE8O1ZtqH79YslvG1W5Jj+aDQcuBnB+eJ3VpzbGAQQ5
         w85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=R4By1A4vsqkhsX1zQ9Pp9D5cDY7oXVIoxYX95+DT5PE=;
        b=X45MlhdGiEzlFRezRuJxc6aAtImpfublN/Zd4hcA+ghLRSaTZTjpDoGv8C7Whowdf0
         yaDfaoh0gljtGSpIVyX+6BruEYHHxf6dg9kYBd4kJ2Q39UafTORTE0rwtA48tgyc1pHC
         4GuIUqq/276+ej6oHthz7twb2QoyCO+vif4nhu1d5A3TigT9JC1sTH7f9Cc9WsXFfXOG
         Q0man7AgJBpRcnVfhtuinIYdgssyZgEGyreAYlz5Oo/08+4LqPiOvNkhONgmdGSCeh+t
         JcbkM9IOWlufrrCfuRlNGLsrj8jt4p1cRVyO9mTRlei+fYbB2erM08crbfAFjsgGeLEf
         ZXFA==
X-Gm-Message-State: ACrzQf1dvI7tkoTUOEjdoeXP7CH/QvQcSTvD/gYCMzHVy8hAPFWLFQzY
	eDHnDOrq0D0KDOa2F8VYQsCJnA==
X-Google-Smtp-Source: AMsMyM44wyfp1zLUX8FNiyQhFVz7FEelPJEjwbKiOGbAcJVd0bCqI3GEzVjpnk4pR++aYr0d+UdfqA==
X-Received: by 2002:a05:6512:3183:b0:498:fa29:35fe with SMTP id i3-20020a056512318300b00498fa2935femr645077lfe.523.1663829531533;
        Wed, 21 Sep 2022 23:52:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 1-20020ac25f01000000b0049f5358062dsm786705lfq.98.2022.09.21.23.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:52:11 -0700 (PDT)
Message-ID: <6f727f9b-aa1a-3eba-87ec-3e36eeb15351@linaro.org>
Date: Thu, 22 Sep 2022 08:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add AMD DaytonaX BMC
Content-Language: en-US
To: Konstantin Aladyshev <aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-3-aladyshev22@gmail.com>
 <CACSj6VWg+QfSYqeeUR5vtgJFLJg5us5-=D_Esj5NK-uvtH2B3g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACSj6VWg+QfSYqeeUR5vtgJFLJg5us5-=D_Esj5NK-uvtH2B3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/09/2022 23:15, Konstantin Aladyshev wrote:
> Sorry, I still have some questions, can you please help me?
> 
> I work with kernel in the context of the OpenBMC project, and it is
> not possible to run 'make dtbs_check' in the linux kernel devshell
> (Yocto). So I've tried to download upstream kernel and have performed
> the following commands to make the dtbs_check:
> ```
> $ make ARCH=arm aspeed_g5_defconfig && make ARCH=arm dtbs_check
> ```
> This gave me a ton of output regarding all the problems in all of the
> aspeed boards. 'wc -l' says that the log file is about 7080 lines
> long. Is it possible to get the output only for my target DTS? The
> article that you've referred to
> (https://www.kernel.org/doc/Documentation/devicetree/writing-schema.rst)
> only have the information about how to run checks against one schema
> (DT_SCHEMA_FILES), but it is not the same thing.

You can limit it per target. See slide 11:
https://osseu2022.sched.com/event/15z0W

This might miss some warnings, so better way is to:
make ARCH=arm dtbs_check
touch your-dts
make ARCH=arm dtbs_check

You will get only your errors.

> 
> I've manually tried to split the output regarding my DTS file, but
> even so the output is overwhelming - https://pastebin.com/b92rnBt0. I
> just don't understand if the mentioned things are about the common
> "aspeed-g5.dtsi" file that I should ignore or the things regarding
> errors in my submitted DTS file. Can you give me some advice on that?

Yes, you can ignore errors from dtsi.

Best regards,
Krzysztof

