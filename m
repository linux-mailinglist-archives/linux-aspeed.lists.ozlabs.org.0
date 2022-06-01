Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F114539EA7
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 09:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCh5j4Rfzz3bkg
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 17:45:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qhdsg4Ya;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qhdsg4Ya;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCh5d6jYcz305D
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Jun 2022 17:45:40 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id n10so1985524ejk.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Jun 2022 00:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=icaxq30mttf79C4R9dYRsj76DdZgYPdfcBXzW0d+jXk=;
        b=qhdsg4Ya4YN7Vaxx4KRqhrWlzhNNHdf0PVdqfG2J6C64ZYh4eb930sm0pQWNlvi5fz
         e8MtDtNaaVfEvSo2ezzPWrRLXro7Sqa26fIPFSbaCr+rJ0K5llS8sj1WuXS0ZDeTRMW1
         Lla3hXfeN1OxJw12hVjMokIA+Gg3SyEJ/1OccTNwV4hxjUV6DOmLxRNU0yqHr1WBheJA
         DKAN/4VPGv+Rrlo/v4AXp1Snc9fqApNwGr7Sp7dRydFF6Uesn3rngsZOtwm7jmbM10Py
         IXF8drlRGeO2+SbhjYcSN+V7StztXVXY7g8jUAjlpSxc7L9HE7C7byGXkP65BsiWnwF1
         DWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=icaxq30mttf79C4R9dYRsj76DdZgYPdfcBXzW0d+jXk=;
        b=k1ySnvH9+2kX2sZyzM9iQITv6crG2A4iX3qYBMrpqF+SzlGnjhQL9L5y4horhyYvpn
         rwEO6AENYqkb71/yk7UCvwFZVcX535Nu5sWgexkt4Q2tvSeN6JNhs62wyZZ3j3y6vENy
         8U+Kofud5s1wNjUaVoCCxcfzlX6yC6wABvgxghaA8IEtzle1K1N52bngkFdAiFMFvWex
         14xODshyeJ1etBCu+6djrJcNcoknLHnBs2IFMI7QhAcMsqGJ3bstoZOq00CPi+orV87+
         XTeHhwsM4pSntNKBEEuP4wCBGRzPWmi43X0HlknfpYaDCvO3CTU6j5RL1TrybI9UsoXR
         IQlw==
X-Gm-Message-State: AOAM532+A9nVmM70QUa6InO4pIbCAacUyjo/BnYwVCF2vASuvvBVrmem
	NRaf593ZwyiEuLJnoIiUHiHQKQ==
X-Google-Smtp-Source: ABdhPJxtNxlX3e7jclB2CRDTCFsHDIgFhYwHQFha34skmH3sd1hturimO7g/4A+a4S/XrA/j28pXsQ==
X-Received: by 2002:a17:907:7f06:b0:6fe:b81f:f885 with SMTP id qf6-20020a1709077f0600b006feb81ff885mr48271947ejc.621.1654069537754;
        Wed, 01 Jun 2022 00:45:37 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e20-20020a056402149400b0042bd75c53casm517464edv.83.2022.06.01.00.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:45:37 -0700 (PDT)
Message-ID: <c2f1621e-21d0-3836-6bb2-c1fb038856c5@linaro.org>
Date: Wed, 1 Jun 2022 09:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/5] dt-bindings: clock: Add AST2600 HACE reset definition
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220601054204.1522976-1-neal_liu@aspeedtech.com>
 <20220601054204.1522976-3-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601054204.1522976-3-neal_liu@aspeedtech.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 01/06/2022 07:42, Neal Liu wrote:
> Add HACE reset bit definition for ast2600.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof
