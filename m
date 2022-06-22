Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624BA55451D
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 12:10:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfK70hC5z3bq3
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 20:10:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KXA4foDC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KXA4foDC;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfK26NHtz2yjS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 20:10:29 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id j24so1953858wrb.11
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=eEsdR3TRm+vL6zz3f95iag483n0NsrY0R5hgPLAoA04=;
        b=KXA4foDCHZexV2GRRixlxLA8pD/5pHbA8m8EJU7/l65KRqcO+XBNv5/lmNLCQz5iBL
         z0Wq4QTvnxqpZ/UmxFoBwts0BUcz/vPtka/fc+cX2vHTJNQ0hJSjZTXjHC/VxdLP7hmk
         46/35SbGwUU7S/usG51/yAZD5lVEo7EkQv8APGTUGFYCyw5iPKy6twKk1h/Y5RGr2i7A
         Wc0ccV7xND46AUXzBQH1umQGBPtYmXtMn1otWXR/ZCgNbL0uRYytWrlAMfjqM6BLQ0uZ
         zZ94oFK35dheDf7cMHPqDQJMsQFUCCg+yFiXkvAHO1UpIBGOGxxPjK/Aqr21kSli12gC
         2fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=eEsdR3TRm+vL6zz3f95iag483n0NsrY0R5hgPLAoA04=;
        b=xByh3i8eBOmDAIa7uyWmd1/PM7HDtiE5AbUVU22S0E4YDitrUT5kXE+CAksRuEi+Bs
         ndZHNY53Pdsv1Bz4ViTvTq05AOYIcPxVrn0JO6oElXUs4L7g9ZBTkffIb9kDJkVu6jp1
         ouw0pZoQFMGiko8FiRO/bdH7swyLQAYqKSu9pl1IxR4b/bq3Q+aQ6oMzDZnUKx+KFw7A
         qdyHWpBBZrtqil5XdrZHKpGnhpiJVY1rFSkt2jUz8UlvQ9oBv2xAYN8cECYXLfJEH8jD
         W9t3tSVE74eRCoiE3D8RRBcVz/9C98K9MBOAkomOljnLmolPj9mA668LqwNMWgV9TN3f
         GcpA==
X-Gm-Message-State: AJIora/debxTHlDflo3kbLwg/htKeJEDPgXaIAiyZOITdqY2x/DWvcfc
	8syr3TupRh7gSRigKbohTCBc9A==
X-Google-Smtp-Source: AGRyM1vEBgwyvTcItxhgT5nHyKeJjZ+rV6peH7ZoCYG/Da8zdGhFiHumewdl3lV9D2JKYjJVuJJ0uw==
X-Received: by 2002:a5d:5c07:0:b0:218:544d:4347 with SMTP id cc7-20020a5d5c07000000b00218544d4347mr2402611wrb.107.1655892626865;
        Wed, 22 Jun 2022 03:10:26 -0700 (PDT)
Received: from [192.168.0.224] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v6-20020a1cac06000000b0039c673952bfsm25057577wme.6.2022.06.22.03.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:10:26 -0700 (PDT)
Message-ID: <fd015563-0326-c897-4ecc-cc77e8a4a14c@linaro.org>
Date: Wed, 22 Jun 2022 12:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: arm: aspeed: document board compatibles
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-2-krzysztof.kozlowski@linaro.org>
 <0207c2fe-7c01-7852-3cd1-74297cd4857d@linaro.org>
In-Reply-To: <0207c2fe-7c01-7852-3cd1-74297cd4857d@linaro.org>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, Ken Chen <chen.kenyy@inventec.com>, David Wang <David_Wang6097@jabil.com>, Steven Lee <steven_lee@aspeedtech.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20/06/2022 13:06, Krzysztof Kozlowski wrote:
> On 29/05/2022 12:49, Krzysztof Kozlowski wrote:
>> Document all compatibles used in existing upstreamed Aspeed AST2400,
>> AST2500 and AST2600 based boards.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/arm/aspeed/aspeed.yaml           | 83 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 84 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> 
> Joel, Andrew,
> 
> Any comments on the series? Rob applied only patch 1, so the rest is
> supposed through Aspeed tree. Shall I pick them up and send to arm-soc?

I'll grab the bindings and DTS. I'll keep it on separate branch, so I
can share to avoid conflicts. If anyone prefers to pick it up, let me
know so I will drop them from my tree.

Best regards,
Krzysztof
