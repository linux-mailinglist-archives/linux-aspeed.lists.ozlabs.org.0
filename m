Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2292753069
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 06:12:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ccczWNKO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2J3V43gVz3c2K
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 14:12:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ccczWNKO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2J3L3tn8z2xr6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 14:12:30 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso13622545e9.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jul 2023 21:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689307946; x=1691899946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0om7TZyUtm78+G+6P856aCHHrm1f5f1KaX3wUrCTAY=;
        b=ccczWNKODZuxkRpCg56pFlAaZdQRexz9nkS8tlC/ZdzAfGtdQ7nZ1awhlh+/BomWyx
         5BdcclPjEkThLWEV8IH5urqxA2zYVv3RSNPbwp+Ldrkk68PnG/DDzCTpNjxtmxn9bbu8
         sScBjzCiOzSl26cwhrYen9VMYqMOWNP9a0EBjrokc2xFiuRz9EVmEL8RqB029L+4IpTu
         5K7L6NNTrMK5+dnmEMxrRuvwRIqBNp5eyMjp6EIMkDr2ve9FGv/xzhDZWkIckiUF6pVt
         /KaJ0PKvC6H4DbG2iqHFmWn02efNj6CIx67rNmxCdhyiDAxMunEIaoB9FMFDxnRwZqZP
         gnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689307946; x=1691899946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0om7TZyUtm78+G+6P856aCHHrm1f5f1KaX3wUrCTAY=;
        b=NHxMgJQZZ1gm1jDbw+ir2LJLZvbW9iZRydFACdDqhaUTHp5X/9B/bnqp6gCyaFXX26
         M7hBFlEXhp1sNiWaZQbpFsKnVjoQwxwV+h9RM/d0VqPTUbDviZVEd7wEwmTNb40am25M
         wivNXbsppy5i+VE4dbNzNX7jmDs8ixwvbt7R0Az/hmgCD3v6zahlrv/fk5NQQnTX6WOX
         MDSqITDftAXwY/Tj4a66MUQe0Zh82fGj/fRlhspHriq6OcNw5TFMM3HgD0Y/Zq43mvN4
         c6GljJB9uDwbcxqDznIAngR3RPgwYQ6jN+gwVvntA+4c3K8FBlwrarufu5gtWNlb3z74
         KeOw==
X-Gm-Message-State: ABy/qLYZvxRWsgb+MGKaLqrG1ia/Qde6Yvc+3eHNfJUJvPy6/NJvFftA
	7uxOAaoArFHhLKzFvbT2u8t7RNIDlDMQWf0eVQc=
X-Google-Smtp-Source: APBJJlFirpaQfMgeNnJNmqD/IIFh+MZqYnv5ScO0xHnlU6ErTOZlfdl92D5b5W6MJdqzRwxs+uoReg==
X-Received: by 2002:a5d:4641:0:b0:313:f0ef:1e55 with SMTP id j1-20020a5d4641000000b00313f0ef1e55mr2799626wrs.37.1689307946155;
        Thu, 13 Jul 2023 21:12:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r7-20020a5d6947000000b00313fd294d6csm9783978wrw.7.2023.07.13.21.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 21:12:25 -0700 (PDT)
Message-ID: <58b40977-5223-7431-3c0e-dcf87bf1ef3f@linaro.org>
Date: Fri, 14 Jul 2023 06:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230712073752.54624-3-Delphine_CC_Chiu@wiwynn.com>
 <20230714023502.3225096-1-Delphine_CC_Chiu@wiwynn.com>
 <20230714023502.3225096-2-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714023502.3225096-2-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 14/07/2023 04:34, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Yosemite V4.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v6.4/source/Documentation/process/submitting-patches.rst#L552

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

