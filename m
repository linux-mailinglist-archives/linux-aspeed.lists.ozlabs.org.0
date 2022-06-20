Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F09F6551692
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 13:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRRg26T0kz3bvH
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 21:06:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u4+Znx6d;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u4+Znx6d;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRRfv6Mb3z3bmc
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Jun 2022 21:06:45 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id u12so20343624eja.8
        for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Jun 2022 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=so8sDrLioUFy7cOL3aS8tAl9RK2+NGzjPv7D1JAQDqc=;
        b=u4+Znx6db0I1JIgKEtGzH7OPNIWp0RlAyfziZK61G7HLQXtKDmi0Zxo+Bi+wfiR/KD
         FEIbLQ2dQ5i/LOnmBPY+8bWjgkGzi81qd+XxzZGYBnmCHPfK2tQfln5FUbnvER/7fYnz
         Xf0z5hPHp3btaGed1cWbHZet8ft74tE+V/rzl+xxTSoKECBQzYh3vechswvdCqEtIyC1
         lWd4r5c5ka8n4ivrhcvum5+oEW8M4gcVlqIuHs2aoXL5DHkoRKobgS1+b0+pfyejVNs0
         IJAO81M44MsKVFwolQJsC6a0OWl/kZcXA+yPgrZnb3k2Phn+Miiyo25DoxyzYL3RRu/R
         j/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=so8sDrLioUFy7cOL3aS8tAl9RK2+NGzjPv7D1JAQDqc=;
        b=TFR4eGndGaaAbJ6budOIt22nN7ep2gcTxt2fchwSNAGmTMBZMe9Xx0MD/vGykWTZy8
         bDBI7MZR2rzVcq4DGzW79eijmO+qW7QbE/bajFUc34hbMN+Uc+S4puTMOw6e/sr5CB14
         7kNlHSrnCLPlj11U7sTTpdivKnqAD/SH7os5r0FKpCBoTEs5szHkm3Jgz3yNxH0zo+RW
         w51w44RgEWfRJ3W+0QOdheARfWcZMKJhhxn4N8jlUQF2dpDDkLGnkD3Wc4EXm73I8bYX
         MdzohRxKaQLVhbXN3HOHxNFjLJw/jlpYbAJXpo2AogzYKctFQ/+euYBcZqiXKgZ8s9T5
         Pe5Q==
X-Gm-Message-State: AJIora++NDWmp1fbom3pSgZdrRRQWi9UPsWZY8KrPtH0IRS2RZZh6UQC
	cqQbEF4Pjh06CaN4SXjbh7oofA==
X-Google-Smtp-Source: AGRyM1utaO1T4vO2p3+cLvVRr/p5V5NSZLwsZ5AVyieVsZkGXMqZnNV4gEgHvCEdu8Bh1P9TQOyRnQ==
X-Received: by 2002:a17:906:58cf:b0:711:7acb:821f with SMTP id e15-20020a17090658cf00b007117acb821fmr20292050ejs.588.1655723199682;
        Mon, 20 Jun 2022 04:06:39 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b6-20020a17090630c600b006fef51aa566sm5797606ejb.2.2022.06.20.04.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:06:39 -0700 (PDT)
Message-ID: <0207c2fe-7c01-7852-3cd1-74297cd4857d@linaro.org>
Date: Mon, 20 Jun 2022 13:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: arm: aspeed: document board compatibles
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220529104928.79636-2-krzysztof.kozlowski@linaro.org>
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

On 29/05/2022 12:49, Krzysztof Kozlowski wrote:
> Document all compatibles used in existing upstreamed Aspeed AST2400,
> AST2500 and AST2600 based boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/arm/aspeed/aspeed.yaml           | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml

Joel, Andrew,

Any comments on the series? Rob applied only patch 1, so the rest is
supposed through Aspeed tree. Shall I pick them up and send to arm-soc?

Best regards,
Krzysztof
