Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CF55FE4D
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 13:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXzPH6XNZz3cf0
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 21:14:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EPawy1i0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EPawy1i0;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXzP76p86z3bwp
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 21:14:01 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id ay16so31874454ejb.6
        for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 04:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UhmgpOcezzyFajwTFaNzK7CkQEDuKl2reo2f9k791Ls=;
        b=EPawy1i0Li88//He37rCi9is/lItqMERZZbwYPZER6pZyrNX1juDwsn0d9v+DtYeJB
         LtMWBTswmNJ3hGiDDFMzXS1KU6olLcQLOpUJdrsDWRCDEZz2ai44lcCgMcxwhNcqfXBD
         90ebxDEMsWs87RNeelHOwJeNgXOK9+T6kKjAQallgo/4U5JIJgCSv+aaTHjivaYSlJ21
         jtGeq6KYeRslLak4eN/lP0CRGSwmjOUDi03hv3BGQ8+jx1GtZFKYpH+mAlDZUVF5NfSy
         tO55q9QZUUxLAxySfmJCB/L3U07Z/k3fByuK0Q/DHBH9J2Y5+1os8ojHMFa9kLtBNaQs
         ykpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UhmgpOcezzyFajwTFaNzK7CkQEDuKl2reo2f9k791Ls=;
        b=tN8wXmYo8xWi8a0Ao38NsOd3lYci+KJQwx7eE+t9TSvn9ZCK3x0JnWNeuIex3V5Uk+
         fHLCHHxdlkk1fEIye6GFWjV+Kt6tJXlwcPyoUf+K4gwNnj5KCC0ovGkVqfSOcEjLhTRf
         fYx845J79SCy2INKbpMovHwxD2Y8Gl7wxHireVYvlH3qHzdsjz9oyJJiIP2p8nZpRuTl
         sHXU0BljpSzQ2hZZNpcPsyJiw2DfuET6Jj3q1e2Iq9Vu4WInncUBXNxqeumoNHZtxTwK
         Hf9923NDicMMMKbBOW4dVdoxl6keRfkh2MBNQ3+tXWdUHXvNqmRFcnqUNtiKIEypAW0U
         LfIQ==
X-Gm-Message-State: AJIora9JLogzb9E/YoewOQrDgfI178wzEV1NkKRIyqWHLMG5aQTcvpqp
	ZJD0DZRDHzBcll1VnokRI462bQ==
X-Google-Smtp-Source: AGRyM1unLZatMNde2GWDa2eWPWHi6q6KWw4D80BqHxdj1KohpSJH6cPJnOOKCZG5LBUtQr/6jbO1Qg==
X-Received: by 2002:a17:906:284c:b0:727:3773:1a53 with SMTP id s12-20020a170906284c00b0072737731a53mr2710286ejc.765.1656501234848;
        Wed, 29 Jun 2022 04:13:54 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ov24-20020a170906fc1800b006f3ef214d9fsm7552947ejb.5.2022.06.29.04.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 04:13:54 -0700 (PDT)
Message-ID: <be1abd3a-5aa7-ec9c-5be7-e3c6bbd08979@linaro.org>
Date: Wed, 29 Jun 2022 13:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: Add AST2500/AST2600 HACE reset
 definition
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Dhananjay Phadke <dhphadke@microsoft.com>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220629094426.1930589-1-neal_liu@aspeedtech.com>
 <20220629094426.1930589-3-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629094426.1930589-3-neal_liu@aspeedtech.com>
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

On 29/06/2022 11:44, Neal Liu wrote:
> Add HACE reset bit definition for AST2500/AST2600.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> ---
>  include/dt-bindings/clock/aspeed-clock.h  | 1 +
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  2 files changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
