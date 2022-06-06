Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11453E142
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 09:23:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGlMN5t3bz3bkW
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 17:23:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pC/Qa4Kr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pC/Qa4Kr;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGlMK1GRnz303k
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Jun 2022 17:23:06 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id bg6so7342486ejb.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jun 2022 00:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vfnaQ4smw+KgX15hin83GBkysb52zahcEdPRKs8bkOg=;
        b=pC/Qa4Krj7RNRHVG7Xh2KYRWWPHMQtGRbRGIetXDGbSdVA21anYdrJYYwyALs2VMYX
         bwwypHFH2+KQRIlffVL6+2limzoOAauHSFQNHW/oGyEkz1ONR47IsM6fKybF7hEyErRV
         XHr+SYdu+p7pmxwXwDRLhQs4rS2xGiae5pEg+hJilghhdSN6xDCYTlyuBye2rfxvLr42
         1WeH3WSWNX1N+/jmI1Lo5lW15BC+EmfZww5q6/ZAnKXof2xhK6xxL0duLR99aZTrQw0Y
         Td8A6jkJDGB233rvfOV2oE9p63zaifR15tHMz7XxtHWQvzJFxVZgB7nAxkIM4DRPaW0C
         5tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vfnaQ4smw+KgX15hin83GBkysb52zahcEdPRKs8bkOg=;
        b=wRvhx0Qm4t6s4v4Ev5/BbkYRVWqJahcz2kSndlFQYuGDRYYqTQ94Jbcdt24mQ7bwTJ
         tOUkQELnA14oLK1iJJ7kGP7OawFTLeLmk7EmWwm7t45Wu6AuKJuEdllvM2l2tLDc8EGj
         QRRFSATpgwY7eTZYpD27abF0ElodaNUkGIIledD2rEewas2Wd0p591w0dxEvVWyB0RHt
         NeNR20FecSX5jT7kRAtpdXGopaNrRxap4EHhxphkGH7/DOE1qrZUxTSLM44pnnh5VVL/
         HpMd0v5vwYbIl9Gm+1dmTPAhs0MfnFf6VOcaSfTFz3NbzWpORlPXLFWqe6Thwi80XO0P
         PU7A==
X-Gm-Message-State: AOAM5326pEdyhJ+r0FnUgc/WO7PRWfk308mO3uCbePxYPq8PtcnLeou6
	57qYCozZYjz7D71Knj6uHuJDBA==
X-Google-Smtp-Source: ABdhPJzwaYd6IaBpfzwUsA4bAkGr8QzrdvNm2CozvFR5qXSLzG76K65KUqmBOt/kZPzEqwzsMibjpg==
X-Received: by 2002:a17:907:2c65:b0:70e:c2ee:781b with SMTP id ib5-20020a1709072c6500b0070ec2ee781bmr13594605ejc.281.1654500180012;
        Mon, 06 Jun 2022 00:23:00 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f12-20020a17090631cc00b006fee961b9e0sm5964547ejf.195.2022.06.06.00.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 00:22:59 -0700 (PDT)
Message-ID: <e6967010-b3a5-e0e8-4f30-97fe5a13b49a@linaro.org>
Date: Mon, 6 Jun 2022 09:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/5] dt-bindings: crypto: add documentation for aspeed
 hace
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220606064935.1458903-1-neal_liu@aspeedtech.com>
 <20220606064935.1458903-5-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220606064935.1458903-5-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 06/06/2022 08:49, Neal Liu wrote:
> Add device tree binding documentation for the Aspeed Hash
> and Crypto Engines (HACE) Controller.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
