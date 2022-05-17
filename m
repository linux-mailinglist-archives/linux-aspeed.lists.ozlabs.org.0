Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D50052C794
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 01:33:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Tnv0mVSz3c9v
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 09:33:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SLdIpuHs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SLdIpuHs; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2ZXJ55fwz3bpy
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 22:03:44 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id j28so8054683eda.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yZJ549tkUDyfMnj4pDgFXOPxERt74iwRgdcSUgywI0w=;
 b=SLdIpuHsPZOQVlDGwOot7xRTXin9VuhUJWDszbnsNjoGeWE8iBiJ3ukO3F3Z5GZteq
 1cp1K5zu4cgXjLKSEfKvXBjOHbGusbTRY3yPCiSX6aYgQntnubVrjqXBIOjABmNpiKXA
 cP6tVRvsLW4So4q8qv2MUGoSR4JBKO+99YHGO8c58Mccs75L0RDc4CaWqBjoA3fJGxID
 Jo3c20vSluxtLkg3zJt1FPzOAIVrGXZnS32smWQehkwlE3LH5AKrwKGAmwlyCUzgjWmg
 aztEWXc+ige5+ey6GRtLavKzVNZUV74JmNGmBsJI2Mje1F8DfO5sQtnMpAWUMWuUEcYK
 q/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yZJ549tkUDyfMnj4pDgFXOPxERt74iwRgdcSUgywI0w=;
 b=MmOTHfv5NsHpuBBRlmKBKDHZcDuHdnTQQdGQeRNA8hn/xdL8xIjrQ9FG2ihml/q+1g
 bwSucT66nCMf40TsQkcD94g+PBwvFkiVOH4kbjG0IDqogmh4jQztx63F4xLh2JnvgB9W
 FCcDvkW1ImaFB18sLieCJLdGeRSAH046mSxej5FWbat54X2zlprvvMbXPtKXgO07rlVj
 gLr2MSa4im6+gg5eMBJqnsemorZKtPkx6gKHShosGBOUWozVPAQWZRf+RCqaXQuV8StE
 D4Oy4u91WJa4Pfe1KWgcNCLrQGL7N+7lpPPhwc/e4jGtzRzwa0sH9r4atAzN6PbhNixj
 DhCg==
X-Gm-Message-State: AOAM530HcjdeG7uCd1aqQ8G0/CWga6q8+Z+0gg8DEe/WnaA4mWQnCwP1
 nRtGd9DqXdReNBcLwaj8McBVSw==
X-Google-Smtp-Source: ABdhPJzS034eaTCysoZRyeY2Rmi287sAazLAVLGC7BRgRqcCeUbhtN10ECZckeoh/xWSE6rloRIXtw==
X-Received: by 2002:a05:6402:2815:b0:420:c32e:ebe2 with SMTP id
 h21-20020a056402281500b00420c32eebe2mr18820072ede.1.1652789020781; 
 Tue, 17 May 2022 05:03:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u12-20020aa7d88c000000b0042ac13e232csm1645442edq.39.2022.05.17.05.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 05:03:40 -0700 (PDT)
Message-ID: <414d09f8-328a-4bf4-c20e-f8ce4a6ddfc7@linaro.org>
Date: Tue, 17 May 2022 14:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] dt-bindings: usb: add documentation for aspeed udc
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-4-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517082558.3534161-4-neal_liu@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 19 May 2022 09:33:33 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 17/05/2022 10:25, Neal Liu wrote:
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    usb: usb@1e6a2000 {
> +            compatible = "aspeed,ast2600-udc";

Sorry for not noticing it earlier - slipped through the cracks. You use
here unusual indentation (not matching the rest of the example - above
is 4 spaces, here is 7 or 8).

Just keep 4 spaces for DTS example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
