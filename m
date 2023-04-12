Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4EC6DF834
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Apr 2023 16:18:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxPvY1DbPz3f4L
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Apr 2023 00:18:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BIVb69/b;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BIVb69/b;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxPvP3Mfjz3cdT
	for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Apr 2023 00:18:23 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id qa44so28934038ejc.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Apr 2023 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681309095;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8NWS2eelnyQFGBZDCPZ75VP8HbH55/0xHGNByiFEd0=;
        b=BIVb69/bW8OF8X+48XLU+AqyKSWVuga3OpfarkvheGyyNL8fzaJAAWf80o0gb+KmqJ
         9EJES3UdW5EJSN7G1DYeJSd+WMfG3DAm9cRlXWs4+JustZunvmSWI5leHYTnydFjZI0a
         o2iz7VHzrN8OZw/bStB3NceoQuc2hUS/CYmJwEYt1AcngYuymtJbdBNalwY4k4jjPPXI
         o52Fzvk7HrgBHfvFprqWlaLdjB3jrUl7/Xl7Ko/jHtxuwir6Pw1Jq7JhJ1knw+bwwa2o
         LYnj6NR8UuMY9f1ktMBsrMmx1Hur24Ypb8i5gZGbOxzqeToL7LZK0JeVrdAzMhAHaVMM
         tDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681309095;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8NWS2eelnyQFGBZDCPZ75VP8HbH55/0xHGNByiFEd0=;
        b=oOxp9WyUZIv4FTIu0C/73TFP3G0wAWhPr+fSmBvRf8PF09Z0GwB8+2EF3QF8l4C2cc
         HgxhBwQMyn2MSkQJH+igy5RY+q7prvFdFVeEqfBocDdR7KL2u7IsElBecF9h+Kcr0Iy7
         KS47mz2/Dq33IBkL6XfmVLyOqh2KyXVqiKPf7WAJqnZyR1VTQ+c1VVOFhltQZECFb4ua
         ++jdNJcYgev9G0CS1JOrc4R0Lbcck45dIz40lJ+GW/lF9dmy/Vqggbr9B+cH4r7bDXrP
         bubxG0LqSh9ScV1Hxgwsr2vrJbYA0M1UapZ7FEEAn349mCr0JiNpU3wpWR1nrXw/6k24
         YCsg==
X-Gm-Message-State: AAQBX9ducWBeOp99dHV6MQPWcUKWYfJAh3C0oQDJLg3HxcxeAd+SWfCG
	WHHWU3szebvkfKpnAo0pAktvng==
X-Google-Smtp-Source: AKy350an9q10HxsKC2ERoCMc194DK+2dDRSAYWMKvPPJMJnrXj+0fVHJo+jEScP03ZhibXW94IC3kA==
X-Received: by 2002:a17:906:560e:b0:94d:fd61:e90b with SMTP id f14-20020a170906560e00b0094dfd61e90bmr7327963ejq.65.1681309094957;
        Wed, 12 Apr 2023 07:18:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id wz10-20020a170906fe4a00b0094a6e7075eesm3733929ejb.41.2023.04.12.07.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 07:18:14 -0700 (PDT)
Message-ID: <3ee27d89-5a13-cf5f-c7d3-aa2740a790f3@linaro.org>
Date: Wed, 12 Apr 2023 16:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v9 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>, linux-aspeed@lists.ozlabs.org
References: <20230405022825.333246-1-ryan_chen@aspeedtech.com>
 <20230405022825.333246-2-ryan_chen@aspeedtech.com>
 <40f1ca77-7f7a-dc51-1137-45664a6ef2a1@linaro.org>
In-Reply-To: <40f1ca77-7f7a-dc51-1137-45664a6ef2a1@linaro.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 06/04/2023 09:36, Krzysztof Kozlowski wrote:
> On 05/04/2023 04:28, Ryan Chen wrote:
>> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
>> and description for ast2600-i2cv2.
>>
>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>> ---
>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 52 +++++++++++++++++--
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

Unreviewed. I don't understand this. It's v9 and still wrong address people.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

