Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3EE5A0FD8
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Aug 2022 14:03:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD1nv569sz3bhQ
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Aug 2022 22:03:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WdUenM7V;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WdUenM7V;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD1np06T5z3bYd
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Aug 2022 22:03:23 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id s6so16693450lfo.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Aug 2022 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/aAGWIDmltGqXOS1ncXoIYBBvj6+VUj5xGoOzvsU0MA=;
        b=WdUenM7VDQ0dUtNevmd85i9vmMaUSqNHQU4niT4Ub0JHAgEIrUdbwe9jod52jKPcLZ
         gu67LhhSXPaScJLsv3RoowAZksCBs3zCpf9jcGgkIFT5oBgyN25F/NlOaBRkgnNyVGNR
         +iyjhGFeReL/ofScX74LsFDV+4RKeyjpgIv+YXaWm1WI82ZNivhiU2PNYA/bPV1PxfmI
         igK7n+OJAPtUNlUDmZmG4JOSVXTOC11Wf+QNEodulOeyJbqfTydeuuvC+7eBjzdo7Ajy
         OZpwemzf8gfGavcsUHOo9THEM1Q6PrkRSIISVE8QtpaujETvyFl39yR6DA0aPRX4sBcq
         ddBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/aAGWIDmltGqXOS1ncXoIYBBvj6+VUj5xGoOzvsU0MA=;
        b=sMJ0jl772qNHx9qqMLn4QY4NLIcfxpaYwmxcgg8Eyoj1Vn8mu6alIWzIsPd7btrbwe
         VSHRWs6ETHo/qWl7CAHxK4fs+0yTGaWLpZCdMZrwjJeU65cgc/dollmjFExAfkrYAkvn
         MMxuP0AdwXWCj/JHn40YFikGR0GUKL6VxSigVP687R8SZcjvUOrIiBMB6t0yQDnik9V1
         9ej4qasrUb/NRHKFnduX3T/E6xOdR7E5GKsYVtHBPf4quP63dEAYJ+FLbm6ymsoFF5Ta
         /0y6C/D2yNA43iFkF+nVY+U5EGCEfTLD5LZAnxelIyLr2oottiKICjZ6QFPDh6AoQt7A
         3Tzg==
X-Gm-Message-State: ACgBeo0fTzFtIRDKqlXbI9ODyTw80jlO8hxYyIUaYNU4j7Lw7GxGi+/J
	OVGh+ZL8CiLxi3DFjNkR9OxMnA==
X-Google-Smtp-Source: AA6agR7l941MLJuNHsUITWiNqmNN3tuVDbhPikxJIUstI7F8Dic+VWnl0D5cWHe0KuARV/pswRivug==
X-Received: by 2002:a05:6512:3983:b0:492:dcac:331 with SMTP id j3-20020a056512398300b00492dcac0331mr1004792lfu.385.1661428995616;
        Thu, 25 Aug 2022 05:03:15 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id x10-20020a056512078a00b0048a757d1303sm455979lfr.217.2022.08.25.05.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 05:03:14 -0700 (PDT)
Message-ID: <cb6c855c-2931-b957-8cab-5df33de4792e@linaro.org>
Date: Thu, 25 Aug 2022 15:03:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: usb: Add missing
 (unevaluated|additional)Properties on child nodes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Xin Ji <xji@analogixsemi.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Samuel Holland <samuel@sholland.org>
References: <20220823145649.3118479-9-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-9-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
